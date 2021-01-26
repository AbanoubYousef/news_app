import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:popnews/mobx/HomePageMobx.dart';
import 'package:popnews/stateless/NewsItem.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageController controller = HomePageController();
  static final _items = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
      ),
      title: Text("HeadLines"),
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.search), title: Text('Technology')),
    BottomNavigationBarItem(
        icon: Icon(Icons.new_releases), title: Text("Sport")),
  ];

  var _index = 0;
  Map _urls = {
    '0':
        "http://newsapi.org/v2/top-headlines?country=eg&apiKey=190c5e337249489d9b90a77f4d0ddf6b",
    '1':
        "http://newsapi.org/v2/top-headlines?country=eg&category=technology&apiKey=190c5e337249489d9b90a77f4d0ddf6b",
    '2':
        "http://newsapi.org/v2/top-headlines?country=eg&category=sports&apiKey=190c5e337249489d9b90a77f4d0ddf6b"
  };

  void _getNews(String url) async {
    await controller.getNews(url);
    controller.loader = false;
  }

  @override
  void initState() {
    controller.loader = true;
    _getNews(_urls['$_index']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text("P o p N e w s",style: TextStyle(
           fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold

          ),),
           centerTitle: true,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: _items,
          currentIndex: _index,
          onTap: (x) {
            _index = x;
            controller.newsList.clear();
            _getNews(_urls["$x"]);
          },
        ),
        body: controller.loader
            ? Center(
                child: CircularProgressIndicator()
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return NewsItem(
                    index: index,
                    news: controller.newsList,
                  );
                },
                itemCount: controller.newsList.length,
              ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                  accountName: Text("Abanoub Yousef Mahrous"),
                  accountEmail: Text("popyousef100@gmail.com")),
              Divider(),
              ListTile( title: Text("Favorites"),onTap: (){},  leading: Icon(Icons.favorite),)
            ],
          )
        ),
      ),
    );
  }
}
