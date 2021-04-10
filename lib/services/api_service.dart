import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:news_app/models/news_model.dart';
import 'package:http/http.dart' as http;

// This class helps with making import calls to backend
class ApiService {
  final String _apiKey = "817a77067588467cbe8d54232d3c400a";
  final _topHeadLinesURL = "https://newsapi.org/v2/top-headlines?country=us";
  final _sourcesURL = "https://newsapi.org/v2/sources";
  http.Client httpClient;

  ApiService({@required this.httpClient});

  String get getAPIKey => _apiKey;
  String get getTopHeadLinesURL => _topHeadLinesURL;
  String get getSourcesURL => _sourcesURL;

  // Fetches news from the Web Server throught Restful Api
  // then convert returned response to News object.
  // and finally returns a Future<News>.
  Future<News> fetchNews({
    http.Client client,
    String url,
    Map<String, String> headers,
  }) async {
    Map<String, dynamic> jsonData = {};
    News news;
    var response = await client.get(url, headers: headers);
    if (response.statusCode == 200) {
      jsonData = jsonDecode(response.body);
      news = News.fromJson(jsonData);
    } else {
      throw http.ClientException;
    }

    return news;
  }

  // helps loading the html content from a url and the returns it as a future
  Future<String> loadPage(String url) async {
    http.Client client = http.Client();
    http.Response response = await client.get(url);
    print(response.body);
    return response.body;
  }
}
