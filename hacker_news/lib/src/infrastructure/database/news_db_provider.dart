import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'package:hacker_news/src/models/item_model.dart';
import 'package:hacker_news/src/infrastructure/database/db_schema.dart';
import 'package:hacker_news/src/infrastructure/database/db_utils.dart';
import 'package:hacker_news/src/repository/news_datasource.dart';

/// A database provider that manages local storage of Hacker News items.
///
/// This class acts as a bridge between your app and a local SQLite database,
/// allowing you to store and retrieve news articles on the device for faster
/// access and offline reading. Think of it as a local filing cabinet where
/// you can quickly find previously downloaded articles without needing an
/// internet connection.
///
/// ## What This Class Does:
/// - **Creates and manages a local database** on your device to store news
/// - **Saves articles** downloaded from the internet for quick future access
/// - **Retrieves saved articles** much faster than downloading them again
/// - **Handles data conversion** between Dart objects and database format
/// - **Provides offline access** to previously viewed articles
///
/// ## Benefits:
/// - **Faster loading**: Articles load instantly from local storage
/// - **Offline reading**: Access saved articles without internet
/// - **Reduced data usage**: Avoid re-downloading the same articles
/// - **Better user experience**: No waiting for network requests
/// - **Battery savings**: Less network activity means longer battery life
///
/// ## How It Works:
/// When you first open an article, this class:
/// 1. Checks if the article is already saved locally
/// 2. If not found, it will be saved after downloading from the internet
/// 3. Next time you want that article, it loads instantly from local storage
///
/// ## Technical Implementation:
/// This class implements two interfaces:
/// - `NewsDataSource`: Allows fetching individual news articles
/// - `NewsItemCache`: Provides caching functionality for storing articles
///
/// The database is stored in your device's documents directory and uses
/// SQLite, which is a lightweight database perfect for mobile apps.
class NewsDbProvider implements NewsDataSource, NewsItemCache {
  /// Boolean fields that need conversion between Dart and SQLite formats.
  ///
  /// SQLite doesn't have a native boolean type, so we store booleans as
  /// integers (0 for false, 1 for true). This constant centralizes the
  /// list of fields that need this conversion.
  static const List<String> _booleanFields = ['deleted', 'dead'];

  /// The actual database connection object.
  ///
  /// This is kept private (indicated by the underscore) and is only created
  /// when first needed. Think of it as the actual connection to your local
  /// filing cabinet - you only open it when you need to store or retrieve
  /// something.
  Database? _db;

  /// Completer to ensure thread-safe database initialization.
  ///
  /// This prevents multiple concurrent calls from creating multiple database
  /// instances, which could lead to data corruption or memory leaks.
  Completer<Database>? _dbCompleter;

  /// Gets the database connection, creating it if it doesn't exist yet.
  ///
  /// This is called a "getter" - it looks like a property but actually runs
  /// code when accessed. It ensures the database is always ready when needed.
  /// If the database hasn't been created yet, it automatically creates and
  /// sets it up for you.
  ///
  /// **Why this is useful:**
  /// - Lazy initialization: Database is only created when actually needed
  /// - Memory efficient: Doesn't waste resources until required
  /// - Thread safe: Ensures only one database connection exists
  /// - Race condition safe: Multiple concurrent calls won't create duplicates
  ///
  /// Returns a [Future<Database>] because database operations take time and
  /// shouldn't block your app's user interface.
  Future<Database> get database async {
    // If database is already initialized, return it immediately
    if (_db != null) return _db!;

    // If initialization is in progress, wait for it to complete
    if (_dbCompleter != null) return _dbCompleter!.future;

    // Start initialization process
    _dbCompleter = Completer<Database>();

    try {
      _db = await _initDb();
      _dbCompleter!.complete(_db!);
      return _db!;
    } catch (error) {
      _dbCompleter!.completeError(error);
      _dbCompleter = null; // Reset so initialization can be retried
      rethrow;
    }
  }

