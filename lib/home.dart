import 'package:flutter/material.dart';
import 'package:news/pages/category.dart';
import 'pages/newsList.dart';
import 'provider/argClass.dart';
import 'provider/newsClass.dart';
import 'provider/newsProvider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //final news = NewsModel();
  String assetTech = "assets/tech.svg";
  String assetSport = "assets/sport.svg";
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var feed = Provider.of<List<News>>(context);
    NewsModel newsModel = Provider.of<NewsModel>(context);
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
      body: SafeArea(
        child: Stack(
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
                    ),
                  ),
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
                                child: InkWell(
                                  onTap: () {
                                    newsModel.notifyApi(Constant.politicsFeed);

                                    Navigator.pushNamed(
                                      context,
                                      CategoryProvider.routeName,
                                      arguments: Argu(newsModel.getCate(),
                                          Constant.politicsTitle),
                                    );
                                  },
                                  child: Material(
                                    borderRadius: BorderRadius.circular(25.0),
                                    color: Colors.white,
                                    elevation: 8,
                                    child: Icon(
                                      Icons.account_balance,
                                      size: 20,
                                      color: Color(0xff12060C),
                                    ),
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
                                  child: InkWell(
                                    onTap: () {
                                      newsModel.notifyApi(Constant.sportFeed);
                                      /* Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext coontext) =>
                                              Category(
                                            cat: news.getCate(),
                                            title: Constant.sportTitle,
                                          ),
                                        ),
                                      ); */
                                      print(newsModel.getCate());
                                      Navigator.pushNamed(
                                        context,
                                        CategoryProvider.routeName,
                                        arguments: Argu(newsModel.getCate(),
                                            Constant.sportTitle),
                                      );
                                    },
                                    child: Material(
                                      borderRadius: BorderRadius.circular(25.0),
                                      color: Colors.white,
                                      elevation: 8,
                                      child: SvgPicture.asset(
                                        assetSport,
                                        color: Color(0xff12060C),
                                        fit: BoxFit.scaleDown,
                                      ),
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
                                  child: InkWell(
                                    onTap: () {
                                      newsModel.notifyApi(Constant.techFeed);
                                      print(
                                          "the cat is ${newsModel.getCate()}");
                                      Navigator.pushNamed(
                                        context,
                                        CategoryProvider.routeName,
                                        arguments: Argu(
                                          newsModel.getCate(),
                                          Constant.techTitle,
                                        ),
                                      );
                                    },
                                    child: Material(
                                      borderRadius: BorderRadius.circular(25.0),
                                      color: Colors.white,
                                      elevation: 8,
                                      child: SvgPicture.asset(
                                        assetTech,
                                        color: Color(0xff12060C),
                                        fit: BoxFit.scaleDown,
                                      ),
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
                color: Colors.transparent,
                child: Material(
                  elevation: 5.0,
                  color: Color(0xff43002e),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35.0),
                    topRight: Radius.circular(35.0),
                  ),
                  child: NewsList(cat: newsModel.getCate(), feed: feed),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
