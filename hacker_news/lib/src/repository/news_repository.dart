import 'package:hacker_news/src/infrastructure/database/news_db_provider.dart';
import 'package:hacker_news/src/infrastructure/network/news_api_provider.dart';
import 'package:hacker_news/src/models/item_model.dart';
import 'package:hacker_news/src/repository/news_datasource.dart';
import 'package:hacker_news/src/infrastructure/database/db_schema.dart'; // Added for itemsTableName
import 'package:logger/logger.dart';

/// A repository that coordinates access to news data from various sources.
///
/// This class implements the repository pattern, abstracting away the details
/// of data sources (API and database) from the rest of the application.
class NewsRepository implements NewsDataSource, TopIdsSource {
  // Log tag constant for consistent logging
  static const String logTag = 'NewsRepository';

  final NewsDbProvider dbProvider;
  final NewsApiProvider apiProvider;
  final Logger logger = Logger();

  NewsRepository({required this.dbProvider, required this.apiProvider});

  /// Singleton instance of the repository
  static final NewsRepository _instance = NewsRepository(
    dbProvider: NewsDbProvider(),
    apiProvider: NewsApiProvider(),
  );

  /// Factory constructor to return the singleton instance
  factory NewsRepository.getInstance() => _instance;

  @override
  Future<List<int>> fetchTopIds() async {
    logger.d('$logTag: Fetching top IDs from API');
    // We always fetch top IDs from the API to ensure they're up to date
    return await apiProvider.fetchTopIds();
  }

  @override
  Future<ItemModel?> fetchItem(int id) async {
    // Try to get the item from the database first
    var item = await dbProvider.fetchItem(id);

    if (item != null) {
      logger.d('$logTag: Item $id found in database');
      return item;
    }

    // If not in the database, fetch from the API
    logger.d('$logTag: Item $id not found in database, fetching from API');
    item = await apiProvider.fetchItem(id);

    // If we got an item from the API, store it in the database
    if (item != null) {
      logger.d('$logTag: Caching item $id in database');
      await dbProvider.addItem(item);
    } else {
      logger.d('$logTag: Item $id not found in API');
    }

    return item;
  }

  /// Fetches multiple items by their IDs
  Future<List<ItemModel>> fetchItems(List<int> ids) async {
    final List<ItemModel> items = [];

    for (var id in ids) {
      final item = await fetchItem(id);
      if (item != null) {
        items.add(item);
      }
    }

    return items;
  }

  /// Clears the database cache
  Future<void> clearCache() async {
    final db = await dbProvider.database;
    await db.delete(itemsTableName);
    logger.d('$logTag: Cache cleared');
  }
}
