import 'package:flutter/material.dart';
import 'package:news/home.dart';
import 'package:news/pages/category.dart';
import 'package:provider/provider.dart';
import 'package:news/provider/newsProvider.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

const MaterialColor theme = MaterialColor(
  0xff51143F,
  const <int, Color>{
    50: const Color(0xff51143F),
    100: const Color(0xff51143F),
    200: const Color(0xff51143F),
    300: const Color(0xff51143F),
    400: const Color(0xff51143F),
    500: const Color(0xff51143F),
    600: const Color(0xff51143F),
    700: const Color(0xff51143F),
    800: const Color(0xff51143F),
    900: const Color(0xff51143F),
  },
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App Demo',
      theme: ThemeData(
          primarySwatch: theme,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Montserrat'),
      initialRoute: '/',
      routes: {
        '/': (context) => MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (_) => NewsModel(),
                ),
                FutureProvider(
                  create: (_) => fetchNews(
                    http.Client(),
                    Constant.newsFeed,
                  ).catchError(
                    (error) => print("$error"),
                  ),
                ),
              ],
              child: Home(),
            ),
        '/category': (context) => CategoryProvider(),
      },
    );
  }
}
