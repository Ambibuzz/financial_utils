import 'dart:math';

class SwpCalculatorResult {
  final double investedAmount;
  final double totalWithdrawalAmount;
  final double estimatedReturn;
  final double finalCorpus;

  SwpCalculatorResult({
    required this.investedAmount,
    required this.totalWithdrawalAmount,
    required this.estimatedReturn,
    required this.finalCorpus,
  });
}

class SwpCalculator {
  static SwpCalculatorResult calculate({
    required double investmentAmount,
    required double monthlyWithdrawal,
    required double annualRatePercent,
    required int durationInMonths,
  }) {
    double remainingAmount = investmentAmount;
    double totalWithdrawn = 0.0;
    double totalInterestEarned = 0.0;
    double monthlyRate = annualRatePercent / 12 / 100;

    for (int i = 0; i < durationInMonths; i++) {
      double interest = remainingAmount * monthlyRate;
      totalInterestEarned += interest;
      remainingAmount += interest;

      if (remainingAmount >= monthlyWithdrawal) {
        remainingAmount -= monthlyWithdrawal;
        totalWithdrawn += monthlyWithdrawal;
      } else {
        // Withdraw whatever is left
        totalWithdrawn += remainingAmount;
        remainingAmount = 0.0;
        break;
      }
    }

    return SwpCalculatorResult(
      investedAmount: investmentAmount,
      totalWithdrawalAmount: totalWithdrawn,
      estimatedReturn: totalInterestEarned,
      finalCorpus: remainingAmount,
    );
  }
}
