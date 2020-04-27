import 'package:flutter/material.dart';
import 'package:flutter_news/model/recommend.dart';
import 'package:flutter_news/widget/video/videoIcon.dart';

import 'package:oktoast/oktoast.dart';

class VideoPage extends StatefulWidget {
  VideoPage({Key key}) : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  String hintText;
  @override
  void initState() {
    super.initState();
    //初始化状态
    hintText = "hintText";

    _init();
  }

  _init() async {
    // NewsDao db = NewsDao();
    // Recommend recommend = Recommend.fromJson(map);

    // for (int i = 0; i < recommend?.articles?.length; i++) {
    //   recommend.articles[i].channelId = recommend.channelId;
    //   await db.insert(recommend.articles[i]);
    // }
    // await db.dropTable();
    // List<News> newss = await db.getLimitNews(rows: 20);
    // print(newss.length);
  }

  @override
  Widget build(BuildContext context) {
    Widget avatar = Image.network(
      'http://p.cdn.sohu.com/covers/bda8abd2/5833065f62b3b0300631ec747874d166.jpeg',
      width: 150.0,
    );
    return Center(
      child: Column(
        children: <Widget>[
          avatar, //不剪裁
          ClipOval(child: avatar), //剪裁为圆形
          ClipRRect(
            //剪裁为圆角矩形
            borderRadius: BorderRadius.circular(5.0),
            child: avatar,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                widthFactor: .5, //宽度设为原来宽度一半，另一半会溢出
                child: avatar,
              ),
              Text(
                "你好世界",
                style: TextStyle(color: Colors.green),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipRect(
                //将溢出部分剪裁
                child: Align(
                  alignment: Alignment.topLeft,
                  widthFactor: .5, //宽度设为原来宽度一半
                  child: avatar,
                ),
              ),
              Text("你好世界", style: TextStyle(color: Colors.green))
            ],
          ),
          VideoIconWidget(icon: VideoIconWidget.pause,onClick: _showToast,),
          VideoDurationWidget(duration: 270.0)
        ],
      ),
    );
  }

  void _showToast() {
    print('111');
    // 3.1 use showToast method
    showToast(
      "1111",
      position: ToastPosition.bottom,
      backgroundColor: Colors.black.withOpacity(0.8),
      radius: 13.0,
      textStyle: TextStyle(fontSize: 18.0),
      animationBuilder: Miui10AnimBuilder(),
    );

    showToast(
      "1111",
      duration: Duration(milliseconds: 3500),
      position: ToastPosition.top,
      backgroundColor: Colors.black.withOpacity(0.8),
      radius: 3.0,
      textStyle: TextStyle(fontSize: 30.0),
    );

    // 3.2 use showToastWidget method
    Widget widget = Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: Container(
          width: 40.0,
          height: 40.0,
          color: Colors.grey.withOpacity(0.3),
          child: Icon(
            Icons.add,
            size: 30.0,
            color: Colors.green,
          ),
        ),
      ),
    );
    ToastFuture toastFuture = showToastWidget(
      widget,
      duration: Duration(seconds: 3),
      onDismiss: () {
        print(
            "the toast dismiss"); // the method will be called on toast dismiss.
      },
    );

    // can use future
    Future.delayed(Duration(seconds: 2), () {
      toastFuture.dismiss(); // dismiss
    });
  }

  _onSearchSubmitted(String value) {
    setState(() {
      hintText += value;
    });
    // print(value);
  }
}
