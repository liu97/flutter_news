import 'package:date_format/date_format.dart';

class TimeUtil {
  static String secondToString(double dSecond) {
    // 将秒转为时分秒
    int hour = (dSecond / 3600).floor();
    int minute = (dSecond / 60).floor();
    int second = dSecond.floor() % 60;

    String result = '';
    if (hour != 0) {
      result += hour.toString().padLeft(2, '0') + ':';
    }
    if (minute != 0) {
      result += minute.toString().padLeft(2, '0') + ':';
    }
    if (second != 0) {
      result += second.toString().padLeft(2, '0');
    }

    return result;
  }

  // 微秒
  // var date = new DateTime.fromMicrosecondsSinceEpoch(timestamp);
  // 毫秒
  // var date = new DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  static String historyDate(int millisecondsSinceEpoch) {
    // 传入历史毫秒时间戳格式化为常用时间格式
    DateTime historyDate =
        new DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
    DateTime nowDate = new DateTime.now();
    Duration difference = nowDate.difference(historyDate);
    String result = '';
    int historyDateYear = int.parse(formatDate(historyDate, [yyyy]));
    int nowDateYear = int.parse(formatDate(nowDate, [yyyy]));

    if (nowDateYear - historyDateYear > 0) {
      // 去年或者更早
      result = formatDate(historyDate, [yyyy, '-', mm, '-', dd]);
    } else if (nowDateYear - historyDateYear > 0) {
      result = '传入时间不是历史时间';
    } else {
      if (difference.inDays > 0) {
        result = formatDate(historyDate, [mm, '-', dd]);
      } else if (difference.inHours > 0) {
        result = '${difference.inHours}小时前';
      } else if (difference.inMinutes > 0) {
        result = '${difference.inMinutes}分钟前';
      } else if (difference.inSeconds > 0) {
        result = '${difference.inSeconds}秒前';
      } else {
        result = '刚刚';
      }
    }

    return result;
  }
}
