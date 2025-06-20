import 'package:hacker_news/src/models/item_model.dart';
import 'package:hacker_news/src/infrastructure/database/db_utils.dart';
import 'package:hacker_news/src/repository/news_datasource.dart';
import 'package:hacker_news/src/infrastructure/database/db_schema.dart';

/// Mock implementation of a database for testing.
///
/// This class provides a minimal implementation of the methods needed
/// from sqflite's Database class.
class MockDatabase {
  final Map<int, Map<String, dynamic>> _itemsCache;

  MockDatabase(this._itemsCache);

  /// Mock implementation of the delete method
  Future<int> delete(String table) async {
    if (table == itemsTableName) {
      final count = _itemsCache.length;
      _itemsCache.clear();
      return count;
    }
    return 0;
  }
}

/// A mock implementation of NewsDbProvider for testing.
///
/// This class avoids the dependency on path_provider and sqflite packages
/// that cause MissingPluginException in tests.
class MockNewsDbProvider implements NewsDataSource, NewsItemCache {
  // In-memory cache to simulate database
  final Map<int, Map<String, dynamic>> _itemsCache = {};

  // Mock database object to satisfy the NewsRepository's database reference
  MockDatabase? _db;

  Future<MockDatabase> get database async {
    return _db ??= MockDatabase(_itemsCache);
  }

  @override
  Future<ItemModel?> fetchItem(int id) async {
    final item = _itemsCache[id];
    if (item != null) {
      // Process the item to ensure boolean fields are properly handled
      final processedItem =
          preprocessDbMap(Map<String, dynamic>.from(item), ['deleted', 'dead']);
      return ItemModel.fromJson(processedItem);
    }
    return null;
  }

  @override
  Future<int> addItem(ItemModel item) async {
    final itemMap =
        convertBooleansToIntegers(item.toJson(), ['deleted', 'dead']);
    _itemsCache[item.id] = itemMap;
    return item.id;
  }

  /// Clears all items from the mock cache.
  /// This is useful for test setup/teardown.
  void clear() {
    _itemsCache.clear();
  }

  @override
  Future<void> clearCache() async {
    _itemsCache.clear();
  }
}
