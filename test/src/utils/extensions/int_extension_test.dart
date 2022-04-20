import 'package:flutter_mrmilu/flutter_mrmilu.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('toMoney - ', () {
    test('will be true when convert to Euros (€) without cents', () {
      expect(
        _contains(300.toMoney(), amountContain: '3', currecyContain: '€'),
        true,
      );
      expect(
        _contains(350.toMoney(), amountContain: '4', currecyContain: '€'),
        true,
      );
      expect(
        _contains(351.toMoney(), amountContain: '4', currecyContain: '€'),
        true,
      );
      expect(
        _contains(0.toMoney(), amountContain: '0', currecyContain: '€'),
        true,
      );
    });
    test('convert to Euros (€) with cents', () {
      expect(
        _contains(300.toMoney(decimalDigits: 2),
            amountContain: '3', currecyContain: '€', decimalsContain: '00'),
        true,
      );
      expect(
        _contains(350.toMoney(decimalDigits: 2),
            amountContain: '3', currecyContain: '€', decimalsContain: '50'),
        true,
      );
      expect(
        _contains(351.toMoney(decimalDigits: 2),
            amountContain: '3', currecyContain: '€', decimalsContain: '51'),
        true,
      );
      expect(
        _contains(0.toMoney(decimalDigits: 2),
            amountContain: '0', currecyContain: '€', decimalsContain: '00'),
        true,
      );
    });
    test('will be true when convert to Dollars without cents', () {
      expect(
        _contains(300.toMoney(currency: '\$'),
            amountContain: '3', currecyContain: '\$'),
        true,
      );
      expect(
        _contains(350.toMoney(currency: '\$'),
            amountContain: '4', currecyContain: '\$'),
        true,
      );
      expect(
        _contains(351.toMoney(currency: '\$'),
            amountContain: '4', currecyContain: '\$'),
        true,
      );
      expect(
        _contains(0.toMoney(currency: '\$'),
            amountContain: '0', currecyContain: '\$'),
        true,
      );
    });
    test('convert to Dollars with cents', () {
      expect(
        _contains(300.toMoney(decimalDigits: 2, currency: '\$'),
            amountContain: '3', currecyContain: '\$', decimalsContain: '00'),
        true,
      );
      expect(
        _contains(350.toMoney(decimalDigits: 2, currency: '\$'),
            amountContain: '3', currecyContain: '\$', decimalsContain: '50'),
        true,
      );
      expect(
        _contains(351.toMoney(decimalDigits: 2, currency: '\$'),
            amountContain: '3', currecyContain: '\$', decimalsContain: '51'),
        true,
      );
      expect(
        _contains(0.toMoney(decimalDigits: 2, currency: '\$'),
            amountContain: '0', currecyContain: '\$', decimalsContain: '00'),
        true,
      );
    });
  });
}

bool _contains(
  String value, {
  required String amountContain,
  required String currecyContain,
  String decimalsContain = '',
}) {
  final result =
      value.contains(amountContain) && value.contains(currecyContain);
  if (decimalsContain.isEmpty) {
    return result;
  }
  return result && value.contains(decimalsContain);
}
