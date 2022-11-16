import 'dart:math';

extension DoubleExtension on double {
  /// Return double value with [places] of precision
  double toPrecision(int places) {
    num mod = pow(10.0, places);
    return ((this * mod).round().toDouble() / mod);
  }
}
