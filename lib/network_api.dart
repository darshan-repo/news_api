import 'package:news_api/post_model.dart';
import 'package:http/http.dart' as http;

class NetworkApi {
  static String baseUrl = 'https://newsapi.org/v2/';

  static Future<NewsApi> fetchNews(String url) async {
    var response = await http.get(Uri.parse('$baseUrl$url'));
    if (response.statusCode == 200) {
      return newsApiFromJson(response.body);
    } else {
      throw Exception('Unable to load Api');
    }
  }
}
