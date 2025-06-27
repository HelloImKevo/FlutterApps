import 'dart:async';
import 'package:hacker_news/src/repository/enhanced_news_repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/item_model.dart';
import 'package:logger/logger.dart';

class StoriesBloc {
  final logger = Logger();
  final EnhancedNewsRepository _repository =
      EnhancedNewsRepository.getInstance();

  /// Manages the ordered list of top story IDs from HackerNews API
  final _topIdsController = BehaviorSubject<List<int>>.seeded(<int>[]);

  /// Cache of fetched story items, keyed by story ID for quick lookup
  final _itemsController =
      BehaviorSubject<Map<int, ItemModel>>.seeded(<int, ItemModel>{});

  /// Tracks whether stories are currently being loaded
  final _loadingController = BehaviorSubject<bool>.seeded(false);

  /// Holds error messages from failed API calls or data operations
  final _errorController = BehaviorSubject<String?>.seeded(null);

  // Public streams
  Stream<List<int>> get topIds => _topIdsController.stream;
  Stream<Map<int, ItemModel>> get items => _itemsController.stream;
  Stream<bool> get loading => _loadingController.stream;
  Stream<String?> get error => _errorController.stream;

  /// Combines story IDs with their cached data to provide ordered story list
  Stream<List<ItemModel>> get stories => Rx.combineLatest2(
        topIds,
        items,
        (List<int> ids, Map<int, ItemModel> itemsMap) {
          return ids
              .where((id) => itemsMap.containsKey(id))
              .map((id) => itemsMap[id]!)
              .toList();
        },
      );

  /// Fetches the top story IDs from the repository
  Future<void> fetchTopIds() async {
    try {
      _loadingController.add(true);
      _errorController.add(null);

      logger.d('StoriesBloc: Fetching top story IDs');
      final ids = await _repository.fetchTopIds();

      logger.d('StoriesBloc: Received ${ids.length} top story IDs');
      _topIdsController.add(ids);

      // Start fetching the actual stories
      await _fetchStories(ids.take(20).toList()); // Fetch first 20 stories
    } catch (e) {
      logger.e('StoriesBloc: Error fetching top IDs: $e');
      _errorController.add('Failed to fetch top stories: $e');
    } finally {
      _loadingController.add(false);
    }
  }

  /// Fetches story items by their IDs using enhanced batch fetching
  Future<void> _fetchStories(List<int> ids) async {
    try {
      logger.d(
          'StoriesBloc: Fetching ${ids.length} stories with enhanced repository');
      final currentItems = Map<int, ItemModel>.from(_itemsController.value);

      // Filter out already cached items
      final uncachedIds =
          ids.where((id) => !currentItems.containsKey(id)).toList();

      if (uncachedIds.isNotEmpty) {
        // Use batch fetching for better performance
        final fetchedItems = await _repository.fetchItems(uncachedIds);

        // Add fetched items to current map
        for (final item in fetchedItems) {
          currentItems[item.id] = item;
        }

        _itemsController.add(Map.from(currentItems));
        logger.d(
            'StoriesBloc: Fetched ${fetchedItems.length} new stories, ${currentItems.length} total');
      } else {
        logger.d('StoriesBloc: All ${ids.length} stories already cached');
      }
    } catch (e) {
      logger.e('StoriesBloc: Error fetching stories: $e');
      _errorController.add('Failed to fetch stories: $e');
    }
  }

  /// Loads more stories (pagination)
  Future<void> loadMoreStories() async {
    final currentIds = _topIdsController.value;
    final currentItems = _itemsController.value;

    if (currentIds.isEmpty) return;

    final loadedCount = currentItems.length;
    final nextBatch = currentIds.skip(loadedCount).take(10).toList();

    if (nextBatch.isNotEmpty) {
      await _fetchStories(nextBatch);
    }
  }

  /// Refreshes all stories
  Future<void> refresh() async {
    _itemsController.add(<int, ItemModel>{});
    await fetchTopIds();
  }

  /// Clears the cache
  Future<void> clearCache() async {
    try {
      await _repository.clearAllCaches();
      _itemsController.add(<int, ItemModel>{});
      logger.d('StoriesBloc: Cache cleared');
    } catch (e) {
      logger.e('StoriesBloc: Error clearing cache: $e');
      _errorController.add('Failed to clear cache: $e');
    }
  }

  /// Clears only the memory cache (keeps database cache)
  void clearMemoryCache() {
    _repository.clearMemoryCache();
    logger.d('StoriesBloc: Memory cache cleared');
  }

  /// Gets performance statistics from the enhanced repository
  CachePerformanceStats get performanceStats => _repository.performanceStats;

  /// Performs maintenance on the caches
  void performCacheMaintenance() {
    _repository.performMaintenance();
    logger.d('StoriesBloc: Cache maintenance performed');
  }

  /// Warms the cache with priority story IDs
  Future<void> warmCache(List<int> priorityIds) async {
    try {
      logger.d(
          'StoriesBloc: Warming cache with ${priorityIds.length} priority items');
      await _repository.warmCache(priorityIds);
    } catch (e) {
      logger.e('StoriesBloc: Error warming cache: $e');
    }
  }

  /// Dispose of resources
  void dispose() {
    _topIdsController.close();
    _itemsController.close();
    _loadingController.close();
    _errorController.close();
  }
}
