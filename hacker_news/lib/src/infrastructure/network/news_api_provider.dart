import 'package:http/http.dart' as http;
import 'dart:convert' show json;
import 'package:logger/logger.dart';
import 'package:hacker_news/src/models/item_model.dart';
import 'package:hacker_news/src/repository/news_datasource.dart';

const String _baseUrl = 'https://hacker-news.firebaseio.com/v0';

final logger = Logger();

class NewsApiProvider implements NewsDataSource, TopIdsSource {
  http.Client client = http.Client();

  @override
  Future<List<int>> fetchTopIds() async {
    String url = '$_baseUrl/topstories.json';
    final response = await client.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception('Failed to load top IDs');
    }

    logger.d('fetchTopIds -> response.body: ${response.body}');

    final ids = json.decode(response.body).cast<int>();

    logger.d('fetchTopIds -> ids: $ids');

    return ids;
  }

  @override
  Future<ItemModel?> fetchItem(int id) async {
    String url = '$_baseUrl/item/$id.json';
    final response = await client.get(Uri.parse(url));

    // Return null for 404 responses - item not found
    if (response.statusCode == 404) {
      logger.d('fetchItem -> Item not found: $id');
      return null;
    }

    // Throw exception for other error responses
    if (response.statusCode != 200) {
      throw Exception('Failed to fetch item with id: $id');
    }

    logger.d('fetchItem -> response.body: ${response.body}');

    final parsedJson = json.decode(response.body);

    // The API might return null for some items
    if (parsedJson == null) {
      return null;
    }

    logger.d('fetchItem -> parsedJson: $parsedJson');

    return ItemModel.fromJson(parsedJson);
  }
}
