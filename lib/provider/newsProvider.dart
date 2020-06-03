import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'newsClass.dart';

class Constant {
  static const String base_url =
      "http://newsapi.org/v2/top-headlines?country=us&apiKey=";
  static const String key = "46f4bf30a31140f1a304e438a730a1b0";
}

String url = Constant.base_url + Constant.key;

Future<List<News>> fetchNews(http.Client client) async {
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
