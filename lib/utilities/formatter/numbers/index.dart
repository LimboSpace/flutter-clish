import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';

class NumberFormatter {
  String addZeroToFormat(int number, {bool addZeroToZero = false}) {
    if (number == 0 && !addZeroToZero) {
      return ' 0';
    }

    if (number < 10) {
      return '0$number';
    }
    return number.toString();
  }

  String formatCurrency(String originalString) {
    final CurrencyTextInputFormatter formatter = CurrencyTextInputFormatter(
      symbol: ' ',
    );

    return formatter.format(originalString);
  }

  String reduceNumber(num number) {
    if (number < 1000) {
      return number.toString();
    }

    if (number < 1000000) {
      return '${(number / 1000).toStringAsFixed(1)}K';
    }

    if (number < 1000000000) {
      return '${(number / 1000000).toStringAsFixed(1)}M';
    }

    return '${(number / 1000000000).toStringAsFixed(1)}B';
  }
}
