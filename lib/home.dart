import 'package:flutter/material.dart';

import 'pages/newsList.dart';
import 'provider/newsClass.dart';
import 'provider/newsProvider.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff51143F),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 30.0, top: 16.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
              ),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("assets/icon.jpeg"),
                radius: 20.0,
              ),
            ),
          ),
        ],
        elevation: 0.0,
        centerTitle: true,
      ),
      backgroundColor: Color(0xff51143F),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(
                      top: 5.0,
                      left: 20.0,
                    ),
                    child: Text(
                      "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                      style: TextStyle(
                        color: Color(0xff733e62),
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10.0,
                    left: 20.0,
                  ),
                  child: Text(
                    "News Today",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10.0,
                    left: 20.0,
                  ),
                  child: Container(
                    height: 75.0,
                    color: Color(0xff51143F),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                color: Colors.transparent,
                                width: 50.0,
                                height: 50.0,
                                child: Material(
                                  borderRadius: BorderRadius.circular(25.0),
                                  color: Colors.white,
                                  elevation: 1.5,
                                  child: Icon(
                                    Icons.account_balance,
                                    size: 20,
                                    color: Color(0xff12060C),
                                  ),
                                ),
                              ),
                            Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Text(
                                "Politics",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 20.0,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                color: Colors.transparent,
                                width: 50.0,
                                height: 50.0,
                                child: Material(
                                  borderRadius: BorderRadius.circular(25.0),
                                  color: Colors.white,
                                  elevation: 1.5,
                                  child: Icon(
                                    Icons.satellite,
                                    size: 20,
                                    color: Color(0xff12060C),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10.0),
                                child: Text(
                                  "Sports",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.w200,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 20.0,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                color: Colors.transparent,
                                width: 50.0,
                                height: 50.0,
                                child: Material(
                                  borderRadius: BorderRadius.circular(25.0),
                                  color: Colors.white,
                                  elevation: 1.5,
                                  child: Icon(
                                    Icons.satellite,
                                    size: 20,
                                    color: Color(0xff12060C),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10.0),
                                child: Text(
                                  "Tech",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.w200,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
               
              ],
            ),
          ),
          //#51143F light
          //#4d0a3c dark
          //#43002e darkest dark
          //#733e62 light text
           Padding(
             padding: const EdgeInsets.only(top: 160.0, left: 0.0, right: 0.0),
             child: Container(
                  width: width,
                  decoration: BoxDecoration(
                    color: Color(0xff43002e),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  child: FutureBuilder<List<News>>(
                    future: fetchNews(http.Client()),
                    builder: (BuildContext context, snapshot) => !snapshot.hasData
                        ? Center(
                          child: CircularProgressIndicator(backgroundColor: Colors.transparent,)
                          )
                        : NewsList(news: snapshot.data),
                  ),
                ),
           ),
        ],
      ),
    );
  }
}