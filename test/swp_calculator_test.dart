import 'package:financial_utils/swp_calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('SWP Calculator basic test', () {
    final result = SwpCalculator.calculate(
      investmentAmount: 100000,
      monthlyWithdrawal: 2000,
      annualRatePercent: 12,
      durationInMonths: 12,
    );

    expect(result.investedAmount, 100000);
    expect(result.totalWithdrawalAmount > 20000, true); // Should withdraw at least this much
    expect(result.estimatedReturn > 0, true);
    expect(result.finalCorpus >= 0, true);
  });

  test('SWP ends early if balance depletes', () {
    final result = SwpCalculator.calculate(
      investmentAmount: 5000,
      monthlyWithdrawal: 2000,
      annualRatePercent: 5,
      durationInMonths: 12,
    );

    // It should stop before 12 months
    expect(result.totalWithdrawalAmount < 24000, true);
    expect(result.finalCorpus, 0);
  });
}
