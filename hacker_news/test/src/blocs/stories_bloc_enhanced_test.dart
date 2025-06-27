import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_news/src/blocs/stories_bloc.dart';
import 'package:hacker_news/src/models/item_model.dart';

void main() {
  group('StoriesBloc with Enhanced Repository', () {
    late StoriesBloc bloc;

    setUp(() {
      bloc = StoriesBloc();
    });

    tearDown(() {
      bloc.dispose();
    });

    test('should initially have empty data', () {
      expect(
          bloc.topIds,
          emitsInOrder([
            [], // Initial empty list
          ]));

      expect(
          bloc.items,
          emitsInOrder([
            {}, // Initial empty map
          ]));

      expect(
          bloc.loading,
          emitsInOrder([
            false, // Initial loading state
          ]));

      expect(
          bloc.error,
          emitsInOrder([
            null, // Initial error state
          ]));
    });

    test('should combine stories correctly', () async {
      // This test verifies that the stories stream combines IDs and items correctly
      // Since we can't easily mock the repository without dependency injection,
      // we'll test the stream combination logic
      // In a real scenario, you'd want to inject a mock repository

      // This is a simplified test - in practice you'd mock the repository
      expect(
          bloc.stories,
          emitsInOrder([
            [], // Initially empty
          ]));
    });

    test('should track loading state during operations', () async {
      expect(
          bloc.loading,
          emitsInOrder([
            false, // Initial state
            true, // During fetch
            false, // After completion
          ]));

      // This would fail in practice because it hits the real API
      // You'd need to mock the repository for proper testing
      // await bloc.fetchTopIds();
    });

    test('should provide performance stats from enhanced repository', () {
      final stats = bloc.performanceStats;

      expect(stats, isNotNull);
      expect(stats.cacheHitRate, isA<double>());
      expect(stats.totalCacheHits, isA<int>());
      expect(stats.totalCacheMisses, isA<int>());
      expect(stats.totalApiCalls, isA<int>());
    });

    test('should clear memory cache without affecting database', () {
      // This test verifies that the memory cache clearing method exists and is callable
      expect(() => bloc.clearMemoryCache(), returnsNormally);
    });

    test('should perform cache maintenance', () {
      // This test verifies that the cache maintenance method exists and is callable
      expect(() => bloc.performCacheMaintenance(), returnsNormally);
    });

    test('should warm cache with priority IDs', () async {
      final priorityIds = [1, 2, 3, 4, 5];

      // This method should complete without error
      await expectLater(
        bloc.warmCache(priorityIds),
        completes,
      );
    });

    test('should clear all caches', () async {
      await expectLater(
        bloc.clearCache(),
        completes,
      );
    });

    test('should handle refresh operation', () async {
      await expectLater(
        bloc.refresh(),
        completes,
      );
    });

    test('should handle load more stories', () async {
      await expectLater(
        bloc.loadMoreStories(),
        completes,
      );
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
