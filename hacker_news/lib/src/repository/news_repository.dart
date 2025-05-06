import 'package:hacker_news/src/infrastructure/database/news_db_provider.dart';
import 'package:hacker_news/src/infrastructure/network/news_api_provider.dart';
import 'package:hacker_news/src/models/item_model.dart';

class NewsRepository {
  final NewsDbProvider _dbProvider;
  final NewsApiProvider _apiProvider;

  NewsRepository(this._dbProvider, this._apiProvider);

  Future<ItemModel?> fetchItem(int id) async {
    // Check if the item exists in the database
    var item = await _dbProvider.fetchItem(id);
    if (item != null) {
      return item;
    }

    // If not in the database, fetch from the API
    item = await _apiProvider.fetchItem(id);

    // Cache the item in the database for future use
    if (item != null) {
      await _dbProvider.addItem(item);
    }

    return item;
  }

  Future<List<int>> fetchTopIds() async {
    // Fetch top IDs from the API (no caching needed for IDs)
    return await _apiProvider.fetchTopIds();
  }
}
