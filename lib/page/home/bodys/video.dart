import 'package:flutter/material.dart';
import 'package:flutter_news/widget/input/searchBarInput.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SearchBarInput(
            onSubmitted: _onSearchSubmitted,
            hintText: hintText,
          ),
          SearchBarInput(
            onSubmitted: _onSearchSubmitted,
            hintText: hintText,
          ),
          SearchBarInput(
            onSubmitted: _onSearchSubmitted,
            hintText: hintText,
          ),
          SearchBarInput(
            onSubmitted: _onSearchSubmitted,
            hintText: hintText,
          ),
          CircleAvatar(
            backgroundImage: NetworkImage(
                "https://tvax2.sinaimg.cn/crop.0.0.896.896.180/006d1iXrly8gd0qgfhan2j30ow0owaby.jpg"),
            // maxRadius: 10.0,
            radius: 30.0,
            child: Text('data'),
          ),
        ],
      ),
    );
  }

  _onSearchSubmitted(String value) {
    setState(() {
      hintText += value;
    });
    // print(value);
  }
}
