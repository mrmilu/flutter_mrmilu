import 'dart:ui';

extension HexColor on Color {
  /// Convert color to Hex format
  ///
  /// Prefixes a hash sign if [leadingHashSign] is set to `true`
  /// (default is `false`).
  ///
  /// Add alpha when [withAlpha] is set to `true`
  /// (default is `false`).
  String toHex({bool leadingHashSign = false, bool withAlpha = false}) =>
      '${leadingHashSign ? '#' : ''}'
      '${withAlpha ? alpha.toRadixString(16).padLeft(2, '0') : ''}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
