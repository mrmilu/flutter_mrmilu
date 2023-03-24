import 'dart:math';

extension DoubleExtension on double {
  /// Return double value with [places] of precision
  ///
  /// `0 <= places <= 10`
  double toPrecision(int places) {
    assert(places <= 10, 'Places need to be equal or lower than 20');
    if (places < 0) {
      return this;
    }
    num exp = _decimalExp(places);
    return (this * exp).roundToDouble() / exp;
  }

  /// Return double value with [places] of precision
  /// rounded to floor
  ///
  /// `0 <= places <= 10`
  double perfectFloorRound(int places) {
    assert(places <= 10, 'Places need to be equal or lower than 20');
    if (places < 0) {
      return this;
    }
    num exp = _decimalExp(places);
    return (this * exp).floorToDouble() / exp;
  }

  /// Return double value with [places] of precision
  /// rounded to ceil
  ///
  /// `0 <= places <= 10`
  double perfectCeilRound(int places) {
    assert(places <= 10, 'Places need to be equal or lower than 20');
    if (places < 0) {
      return this;
    }
    num exp = _decimalExp(places);
    return (this * exp).ceilToDouble() / exp;
  }

  num _decimalExp(int places) {
    return pow(10.0, places);
  }
}
