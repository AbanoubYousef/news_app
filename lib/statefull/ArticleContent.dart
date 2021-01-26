import 'package:flutter/material.dart';
import 'package:popnews/models/Article.dart';

class ArticleContent extends StatefulWidget {
   List<Article> news;
   var index;
   ArticleContent({this.index,this.news});

  @override
  _ArticleContentState createState() => _ArticleContentState();
}

class _ArticleContentState extends State<ArticleContent> {
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: <Widget>[
          Image.network(widget.news[widget.index].urlToImage),
          Divider(),
          Expanded(
            child: ListView(
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.all( 15.0),
                  child: Text(" Tilte :  \n ${widget.news[widget.index].title}",style: TextStyle(
                     fontSize: 20.0,
                    fontWeight:FontWeight.bold,
                  ),),
                ),
                Divider(),

                Padding(
                  padding: const EdgeInsets.only( bottom: 10.0,left: 20.0,right: 10.0,  top: 10.0),
                  child: Text(" Athour : \n  ${widget.news[widget.index]?.author??"unknowen"}",style: TextStyle(
                    fontSize: 20.0,
                    fontWeight:FontWeight.w800,
                  )),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.only( bottom: 10.0,left: 20.0,right: 10.0,  top: 10.0),
                  child: Text(" Discription : \n ${widget.news[widget.index].description}",style: TextStyle(
                    fontSize: 20.0,
                    fontWeight:FontWeight.bold,
                  )),
                ),

              ],
            ),
          ),
        ],
      )
    );
  }
}
