import 'package:flutter/material.dart';
import 'package:flutter_news/router/router.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '新闻资讯版',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      initialRoute: RouteConfig.initRouteName,
      onGenerateRoute: RouteConfig.onGenerateRoute,
    );
  }
}