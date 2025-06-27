import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_news/src/repository/enhanced_news_repository.dart';
import 'package:hacker_news/src/repository/news_datasource.dart';
import 'package:hacker_news/src/infrastructure/cache/memory_cache.dart';
import 'package:hacker_news/src/models/item_model.dart';

void main() {
  group('EnhancedNewsRepository', () {
    late EnhancedNewsRepository repository;
    late MockNewsDataSource mockDbProvider;
    late MockNewsDataSource mockApiProvider;
    late MemoryCache mockMemoryCache;

    setUp(() {
      mockMemoryCache = MemoryCache(maxSize: 100);
      mockDbProvider = MockNewsDataSource();
      mockApiProvider = MockNewsDataSource();

      repository = EnhancedNewsRepository(
        memoryCache: mockMemoryCache,
        dbProvider: mockDbProvider,
        apiProvider: mockApiProvider,
      );
    });

    test('should fetch item from memory cache first (fastest path)', () async {
      final testItem = _createTestItem(1, 'Test Story');

      // Pre-populate memory cache
      mockMemoryCache.put(1, testItem);

      final result = await repository.fetchItem(1);

      expect(result, equals(testItem));
      expect(mockDbProvider.fetchCallCount, equals(0));
      expect(mockApiProvider.fetchCallCount, equals(0));
    });

    test('should fetch from database when not in memory cache', () async {
      final testItem = _createTestItem(1, 'Test Story');

      // Setup database to return the item
      mockDbProvider.mockItems[1] = testItem;

      final result = await repository.fetchItem(1);

      expect(result, equals(testItem));
      expect(mockDbProvider.fetchCallCount, equals(1));
      expect(mockApiProvider.fetchCallCount, equals(0));

      // Verify item was promoted to memory cache
      expect(mockMemoryCache.get(1), equals(testItem));
    });

    test('should fetch from API when not in cache or database', () async {
      final testItem = _createTestItem(1, 'Test Story');

      // Setup API to return the item
      mockApiProvider.mockItems[1] = testItem;

      final result = await repository.fetchItem(1);

      expect(result, equals(testItem));
      expect(mockDbProvider.fetchCallCount, equals(1));
      expect(mockApiProvider.fetchCallCount, equals(1));

      // Verify item was cached in both tiers
      expect(mockMemoryCache.get(1), equals(testItem));
      expect(mockDbProvider.addedItems.contains(testItem), isTrue);
    });

    test('should return null when item not found anywhere', () async {
      final result = await repository.fetchItem(999);

      expect(result, isNull);
      expect(mockDbProvider.fetchCallCount, equals(1));
      expect(mockApiProvider.fetchCallCount, equals(1));
    });

    test('should fetch top IDs from API and prefetch top stories', () async {
      final topIds = [1, 2, 3, 4, 5];
      final testItems =
          topIds.map((id) => _createTestItem(id, 'Story $id')).toList();

      // Setup API to return top IDs and items
      mockApiProvider.mockTopIds = topIds;
      for (int i = 0; i < testItems.length; i++) {
        mockApiProvider.mockItems[topIds[i]] = testItems[i];
      }

      final result = await repository.fetchTopIds();

      expect(result, equals(topIds));
      expect(mockApiProvider.fetchTopIdsCallCount, equals(1));

      // Allow some time for background prefetching
      await Future.delayed(const Duration(milliseconds: 100));

      // Verify some items were prefetched (first 10 or less)
      expect(mockApiProvider.fetchCallCount, greaterThan(0));
    });

    test('should handle batch fetching efficiently', () async {
      final ids = [1, 2, 3, 4, 5];
      final testItems =
          ids.map((id) => _createTestItem(id, 'Story $id')).toList();

      // Pre-populate memory cache with some items
      mockMemoryCache.put(1, testItems[0]);
      mockMemoryCache.put(2, testItems[1]);

      // Setup API for remaining items
      mockApiProvider.mockItems[3] = testItems[2];
      mockApiProvider.mockItems[4] = testItems[3];
      mockApiProvider.mockItems[5] = testItems[4];

      final result = await repository.fetchItems(ids);

      expect(result.length, equals(5));
      expect(result.map((item) => item.id).toSet(), equals(ids.toSet()));

      // Verify cache hits and API calls
      expect(
          mockApiProvider.fetchCallCount, equals(3)); // Only for items 3, 4, 5
    });

    test('should track performance statistics correctly', () async {
      final testItem1 = _createTestItem(1, 'Story 1');
      final testItem2 = _createTestItem(2, 'Story 2');

      // Setup memory cache hit
      mockMemoryCache.put(1, testItem1);

      // Setup API fetch
      mockApiProvider.mockItems[2] = testItem2;

      // Perform operations
      await repository.fetchItem(1); // Cache hit
      await repository.fetchItem(2); // Cache miss -> API call

      final stats = repository.performanceStats;

      expect(stats.totalCacheHits, equals(1));
      expect(stats.totalCacheMisses, equals(1));
      expect(stats.totalApiCalls, greaterThan(0));
      expect(stats.cacheHitRate, equals(50.0));
    });

    test('should clear all caches', () async {
      final testItem = _createTestItem(1, 'Test Story');

      // Add item to memory cache
      mockMemoryCache.put(1, testItem);

      // Add item to database
      mockDbProvider.mockItems[1] = testItem;

      await repository.clearAllCaches();

      expect(mockMemoryCache.get(1), isNull);
      expect(mockDbProvider.clearCacheCallCount, equals(1));

      // Verify stats are reset
      final stats = repository.performanceStats;
      expect(stats.totalCacheHits, equals(0));
      expect(stats.totalCacheMisses, equals(0));
      expect(stats.totalApiCalls, equals(0));
    });

    test('should clear only memory cache', () {
      final testItem = _createTestItem(1, 'Test Story');

      // Add item to memory cache
      mockMemoryCache.put(1, testItem);

      repository.clearMemoryCache();

      expect(mockMemoryCache.get(1), isNull);
    });

    test('should perform cache warming', () async {
      final priorityIds = [1, 2, 3];
      final testItems =
          priorityIds.map((id) => _createTestItem(id, 'Story $id')).toList();

      // Setup API for priority items
      for (int i = 0; i < testItems.length; i++) {
        mockApiProvider.mockItems[priorityIds[i]] = testItems[i];
      }

      await repository.warmCache(priorityIds);

      // Verify all priority items were fetched and cached
      for (final id in priorityIds) {
        expect(mockMemoryCache.get(id), isNotNull);
      }
    });

    test('should handle errors gracefully', () async {
      mockApiProvider.shouldThrowError = true;

      final result = await repository.fetchItem(1);

      expect(result, isNull);
      expect(mockDbProvider.fetchCallCount, equals(1));
      expect(mockApiProvider.fetchCallCount, equals(1));
    });

    test('should perform maintenance on memory cache', () {
      // Add an item that will expire
      final testItem = _createTestItem(1, 'Test Story');
      mockMemoryCache.put(1, testItem, ttlMinutes: 0); // Expired immediately

      repository.performMaintenance();

      // Expired item should be removed
      expect(mockMemoryCache.get(1), isNull);
    });

    test('should use singleton instance correctly', () {
      final instance1 = EnhancedNewsRepository.getInstance();
      final instance2 = EnhancedNewsRepository.getInstance();

      expect(identical(instance1, instance2), isTrue);
    });
  });
}

