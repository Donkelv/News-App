import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/material.dart';

class Description extends StatefulWidget {
  final String url;
  Description({this.url});
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  String url;
  @override
  void initState() {
    super.initState();
    url = widget.url;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff51143F),
        title: Text(
          "Full Article",
          style: TextStyle(
            color: Colors.white,
            fontSize: 19.0,
            fontWeight: FontWeight.w500,
          ),
        ),
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
          child: WebviewScaffold(
        url: url,
        withZoom: false,
        allowFileURLs: true,
        withLocalStorage: true,
        hidden: true,
      )),
    );
  }
}
