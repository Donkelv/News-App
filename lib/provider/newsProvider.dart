import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'newsClass.dart';

final news = NewsModel();

class Constant {
  static const String key = "46f4bf30a31140f1a304e438a730a1b0";
  static const newsFeed =
      "http://newsapi.org/v2/top-headlines?country=us&apiKey=";
  static const techFeed =
      "http://newsapi.org/v2/top-headlines?country=us&category=technology&apiKey=";
  static const politicsFeed =
      "http://newsapi.org/v2/top-headlines?country=us&category=politics&apiKey=";
  static const sportFeed =
      "http://newsapi.org/v2/top-headlines?country=us&category=sport&apiKey=";
  static const techTitle = "Technology";
  static const politicsTitle = "Politics";
  static const sportTitle = "Sport";

}

Future<List<News>> fetchNews(http.Client client, cate) async {
  String url = cate + Constant.key;
  final response = await client.get(url);
  print(compute(parsenews, response.body));
  return compute(parsenews, response.body);
}

List<News> parsenews(String responsebody) {
  final parsed = json.decode(responsebody);
  print(parsed['articles'] as List);
  return (parsed['articles'] as List)
      .map<News>((e) => News.fromJson(e))
      .toList();
}

class NewsModel with ChangeNotifier {
  String news;

  void notifyApi(newsCate) {
    news = newsCate;
    notifyListeners();
  }

  String getCate() => news;
}
