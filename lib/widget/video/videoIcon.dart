import 'package:flutter/material.dart';
import 'package:flutter_news/util/timeUtil.dart';

// 视频相关的icon按钮
class VideoIconWidget extends StatelessWidget {
  // 在这里定制按钮类型
  static const play = Icons.play_arrow;
  static const pause = Icons.pause;

  final IconData icon;
  final double width;
  final double height;
  final Function onClick;

  const VideoIconWidget(
      {Key key,
      this.icon = play,
      this.width = 40.0,
      this.height = 40.0,
      this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double minSize = width > height ? height : width;
    return GestureDetector(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Color.fromARGB(100, 0, 0, 0),
          borderRadius: BorderRadius.circular(minSize),
        ),
        child: Center(
          child: Icon(
            icon,
            color: Color.fromARGB(255, 255, 255, 255),
            size: minSize / 2,
          ),
        ),
      ),
      onTap: onClick,
    );
  }
}

class VideoDurationWidget extends StatelessWidget {
  final double duration;
  final double width;
  final double height;
  final double fontSize;

  const VideoDurationWidget(
      {Key key,
      @required this.duration,
      this.width = 40.0,
      this.height = 20.0,
      this.fontSize = 11.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Color.fromARGB(100, 0, 0, 0),
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: Center(
        child: Text(
          TimeUtil.secondToString(duration),
          style: TextStyle(
              fontSize: fontSize, color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
    );
  }
}
