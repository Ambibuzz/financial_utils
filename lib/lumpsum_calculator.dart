import 'dart:math';

class LumpsumCalculatorResult {
  final double investedAmount;
  final double estimatedReturn;
  final double totalAmount;

  LumpsumCalculatorResult({
    required this.investedAmount,
    required this.estimatedReturn,
    required this.totalAmount,
  });
}

class LumpsumCalculator {
  static LumpsumCalculatorResult calculate({
    required double investmentAmount,
    required double annualRatePercent,
    required int durationInYears,
  }) {
    if (investmentAmount <= 0) {
      throw ArgumentError('Investment amount must be greater than 0');
    }
    if (durationInYears <= 0) {
      throw ArgumentError('Duration must be greater than 0');
    }

    final r = annualRatePercent / 100;
    final n = durationInYears;

    // If rate is 0%, just return the invested amount
    final fv = r == 0
        ? investmentAmount
        : investmentAmount * pow(1 + r, n);

    final returnAmount = fv - investmentAmount;

    return LumpsumCalculatorResult(
      investedAmount: investmentAmount,
      estimatedReturn: returnAmount,
      totalAmount: fv,
    );
  }
}
