import 'package:http/http.dart' as http;
import 'dart:convert' show json;
import 'package:logger/logger.dart';
import '../models/item_model.dart';

const String _baseUrl = 'https://hacker-news.firebaseio.com/v0';

final logger = Logger();

class NewsApiProvider {
  http.Client client = http.Client();

  fetchTopIds() async {
    String url = '$_baseUrl/topstories.json';
    final response = await client.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception('Failed to load top IDs');
    }

    logger.d('fetchTopIds -> response.body: ${response.body}');

    final ids = json.decode(response.body);

    logger.d('fetchTopIds -> ids: $ids');

    return ids;
  }

  fetchItem(int id) async {
    String url = '$_baseUrl/item/$id.json';
    final response = await client.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch item with id: $id');
    }

    logger.d('fetchItem -> response.body: ${response.body}');

    final parsedJson = json.decode(response.body);

    logger.d('fetchItem -> parsedJson: $parsedJson');

    return ItemModel.fromJson(parsedJson);
  }
}
