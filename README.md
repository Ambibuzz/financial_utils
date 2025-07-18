# financial_utils

A lightweight Dart package for common financial calculations. Currently supports:

- 📈 **SIP (Systematic Investment Plan) Calculator**
- 💰 **Lumpsum Investment Calculator**

Ideal for personal finance tools, mutual fund apps, and educational purposes.

---

## ✨ Features

- **SIP Calculator**  
  Calculate the future value, invested amount, and estimated returns for a monthly investment over a fixed duration with compounded annual returns.

- **Lumpsum Calculator**  
  Calculate the future value, invested amount, and estimated returns for a one-time investment with compounded annual returns.

---

## 🚀 Getting started

Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  financial_utils: ^0.0.1
```
```dart
import 'package:financial_utils/sip_calculator.dart';
import 'package:financial_utils/lumpsum_calculator.dart';
```



## SIP Example

```dart
final sip = SipCalculator.calculate(
  monthlyInvestment: 5000,
  annualRatePercent: 12,
  durationInYears: 10,
);

print('Invested: ₹${sip.investedAmount}');
print('Return: ₹${sip.estimatedReturn}');
print('Total: ₹${sip.totalAmount}');

```

## Lumpsum Example

```dart
final lumpsum = LumpsumCalculator.calculate(
  investmentAmount: 100000,
  annualRatePercent: 10,
  durationInYears: 5,
);

print('Invested: ₹${lumpsum.investedAmount}');
print('Return: ₹${lumpsum.estimatedReturn}');
print('Total: ₹${lumpsum.totalAmount}');

```
