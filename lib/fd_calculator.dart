import 'dart:math';

class FdCalculatorResult {
  final double principal;
  final double maturityAmount;
  final double interestEarned;

  FdCalculatorResult({
    required this.principal,
    required this.maturityAmount,
    required this.interestEarned,
  });
}

class FdCalculator {
  /// Calculates FD maturity using compound interest formula:
  /// A = P * (1 + r/n)^(n*t)
  ///
  /// [principal] - initial deposit
  /// [annualRatePercent] - annual interest rate in percentage
  /// [timeInYears] - time in years
  /// [compoundingFrequency] - number of times interest is compounded per year (e.g., 1, 2, 4, 12)
  static FdCalculatorResult calculate({
    required double principal,
    required double annualRatePercent,
    required double timeInYears,
    int compoundingFrequency = 1,
  }) {
    double rate = annualRatePercent / 100;
    double maturityAmount =
        principal * (pow((1 + rate / compoundingFrequency), compoundingFrequency * timeInYears));
    double interest = maturityAmount - principal;

    return FdCalculatorResult(
      principal: principal,
      maturityAmount: maturityAmount,
      interestEarned: interest,
    );
  }
}
