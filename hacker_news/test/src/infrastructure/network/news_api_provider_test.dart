import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_news/src/infrastructure/network/news_api_provider.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'dart:convert';

/// Entry point for the `news_api_provider_test.dart` file.
///
/// This file contains instrumented tests for the `NewsApiProvider` class.
///
/// ## Running Tests
///
/// ### From the Command Line:
/// Use the following command to run all tests in this file:
/// ```
/// flutter test test/src/infrastructure/network/news_api_provider_test.dart
/// ```
///
/// ### From Visual Studio Code:
/// 1. Open this file in the editor.
/// 2. Click on the `Run | Debug` links above each test or test group.
/// 3. Alternatively, use the `Run All Tests` option in the Testing sidebar.
///
/// Ensure that the Flutter environment is properly set up before running the tests.
void main() {
  group('NewsApiProvider', () {
    late NewsApiProvider apiProvider;

    setUp(() {
      apiProvider = NewsApiProvider();
    });

    test('fetchTopIds returns a list of IDs on success', () async {
      final mockClient = MockClient((request) async {
        return http.Response('[1, 2, 3, 4, 5]', 200);
      });
      apiProvider.client = mockClient;

      final ids = await apiProvider.fetchTopIds();

      expect(ids, [1, 2, 3, 4, 5]);
    });

    test('fetchTopIds throws an exception on failure', () async {
      final mockClient = MockClient((request) async {
        return http.Response('Error', 404);
      });
      apiProvider.client = mockClient;

      expect(() => apiProvider.fetchTopIds(), throwsException);
    });

    test('fetchItem returns an ItemModel on success', () async {
      final mockResponse = json.encode({
        'id': 1,
        'title': 'Test Item',
        'by': 'author',
        'time': 1234567890,
        'kids': [2, 3, 4]
      });
      final mockClient = MockClient((request) async {
        return http.Response(mockResponse, 200);
      });
      apiProvider.client = mockClient;

      final item = await apiProvider.fetchItem(1);

      expect(item.id, 1);
      expect(item.title, 'Test Item');
      expect(item.by, 'author');
      expect(item.time, 1234567890);
      expect(item.kids, [2, 3, 4]);
    });

    test('fetchItem throws an exception on failure', () async {
      final mockClient = MockClient((request) async {
        return http.Response('Error', 404);
      });
      apiProvider.client = mockClient;

      expect(() => apiProvider.fetchItem(1), throwsException);
    });
  });
}
