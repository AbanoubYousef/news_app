import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:mobx/mobx.dart';
import 'package:popnews/models/Article.dart';
part 'HomePageMobx.g.dart';

// This is the class used by rest of your codebase
class HomePageController = _HomePageMobx with _$HomePageController;

// The store-class
abstract class _HomePageMobx with Store {
  @observable
  List<Article> newsList = [];
  @observable
  bool loader;
  @action
  Future<void> getNews(String url) async {
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == "ok") {
      jsonData['articles'].forEach((elemnet) {

        Article article = Article(
            title: elemnet['title'],
            author: elemnet['author'],
            content: elemnet['content'],
            description: elemnet['description'],
            urlToImage: elemnet['urlToImage'],
            publishedAt: DateTime.parse(elemnet['publishedAt']));

        newsList.add(article);
      });
    }
  }
}