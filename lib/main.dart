import 'package:flutter/material.dart';
import 'package:news/home.dart';


void main() {
  runApp(MyApp());
}
const MaterialColor theme = MaterialColor(0xff43002e, 
const <int, Color>{
    50: const Color(0xff43002e),
    100: const Color(0xff43002e),
    200: const Color(0xff43002e),
    300: const Color(0xff43002e),
    400: const Color(0xff43002e),
    500: const Color(0xff43002e),
    600: const Color(0xff43002e),
    700: const Color(0xff43002e),
    800: const Color(0xff43002e),
    900: const Color(0xff43002e),
  },);
class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'News App Demo',
        theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: 'Montserrat'),
        home: Home());
  }
}
