import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:intl/intl.dart';

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

formatNumber(number) {
  try {
    dynamic formatter = NumberFormat('#,###.00');

    if (number is String) {
      if (number == '0') return '0.00';
      return formatter.format(double.parse(number));
    } else {
      if (number == 0) return '0.00';
      return formatter.format(number);
    }
  } catch (e) {
    return '';
  }
}

formatNumberNoDecimals(number) {
  try {
    dynamic formatter = NumberFormat('#,###');

    if (number.runtimeType.toString() == 'String') {
      return formatter.format(double.parse(number));
    } else {
      return formatter.format(number);
    }
  } catch (e) {
    return '';
  }
}
