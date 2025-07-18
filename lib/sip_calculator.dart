import 'dart:math';

class SipCalculatorResult {
  final double investedAmount;
  final double estimatedReturn;
  final double totalAmount;

  SipCalculatorResult({
    required this.investedAmount,
    required this.estimatedReturn,
    required this.totalAmount,
  });
}

class SipCalculator {
  static SipCalculatorResult calculate({
    required double monthlyInvestment,
    required double annualRatePercent,
    required int durationInYears,
  }) {
    if (monthlyInvestment <= 0) {
      throw ArgumentError('Monthly investment must be greater than 0');
    }
    if (durationInYears <= 0) {
      throw ArgumentError('Duration must be greater than 0');
    }

    final r = annualRatePercent / 12 / 100;
    final n = durationInYears * 12;
    final invested = monthlyInvestment * n;

    final fv = r == 0
        ? invested // simple total if no interest
        : monthlyInvestment * ((pow(1 + r, n) - 1) / r) * (1 + r);

    final returnAmount = fv - invested;

    return SipCalculatorResult(
      investedAmount: invested,
      estimatedReturn: returnAmount,
      totalAmount: fv,
    );
  }
}
