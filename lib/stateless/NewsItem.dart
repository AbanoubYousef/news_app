import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:popnews/models/Article.dart';
import 'package:popnews/statefull/ArticleContent.dart';

class NewsItem extends StatelessWidget {
  var index;
  List<Article> news;

  NewsItem({this.index, this.news});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => ArticleContent(
                    index: index,
                    news: news,
                  )));
        },
        child: Card(
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
                borderSide: BorderSide(color: Colors.transparent)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //Image.network(news[index]?.urlToImage ??= null),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 10.0, left: 20.0, right: 10.0, top: 10.0),
                    child: Text(
                      news[index].title,
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
