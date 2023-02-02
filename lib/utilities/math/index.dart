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

calculateGananceP2P({btcArs, btcUsd, dolarModal}) {
  if (btcUsd == 0) return 0.0;

  double result = 0;
  double dolarBtc = btcArs / btcUsd;

  result = dolarBtc * 1.01;

  result = (((result / dolarModal) - 1) * 100) * -1;

  return result;
}

double calculatePriceOffer({btcArs, btcUsd}) {
  if (btcUsd == 0) return 0.0;
  double result = 0;

  double dolarBtc = btcArs / btcUsd;

  result = dolarBtc * 1.01;

  return result;
}
