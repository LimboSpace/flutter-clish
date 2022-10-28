class MathUtils {
  double calculatePercentaje({required num percentaje, required num amount}) {
    double result = (percentaje / 100) * amount;

    return result;
  }

  String porcentagePartOfTotal(
      {required num amountTotal, required num amount}) {
    double result = (amount / amountTotal) * 100;

    return result.isInfinite || result.isNaN ? '0' : result.toStringAsFixed(1);
  }
}
