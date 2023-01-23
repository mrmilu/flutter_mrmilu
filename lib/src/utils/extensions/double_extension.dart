import 'dart:math';

extension DoubleExtension on double {
  /// Return double value with [places] of precision
  double toPrecision(int places) {
    if (places < 0) {
      return this;
    }
    num mod = pow(10.0, places);
    return (this * mod).round().toDouble() / mod;
  }

  double perfectFloorRound(int places) {
    if (places < 0) {
      return this;
    }
    num mod = pow(10.0, places);
    return (this * mod).floor().toDouble() / mod;
  }

  double perfectCeilRound(int places) {
    if (places < 0) {
      return this;
    }
    num mod = pow(10.0, places);
    return (this * mod).ceil().toDouble() / mod;
  }
}
