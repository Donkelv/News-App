import 'package:flutter/material.dart';
import 'package:news/provider/newsClass.dart';

import 'descriptionPage.dart';

class NewsList extends StatelessWidget {
  final List<News> news;

  NewsList({Key key, this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: news.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(20.0),
          child: InkWell(
            onTap: () {
              print(MediaQuery.of(context).size.height);
            },
            child: InkWell(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => Description(url: news[index].url),),);
                
                print("pressed");
              },
              child: Material(
                  elevation: 5.0,
                  color: Color(0xff51143F),
                  borderRadius: BorderRadius.circular(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          top: 0.0,
                          right: 0.0,
                          left: 0.0,
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0)),
                            child: Image.network(
                              '${news[index].imageurl}',
                              height: height * 0.234,
                              width: width,
                              fit: BoxFit.cover,
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 30.0,
                          left: 30.0,
                          right: 40.0,
                        ),
                        child: Text(
                          '${news[index].title}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 20.0, left: 30.0, right: 40.0, bottom: 20.0),
                        child: Text(
                          '${news[index].description}',
                          style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        );
      },
    );
  }
}
