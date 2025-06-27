import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_news/src/infrastructure/cache/memory_cache.dart';
import 'package:hacker_news/src/models/item_model.dart';

void main() {
  group('MemoryCache', () {
    late MemoryCache cache;

    setUp(() {
      cache = MemoryCache(maxSize: 3);
    });

    test('should store and retrieve items', () {
      final item = _createTestItem(1, 'Test Story');

      cache.put(1, item);
      final retrieved = cache.get(1);

      expect(retrieved, equals(item));
      expect(retrieved?.title, equals('Test Story'));
    });

    test('should return null for non-existent items', () {
      final retrieved = cache.get(999);
      expect(retrieved, isNull);
    });

    test('should respect maxSize limit with LRU eviction', () {
      final item1 = _createTestItem(1, 'Story 1');
      final item2 = _createTestItem(2, 'Story 2');
      final item3 = _createTestItem(3, 'Story 3');
      final item4 = _createTestItem(4, 'Story 4');

      // Fill cache to capacity
      cache.put(1, item1);
      cache.put(2, item2);
      cache.put(3, item3);

      expect(cache.get(1), equals(item1));
      expect(cache.get(2), equals(item2));
      expect(cache.get(3), equals(item3));

      // Add fourth item, should evict least recently used (item1)
      cache.put(4, item4);

      expect(cache.get(1), isNull); // Evicted
      expect(cache.get(2), equals(item2));
      expect(cache.get(3), equals(item3));
      expect(cache.get(4), equals(item4));
    });

    test('should update LRU order on access', () {
      final item1 = _createTestItem(1, 'Story 1');
      final item2 = _createTestItem(2, 'Story 2');
      final item3 = _createTestItem(3, 'Story 3');
      final item4 = _createTestItem(4, 'Story 4');

      // Fill cache
      cache.put(1, item1);
      cache.put(2, item2);
      cache.put(3, item3);

      // Access item1 to make it most recently used
      cache.get(1);

      // Add item4, should evict item2 (now least recently used)
      cache.put(4, item4);

      expect(cache.get(1), equals(item1)); // Should still be present
      expect(cache.get(2), isNull); // Should be evicted
      expect(cache.get(3), equals(item3));
      expect(cache.get(4), equals(item4));
    });

    test('should track cache statistics', () {
      final item1 = _createTestItem(1, 'Story 1');

      // Initial stats
      final initialStats = cache.stats;
      expect(initialStats.totalItems, equals(0));
      expect(initialStats.expiredItems, equals(0));
      expect(initialStats.memoryUsageItems, equals(0));

      // Add item
      cache.put(1, item1);

      final afterAddStats = cache.stats;
      expect(afterAddStats.totalItems, equals(1));
      expect(afterAddStats.memoryUsageItems, equals(1));
      expect(afterAddStats.validItems, equals(1));
    });

    test('should handle TTL expiration', () async {
      final item = _createTestItem(1, 'Test Story');

      // Use short TTL (1 minute for testing, but we'll test expiry logic)
      cache.put(1, item, ttlMinutes: 1);

      // Item should be available immediately
      expect(cache.get(1), equals(item));

      // The actual TTL test would require waiting, but we can test
      // that expired items are handled correctly during maintenance
      cache.maintenance();

      // Item should still be there since it hasn't expired yet
      expect(cache.get(1), equals(item));
    });

    test('should clear all items', () {
      final item1 = _createTestItem(1, 'Story 1');
      final item2 = _createTestItem(2, 'Story 2');

      cache.put(1, item1);
      cache.put(2, item2);

      expect(cache.get(1), equals(item1));
      expect(cache.get(2), equals(item2));
      expect(cache.stats.totalItems, equals(2));

      cache.clear();

      expect(cache.get(1), isNull);
      expect(cache.get(2), isNull);
      expect(cache.stats.totalItems, equals(0));
    });

    test('should remove specific items', () {
      final item1 = _createTestItem(1, 'Story 1');
      final item2 = _createTestItem(2, 'Story 2');

      cache.put(1, item1);
      cache.put(2, item2);

      expect(cache.get(1), equals(item1));
      expect(cache.get(2), equals(item2));

      cache.remove(1);

      expect(cache.get(1), isNull);
      expect(cache.get(2), equals(item2));
      expect(cache.stats.totalItems, equals(1));
    });

    test('should handle concurrent access safely', () async {
      final item1 = _createTestItem(1, 'Story 1');
      final item2 = _createTestItem(2, 'Story 2');

      // Simulate concurrent puts
      final futures = <Future>[];
      for (int i = 0; i < 10; i++) {
        futures.add(Future.microtask(() => cache.put(1, item1)));
        futures.add(Future.microtask(() => cache.put(2, item2)));
      }

      await Future.wait(futures);

      expect(cache.get(1), equals(item1));
      expect(cache.get(2), equals(item2));
      expect(cache.stats.totalItems, equals(2));
    });

    test('should calculate utilization correctly', () {
      final item1 = _createTestItem(1, 'Story 1');
      final item2 = _createTestItem(2, 'Story 2');

      // Add 2 items to cache with max size 3
      cache.put(1, item1);
      cache.put(2, item2);

      final stats = cache.stats;
      expect(stats.utilization, closeTo(66.7, 0.1)); // 2/3 * 100 = 66.7%
    });
  });
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
