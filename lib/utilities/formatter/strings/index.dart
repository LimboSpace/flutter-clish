import 'package:gorilla_hash/utilities/formatter/numbers/index.dart';

class StringsFormatter {
  String formatHoursAndMinutesFromMinutes({required Duration duration}) {
    int allMinutes = duration.inMinutes;

    int hours = allMinutes ~/ 60;
    int minutes = allMinutes % 60;

    return '${NumberFormatter().addZeroToFormat(hours, addZeroToZero: true)}:${NumberFormatter().addZeroToFormat(minutes, addZeroToZero: true)} h';
  }

  String capitalize(String? text) {
    if (text == null || text.isEmpty) return '';

    if (text.length < 2) return text.toUpperCase();

    return "${text[0].toUpperCase()}${text.substring(1).toLowerCase()}";
  }

  String normalizeText(String? text) {
    if (text == null) return 'nulo';

    text = text.replaceAll('_', ' ');

    return capitalize(text).trim();
  }

  String desNormalizeText(String? text) {
    if (text == null) return '';

    text = text.replaceAll(' ', '_');

    return text.toLowerCase().trim();
  }

  String cutString(String? text, int maxLength) {
    if (text == null) return '-';

    return capitalize(
        text.substring(0, text.length > maxLength ? maxLength : text.length));
  }
}
