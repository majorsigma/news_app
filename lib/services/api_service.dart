import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:news_app/models/news_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String _apiKey = "817a77067588467cbe8d54232d3c400a";
  final _topHeadLinesURL = "https://newsapi.org/v2/top-headlines?country=us";
  final _everythingURL = "https://newsapi.org/v2/everything";
  final _sourcesURL = "https://newsapi.org/v2/sources";
  http.Client httpClient;

  ApiService({@required this.httpClient});

  String get getAPIKey => _apiKey;
  String get getTopHeadLinesURL => _topHeadLinesURL;
  String get getSourcesURL => _sourcesURL;

  Future<News> fetchNews({
    http.Client client,
    String url,
    Map<String, String> headers,
  }) async {
    Map<String, dynamic> jsonData = {};
    var urlToContent = Uri.parse(url);
    News news = null;
    var response = await client.get(url, headers: headers);
    if (response.statusCode == 200) {
      jsonData = jsonDecode(response.body);
      news = News.fromJson(jsonData);
    } else {
      throw http.ClientException;
    }

    return news;
  }
}