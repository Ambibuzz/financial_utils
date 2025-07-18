import 'package:flutter_test/flutter_test.dart';
import 'package:financial_utils/lumpsum_calculator.dart';

void main() {
  group('LumpsumCalculator', () {
    test('calculates lumpsum correctly', () {
      final result = LumpsumCalculator.calculate(
        investmentAmount: 100000,
        annualRatePercent: 10,
        durationInYears: 2,
      );

      expect(result.investedAmount, equals(100000));
      expect(result.totalAmount, greaterThan(100000));
      expect(result.estimatedReturn, closeTo(result.totalAmount - 100000, 0.1));
    });

    test('handles zero rate', () {
      final result = LumpsumCalculator.calculate(
        investmentAmount: 100000,
        annualRatePercent: 0,
        durationInYears: 2,
      );

      expect(result.totalAmount, equals(100000));
      expect(result.estimatedReturn, equals(0));
    });

    test('throws on negative investment', () {
      expect(
            () => LumpsumCalculator.calculate(
          investmentAmount: -5000,
          annualRatePercent: 10,
          durationInYears: 2,
        ),
        throwsArgumentError,
      );
    });
  });
}