/// Mock implementation of NewsDataSource for testing
class MockNewsDataSource
    implements NewsDataSource, TopIdsSource, NewsItemCache {
  Map<int, ItemModel> mockItems = {};
  List<int> mockTopIds = [];
  List<ItemModel> addedItems = [];
  bool shouldThrowError = false;

  int fetchCallCount = 0;
  int fetchTopIdsCallCount = 0;
  int addItemCallCount = 0;
  int clearCacheCallCount = 0;

  @override
  Future<ItemModel?> fetchItem(int id) async {
    fetchCallCount++;

    if (shouldThrowError) {
      throw Exception('Mock error');
    }

    return mockItems[id];
  }

  @override
  Future<List<int>> fetchTopIds() async {
    fetchTopIdsCallCount++;

    if (shouldThrowError) {
      throw Exception('Mock error');
    }

    return mockTopIds;
  }

  @override
  Future<int> addItem(ItemModel item) async {
    addItemCallCount++;
    addedItems.add(item);
    mockItems[item.id] = item;
    return item.id;
  }

  @override
  Future<void> clearCache() async {
    clearCacheCallCount++;
    mockItems.clear();
  }
}

/// Helper function to create test ItemModel instances
ItemModel _createTestItem(int id, String title) {
  return ItemModel(
    id: id,
    deleted: false,
    type: 'story',
    by: 'test_user',
    time: DateTime.now().millisecondsSinceEpoch ~/ 1000,
    text: 'Test content',
    dead: false,
    parent: null,
    kids: [],
    url: 'https://example.com',
    score: 100,
    title: title,
    descendants: 5,
  );
}
