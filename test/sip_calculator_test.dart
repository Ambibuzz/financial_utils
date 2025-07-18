import 'package:flutter_test/flutter_test.dart';
import 'package:financial_utils/sip_calculator.dart';

void main() {
  group('SipCalculator', () {
    test('calculates SIP correctly', () {
      final result = SipCalculator.calculate(
        monthlyInvestment: 1000,
        annualRatePercent: 12,
        durationInYears: 1,
      );

      expect(result.investedAmount, closeTo(12000, 0.1));
      expect(result.totalAmount, greaterThan(12000));
      expect(result.estimatedReturn, closeTo(result.totalAmount - 12000, 0.1));
    });

    test('handles zero rate gracefully', () {
      final result = SipCalculator.calculate(
        monthlyInvestment: 1000,
        annualRatePercent: 0,
        durationInYears: 1,
      );

      expect(result.totalAmount, closeTo(12000, 0.1));
      expect(result.estimatedReturn, closeTo(0, 0.1));
    });

    test('throws on negative duration', () {
      expect(
            () => SipCalculator.calculate(
          monthlyInvestment: 1000,
          annualRatePercent: 12,
          durationInYears: -1,
        ),
        throwsArgumentError,
      );
    });
  });
}
