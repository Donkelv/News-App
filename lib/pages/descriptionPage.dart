import 'package:flutter/material.dart';

class Description extends StatefulWidget {
  Description({Key key}) : super(key: key);

  @override
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Full Article", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}