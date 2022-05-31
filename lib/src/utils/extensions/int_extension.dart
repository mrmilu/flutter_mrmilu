import 'package:intl/intl.dart';

import '../../helpers/helpers.dart';

extension MoneyExtension on int {
  /// Converts int value to local currency.
  ///
  /// This method get locale from device to format number currency
  ///
  /// By default [decimalDigits] is `0`
  /// By default [currency] is `€`
  String toMoney({int decimalDigits = 0, String currency = '€'}) =>
      NumberFormat.simpleCurrency(
        locale: Helpers.getLocale(),
        name: currency,
        decimalDigits: decimalDigits,
      ).format(this / 100);
}
