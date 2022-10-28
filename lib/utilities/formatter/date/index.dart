import 'package:gorilla_hash/utilities/formatter/numbers/index.dart';
import 'package:gorilla_hash/utilities/jsons/index.dart';

class DateFormatter {
  String formatTime(DateTime date, int mode) {
    try {
      int hours = date.hour;
      String ampm = hours >= 12 ? 'pm' : 'am';
      hours = hours % 12;
      hours = hours != 0 ? hours : 12;

      switch (mode) {
        case 1:
          return '${NumberFormatter().addZeroToFormat(date.hour)}:${NumberFormatter().addZeroToFormat(date.minute)} ${ampm.toUpperCase()}';
        case 2:
          return '${months[date.month - 1].substring(0, 3).toUpperCase()} ${NumberFormatter().addZeroToFormat(date.day)}, ${date.year}. ${NumberFormatter().addZeroToFormat(date.hour)}:${NumberFormatter().addZeroToFormat(date.minute)} ${ampm.toUpperCase()}.';
        case 3:
          // 2021-09-21
          return '${date.year}-${NumberFormatter().addZeroToFormat(date.month)}-${NumberFormatter().addZeroToFormat(date.day)}';
        default:
          return '${NumberFormatter().addZeroToFormat(date.hour)}:${NumberFormatter().addZeroToFormat(date.minute)} ${NumberFormatter().addZeroToFormat(date.day)}/${NumberFormatter().addZeroToFormat(date.month)}';
      }
    } catch (e) {
      return '';
    }
  }

  DateTime parseTimestamp(int timestamp) {
    DateTime date = DateTime.fromMicrosecondsSinceEpoch(timestamp * 1000);
    return date.toLocal();
  }

  String isAmOrPm(int hours) {
    return hours >= 12 ? 'pm' : 'am';
  }

  String getMonth() {
    DateTime now = DateTime.now();

    String dateFormatted = '${months[now.month - 1]}';

    return dateFormatted;
  }
}
