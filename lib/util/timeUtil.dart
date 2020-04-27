class TimeUtil {
  static String secondToString(double dSecond) {
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
}
