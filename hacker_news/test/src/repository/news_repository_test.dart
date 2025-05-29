import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_news/src/repository/news_repository.dart';
import 'package:hacker_news/src/infrastructure/network/news_api_provider.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'dart:convert';
import '../../helpers/mock_news_db_provider.dart';

/// Tests for the NewsRepository class that validate the caching mechanism.
///
/// These tests ensure that:
/// 1. The repository correctly fetches data from API when not in the database
/// 2. Items fetched from the API are cached in the database for future use
void main() {
  // Initialize the Flutter test binding to provide required services
  TestWidgetsFlutterBinding.ensureInitialized();

  group('NewsRepository', () {
    late NewsApiProvider apiProvider;
    late MockNewsDbProvider dbProvider;
    late NewsRepository repository;

    setUp(() {
      // Create providers and repository
      dbProvider = MockNewsDbProvider();
      apiProvider = NewsApiProvider();
      repository = NewsRepository(
        dbProvider: dbProvider,
        apiProvider: apiProvider,
      );
    });

    test(
        'fetchItem gets from API when not in DB and caches it for future requests',
        () async {
      // Create mock responses for API calls
      final mockClient = MockClient((request) {
        final url = request.url.toString();

        if (url.contains('/item/123.json')) {
          return Future.value(http.Response(
            json.encode({
              'id': 123,
              'title': 'Test Story',
              'type': 'story',
            }),
            200,
          ));
        }

        return Future.value(http.Response('Not found', 404));
      });

      // Set mock client on API provider
      apiProvider.client = mockClient;

      // First request should get from API and cache in DB
      final item1 = await repository.fetchItem(123);
      expect(item1?.id, 123);
      expect(item1?.title, 'Test Story');

      // Second request should get from DB
      final item2 = await repository.fetchItem(123);
      expect(item2?.id, 123);
      expect(item2?.title, 'Test Story');
    });

    test('fetchTopIds retrieves list of story IDs from API', () async {
      // Create mock response for top stories
      final mockClient = MockClient((request) {
        final url = request.url.toString();

        if (url.contains('/topstories.json')) {
          return Future.value(http.Response(
            '[1, 2, 3, 4, 5]',
            200,
          ));
        }

        return Future.value(http.Response('Not found', 404));
      });

      // Set mock client on API provider
      apiProvider.client = mockClient;

      final ids = await repository.fetchTopIds();
      expect(ids, [1, 2, 3, 4, 5]);
    });

    test('clearCache removes all items from the database', () async {
      // First add some test data
      final mockClient = MockClient((request) {
        final url = request.url.toString();
        if (url.contains('/item/123.json')) {
          return Future.value(http.Response(
            json.encode({
              'id': 123,
              'title': 'Test Story',
              'type': 'story',
            }),
            200,
          ));
        }
        return Future.value(http.Response('Not found', 404));
      });
      apiProvider.client = mockClient;

      // Fetch an item to cache it
      final item = await repository.fetchItem(123);
      expect(item?.id, 123);

      // Make sure it's in the cache
      final cachedItem = await dbProvider.fetchItem(123);
      expect(cachedItem?.id, 123);

      // Clear the cache
      await repository.clearCache();

      // Verify the item is no longer in the cache
      final clearedItem = await dbProvider.fetchItem(123);
      expect(clearedItem, isNull);
    });
  });
}
