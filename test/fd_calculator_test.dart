import 'package:financial_utils/fd_calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('FD calculator calculates maturity correctly', () {
    final result = FdCalculator.calculate(
      principal: 100000,
      annualRatePercent: 7,
      timeInYears: 5,
      compoundingFrequency: 4, // quarterly
    );

    expect(result.principal, 100000);
    expect(result.maturityAmount > 100000, true);
    expect(result.interestEarned, result.maturityAmount - result.principal);
  });

  test('FD with yearly compounding', () {
    final result = FdCalculator.calculate(
      principal: 50000,
      annualRatePercent: 6,
      timeInYears: 3,
      compoundingFrequency: 1, // yearly
    );

    expect(result.maturityAmount > 50000, true);
    expect(result.interestEarned > 0, true);
  });
}
