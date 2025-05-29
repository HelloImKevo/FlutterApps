import 'package:hacker_news/src/models/item_model.dart';

/// Abstract interface for news data sources
abstract class NewsDataSource {
  /// Fetches an item with the given ID
  Future<ItemModel?> fetchItem(int id);
}

/// Abstract interface for sources that can provide top story IDs
abstract class TopIdsSource {
  /// Fetches the IDs of top stories
  Future<List<int>> fetchTopIds();
}

/// Abstract interface for sources that can store items
abstract class ItemCache {
  /// Adds an item to the cache
  Future<int> addItem(ItemModel item);

  /// Clears all items from the cache
  Future<void> clearCache();
}
