import 'package:flutter/material.dart';
import 'package:news/pages/newsList.dart';
import 'package:news/provider/newsClass.dart';
import 'package:news/provider/newsProvider.dart';
import 'package:http/http.dart' as ht;

class Category extends StatefulWidget {
  final String cat;
  final String title;
  Category({Key key, this.cat, this.title}) : super(key: key);
 
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  String cat;
  String title;
  @override
  void initState() { 
    super.initState();
    cat = widget.cat;
    title = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color(0xff51143F),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Center(
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xff51143F),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Padding(padding: EdgeInsets.only(left: 20.0, top:20.0,),
                child: Text("$title", style: TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.w600,),),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 70.0, right: 0.0, left:0.0,),
              child: Container(
                color: Colors.transparent,
                width: width,
                child: Material(
                  elevation: 5.0,
                  color: Color(0xff43002e),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(35.0),
                    topLeft: Radius.circular(35.0),
                  ),
                  child: FutureBuilder<List<News>>(
                    future: fetchNews(ht.Client(), cat),
                    builder: (BuildContext context, snapshot) =>
                    !snapshot.hasData ? Center(child: CircularProgressIndicator(backgroundColor: Colors.white,),)
                    :NewsList(news: snapshot.data),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
