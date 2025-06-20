import 'package:hacker_news/src/infrastructure/database/news_db_provider.dart';
import 'package:hacker_news/src/infrastructure/network/news_api_provider.dart';
import 'package:hacker_news/src/models/item_model.dart';
import 'package:hacker_news/src/repository/news_datasource.dart';
import 'package:logger/logger.dart';

/// A repository that coordinates access to news data from various sources.
///
/// This class implements the repository pattern, abstracting away the details
/// of data sources (API and database) from the rest of the application.
class NewsRepository implements NewsDataSource, TopIdsSource {
  // Log tag constant for consistent logging
  static const String logTag = 'NewsRepository';

  /// Primary database provider - used first for fetching and as a cache
  final NewsDataSource dbProvider;

  /// Primary API provider - used when data isn't found in cache
  final NewsDataSource apiProvider;

  /// Additional data sources that can be queried after primary sources
  final List<NewsDataSource> secondarySources;

  /// Interface for fetching top IDs
  final TopIdsSource topIdsSource;

  /// Interface for caching Hacker News items in local storage
  final NewsItemCache itemCache;

  final Logger logger = Logger();

  NewsRepository({
    required this.dbProvider,
    required this.apiProvider,
    this.secondarySources = const [],
  })  : topIdsSource = apiProvider as TopIdsSource,
        itemCache = dbProvider as NewsItemCache;

  /// Singleton instance of the repository
  static final NewsRepository _instance = NewsRepository(
    dbProvider: NewsDbProvider(),
    apiProvider: NewsApiProvider(),
    secondarySources: [],
  );

  /// Factory constructor to return the singleton instance
  factory NewsRepository.getInstance() => _instance;

  /// Creates a repository instance with custom secondary sources
  ///
  /// Example usage:
  /// ```dart
  /// final repository = NewsRepository.withSecondarySources([
  ///   RssNewsProvider('https://example.com/rss'),
  ///   SocialMediaProvider(platform: 'twitter', apiKey: 'your-api-key'),
  /// ]);
  /// ```
  factory NewsRepository.withSecondarySources(
      List<NewsDataSource> secondarySources) {
    return NewsRepository(
      dbProvider: NewsDbProvider(),
      apiProvider: NewsApiProvider(),
      secondarySources: secondarySources,
    );
  }

  @override
  Future<List<int>> fetchTopIds() async {
    logger.d('$logTag: Fetching top IDs from API');
    // We always fetch top IDs from the API to ensure they're up to date
    return await topIdsSource.fetchTopIds();
  }

  @override
  Future<ItemModel?> fetchItem(int id) async {
    // Try to get the item from the database first
    var item = await dbProvider.fetchItem(id);

    if (item != null) {
      logger.d('$logTag: Item $id found in database');
      return item;
    }

    // If not in the database, fetch from the primary API
    logger.d(
        '$logTag: Item $id not found in database, fetching from primary API');
    item = await apiProvider.fetchItem(id);

    // If found in primary API, cache and return it
    if (item != null) {
      logger.d('$logTag: Caching item $id in database');
      await itemCache.addItem(item);
      return item;
    }

    // If not found in primary sources, try secondary sources
    if (secondarySources.isNotEmpty) {
      logger.d(
          '$logTag: Item $id not found in primary sources, trying secondary sources');

      for (final source in secondarySources) {
        item = await source.fetchItem(id);
        if (item != null) {
          logger.d('$logTag: Item $id found in secondary source');
          // Cache items from secondary sources too
          await itemCache.addItem(item);
          return item;
        }
      }
    }

    logger.d('$logTag: Item $id not found in any source');
    return null;
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
    await itemCache.clearCache();
    logger.d('$logTag: Cache cleared');
  }
}
