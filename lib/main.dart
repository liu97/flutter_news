import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_news/widget/pull/headLoading.dart';
import 'package:flutter_news/router/router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OKToast(
      textStyle: TextStyle(fontSize: 19.0, color: Colors.white),
      backgroundColor: Colors.grey,
      radius: 10.0,
      animationCurve: Curves.easeIn,
      animationBuilder: Miui10AnimBuilder(),
      animationDuration: Duration(milliseconds: 200),
      duration: Duration(seconds: 3),
      child: RefreshConfiguration(
        headerBuilder: () => HeadLoading(),
        child: MaterialApp(
          title: '新闻资讯版',
          theme: ThemeData(
            primarySwatch: Colors.yellow,
            // dividerColor: Color.fromARGB(100, 187, 187, 187),
            dividerColor: Colors.yellow,
          ),
          initialRoute: RouteConfig.initRouteName,
          onGenerateRoute: RouteConfig.onGenerateRoute,
        ),
      ),
    );
  }
}
