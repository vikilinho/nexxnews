import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nexx/model/topnews.dart';

class APIService {
  final client = http.Client();
  final baseUrl = 'https://newsapi.org';
  Future<List<Article>> getArticle() async {
    final queryParameters = {
      'country': 'ng',
      'category': 'general',
      'apiKey': '59bc30b7a4fc4700900ac317d6e5ee34'
    };
    final uri = Uri.https(baseUrl, '/v2/top-headlines', queryParameters);
    final response = await client.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> body = json['articles'];
    List<Article> articles =
        body.map((dynamic item) => Article.fromJson(item)).toList();
    return articles;
  }
}