  /// Creates and initializes the database file on the device.
  ///
  /// This private method (indicated by the underscore) handles the technical
  /// details of setting up your local storage. It's like creating a new
  /// filing cabinet and organizing it with the right folders and labels.
  ///
  /// **What this method does:**
  /// 1. **Finds the right location**: Uses the device's documents directory
  /// 2. **Creates the database file**: Sets up a file called 'items.db'
  /// 3. **Defines the structure**: Creates tables to organize the data
  /// 4. **Sets up relationships**: Ensures data is stored efficiently
  ///
  /// **Why it's private:**
  /// - Internal implementation detail that users don't need to worry about
  /// - Keeps the public interface simple and clean
  /// - Prevents accidental misuse of initialization logic
  ///
  /// The database file is stored in the app's documents directory, which is:
  /// - **Persistent**: Survives app restarts and updates
  /// - **Private**: Only accessible by this app
  /// - **Backed up**: Included in device backups (iOS/Android)
  ///
  /// **Error handling:**
  /// - Catches file system errors (storage full, permissions denied)
  /// - Handles database creation failures
  /// - Provides meaningful error messages for debugging
  ///
  /// Returns a [Future<Database>] representing the initialized database.
  ///
  /// Throws [DatabaseException] if initialization fails.
  Future<Database> _initDb() async {
    try {
      final documentsDirectory = await getApplicationDocumentsDirectory();
      final path = '${documentsDirectory.path}/items.db';

      return await openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(createItemsTable);
        },
      );
    } catch (e) {
      throw DatabaseException('Failed to initialize database: $e');
    }
  }

  /// Retrieves a specific news article from local storage by its unique ID.
  ///
  /// This method searches your local database for a previously saved article.
  /// Think of it like looking up a specific book in a library using its
  /// catalog number - if the book exists, you get it instantly; if not,
  /// you get nothing (null).
  ///
  /// **How it works:**
  /// 1. **Searches the database**: Looks for an article with the given ID
  /// 2. **Processes the data**: Converts database format to app format
  /// 3. **Returns the article**: Gives you a complete ItemModel object
  /// 4. **Handles missing items**: Returns null if the article isn't saved
  ///
  /// **Parameters:**
  /// - [id]: The unique identifier of the article you want to retrieve
  ///
  /// **Returns:**
  /// - [Future<ItemModel?>]: The article if found, or null if not in storage
  ///
  /// **Benefits:**
  /// - **Instant access**: No waiting for internet downloads
  /// - **Offline capability**: Works without network connection
  /// - **Reduced data usage**: No unnecessary API calls
  /// - **Better performance**: Local database is much faster than network
  ///
  /// **Example usage:**
  /// ```dart
  /// final article = await newsDb.fetchItem(12345);
  /// if (article != null) {
  ///   print('Found cached article: ${article.title}');
  /// } else {
  ///   print('Article not in local storage');
  /// }
  /// ```
  @override
  Future<ItemModel?> fetchItem(int id) async {
    try {
      final db = await database;
      final maps = await db.query(
        itemsTableName,
        columns: null,
        where: 'id = ?',
        whereArgs: [id],
      );

      if (maps.isNotEmpty) {
        // Create a copy to avoid mutating the original map
        final map = Map<String, dynamic>.from(maps.first);
        final processedMap = preprocessDbMapSafe(map, _booleanFields);
        return ItemModel.fromJson(processedMap);
      }

      return null;
    } catch (e) {
      throw DatabaseException('Failed to fetch item $id: $e');
    }
  }

  /// Saves a news article to local storage for future quick access.
  ///
  /// This method takes an article that was downloaded from the internet and
  /// stores it in your device's local database. It's like taking a newspaper
  /// article and filing it in your personal collection for later reading.
  ///
  /// **How it works:**
  /// 1. **Converts the article**: Changes from app format to database format
  /// 2. **Handles data types**: Converts boolean values to numbers for storage
  /// 3. **Saves to database**: Stores the article with all its information
  /// 4. **Prevents duplicates**: Replaces existing articles with the same ID
  ///
  /// **Parameters:**
  /// - [item]: The complete news article to save (title, text, author, etc.)
  ///
  /// **Returns:**
  /// - [Future<int>]: The ID of the saved article (useful for confirmation)
  ///
  /// **Benefits:**
  /// - **Persistent storage**: Article remains saved even after app restart
  /// - **Instant future access**: Next time you want this article, it loads
  ///   immediately
  /// - **Offline reading**: Access the article without internet connection
  /// - **Data efficiency**: No need to download the same article multiple times
  ///
  /// **Technical details:**
  /// - Uses "replace" strategy: If an article with the same ID already exists,
  ///   it gets updated with the new data
  /// - Automatically converts boolean fields (like 'deleted', 'dead') to
  ///   integers because SQLite databases prefer numbers over true/false values
  ///
  /// **Example usage:**
  /// ```dart
  /// final savedId = await newsDb.addItem(downloadedArticle);
  /// print('Article saved with ID: $savedId');
  /// ```
  @override
  Future<int> addItem(ItemModel item) async {
    try {
      final db = await database;

      // Create a copy to avoid mutating the original item
      final itemMap = Map<String, dynamic>.from(item.toJson());
      final processedMap =
          convertBooleansToIntegersSafe(itemMap, _booleanFields);

      return await db.insert(
        itemsTableName,
        processedMap,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      throw DatabaseException('Failed to add item ${item.id}: $e');
    }
  }

  /// Removes all saved articles from local storage.
  ///
  /// This method completely empties your local article collection, like
  /// clearing out an entire filing cabinet. After calling this, all
  /// previously saved articles will be gone and will need to be downloaded
  /// again from the internet if you want to read them.
  ///
  /// **When you might use this:**
  /// - **Free up storage space**: Remove old articles to save device memory
  /// - **Fresh start**: Clear cache when data might be outdated
  /// - **Testing purposes**: Reset the database during development
  /// - **User preference**: Provide a "clear cache" option in settings
  /// - **Privacy concerns**: Remove all local data when logging out
  ///
  /// **What happens:**
  /// 1. **Connects to database**: Opens your local storage
  /// 2. **Deletes all articles**: Removes every saved news item
  /// 3. **Confirms completion**: Returns when the operation is finished
  ///
  /// **Returns:**
  /// - [Future<void>]: Completes when all articles have been removed
  ///
  /// **Important notes:**
  /// - **Irreversible action**: Once cleared, articles cannot be recovered
  /// - **No network impact**: Only affects local storage, not the internet
  /// - **Database structure remains**: Only data is deleted, not the database
  ///   itself
  /// - **App continues working**: You can still download and save new articles
  ///
  /// **Performance impact:**
  /// - After clearing cache, articles will load slower until re-cached
  /// - Increased data usage as articles need to be re-downloaded
  /// - More battery usage due to additional network requests
  ///
  /// **Example usage:**
  /// ```dart
  /// await newsDb.clearCache();
  /// print('All cached articles have been removed');
  /// ```
  @override
  Future<void> clearCache() async {
    try {
      final db = await database;
      await db.delete(itemsTableName);
    } catch (e) {
      throw DatabaseException('Failed to clear cache: $e');
    }
  }
}

/// Custom exception for database-related errors.
///
/// This exception provides meaningful error messages when database operations
/// fail, making it easier to debug issues and provide better user feedback.
///
/// Common scenarios that trigger this exception:
/// - Storage device is full
/// - Database file permissions are denied
/// - Database schema creation fails
/// - Network storage is unavailable
class DatabaseException implements Exception {
  /// The error message describing what went wrong
  final String message;

  /// Creates a new database exception with the given error message
  DatabaseException(this.message);

  @override
  String toString() => 'DatabaseException: $message';
}
