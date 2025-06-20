import 'package:hacker_news/src/models/item_model.dart';
import 'package:hacker_news/src/repository/news_datasource.dart';

/// Mock implementation of a secondary news data source for testing.
///
/// This class implements NewsDataSource and can be used to test
/// the secondary source functionality in the repository.
class MockSecondarySource implements NewsDataSource {
  // Predefined set of items this source can provide
  final Map<int, ItemModel> _items = {};

  /// Adds an item to the mock source
  void addItem(ItemModel item) {
    _items[item.id] = item;
  }

  @override
  Future<ItemModel?> fetchItem(int id) async {
    return _items[id];
  }

  /// Clears all test data
  void clear() {
    _items.clear();
  }
}
