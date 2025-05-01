import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_news/src/models/item_model.dart';
import 'dart:convert';

/// Unit tests for the `ItemModel` class.
///
/// These tests validate the JSON serialization and deserialization capabilities
/// of the `ItemModel` class. The tests ensure that an `ItemModel` instance can
/// be correctly converted to and from a JSON string.
///
/// ### Running the Tests
///
/// - **From the Command Line**:
///   Run the following command in the terminal:
///   ```bash
///   flutter test test/item_model_test.dart
///   ```
///
/// - **From Visual Studio Code**:
///   Open the `item_model_test.dart` file, then click the `Run` or `Debug` button
///   above each test or at the top of the file.
void main() {
  group('ItemModel JSON Serialization', () {
    test('should serialize ItemModel to JSON string', () {
      // Arrange
      final item = ItemModel(
        id: 123,
        deleted: false,
        type: 'story',
        by: 'author',
        time: 1610000000,
        text: 'This is a test story.',
        dead: false,
        parent: null,
        kids: [456, 789],
        url: 'https://example.com',
        score: 100,
        title: 'Test Story',
        descendants: 10,
      );

      // Act
      final jsonString = item.toJsonString();

      // Assert
      final expectedJson = {
        'id': 123,
        'deleted': false,
        'type': 'story',
        'by': 'author',
        'time': 1610000000,
        'text': 'This is a test story.',
        'dead': false,
        'parent': null,
        'kids': [456, 789],
        'url': 'https://example.com',
        'score': 100,
        'title': 'Test Story',
        'descendants': 10,
      };
      expect(json.decode(jsonString), expectedJson);
    });

    test('should deserialize JSON string to ItemModel', () {
      // Arrange
      final jsonString = json.encode({
        'id': 123,
        'deleted': false,
        'type': 'story',
        'by': 'author',
        'time': 1610000000,
        'text': 'This is a test story.',
        'dead': false,
        'parent': null,
        'kids': [456, 789],
        'url': 'https://example.com',
        'score': 100,
        'title': 'Test Story',
        'descendants': 10,
      });

      // Act
      final item = ItemModel.fromJsonString(jsonString);

      // Assert
      expect(item.id, 123);
      expect(item.deleted, false);
      expect(item.type, 'story');
      expect(item.by, 'author');
      expect(item.time, 1610000000);
      expect(item.text, 'This is a test story.');
      expect(item.dead, false);
      expect(item.parent, null);
      expect(item.kids, [456, 789]);
      expect(item.url, 'https://example.com');
      expect(item.score, 100);
      expect(item.title, 'Test Story');
      expect(item.descendants, 10);
    });
  });
}
