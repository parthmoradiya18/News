import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newspaper/model.dart';


class NewsHelper {
  NewsHelper._();
  static final NewsHelper newsHelper = NewsHelper._();

  final String url =
      "https://newsapi.org/v2/top-headlines?country=us&category=&apiKey=c10089cea51343e38f67e4b5f80089e4";
  Future<NewsModel?> fetchAllNewsData() async {
    http.Response res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      Map decodeData = jsonDecode(res.body);
      NewsModel? news = NewsModel.fromJson(data: decodeData);

      print(decodeData);

      return news;
    }
    return null;
  }

  final String sport =
      "https://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=c10089cea51343e38f67e4b5f80089e4";
  Future<NewsModel?> fetchAllSportsNewsData() async {
    http.Response res = await http.get(Uri.parse(sport));
    if (res.statusCode == 200) {
      Map decodeData = jsonDecode(res.body);
      NewsModel? sportsNews = NewsModel.fromJson(data: decodeData);

      print(decodeData);

      return sportsNews;
    }
    return null;
  }

  final String business =
      "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=c10089cea51343e38f67e4b5f80089e4";
  Future<NewsModel?> fetchAllBusinessNewsData() async {
    http.Response res = await http.get(Uri.parse(business));
    if (res.statusCode == 200) {
      Map decodeData = jsonDecode(res.body);
      NewsModel? businessNews = NewsModel.fromJson(data: decodeData);

      print(decodeData);

      return businessNews;
    }
    return null;
  }

  final String entertainment =
      "https://newsapi.org/v2/top-headlines?country=in&category=entertainment&apiKey=c10089cea51343e38f67e4b5f80089e4";
  Future<NewsModel?> fetchAllEntertainNewsData() async {
    http.Response res = await http.get(Uri.parse(entertainment));
    if (res.statusCode == 200) {
      Map decodeData = jsonDecode(res.body);
      NewsModel? entertainmentNews = NewsModel.fromJson(data: decodeData);

      print(decodeData);

      return entertainmentNews;
    }
    return null;
  }

  final String science =
      "https://newsapi.org/v2/top-headlines?country=in&category=science&apiKey=c10089cea51343e38f67e4b5f80089e4";
  Future<NewsModel?> fetchAllScienceNewsData() async {
    http.Response res = await http.get(Uri.parse(science));
    if (res.statusCode == 200) {
      Map decodeData = jsonDecode(res.body);
      NewsModel? scienceNews = NewsModel.fromJson(data: decodeData);

      print(decodeData);

      return scienceNews;
    }
    return null;
  }

  final String health =
      "https://newsapi.org/v2/top-headlines?country=in&category=health&apiKey=c10089cea51343e38f67e4b5f80089e4";
  Future<NewsModel?> fetchAllHealthNewsData() async {
    http.Response res = await http.get(Uri.parse(health));
    if (res.statusCode == 200) {
      Map decodeData = jsonDecode(res.body);
      NewsModel? healthNews = NewsModel.fromJson(data: decodeData);

      print(decodeData);

      return healthNews;
    }
    return null;
  }

  final String technology =
      "https://newsapi.org/v2/top-headlines?country=in&category=technology&apiKey=78003ad7858241e39f6e0bc0864ffbdc";
  Future<NewsModel?> fetchAllTechnologyNewsData() async {
    http.Response res = await http.get(Uri.parse(technology));
    if (res.statusCode == 200) {
      Map decodeData = jsonDecode(res.body);
      NewsModel? technologyNews = NewsModel.fromJson(data: decodeData);

      print(decodeData);

      return technologyNews;
    }
    return null;
  }
}