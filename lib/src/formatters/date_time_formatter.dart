import 'package:intl/intl.dart';

extension DateTimeFormatter on DateTime {
  /// Format date time with [pattern]
  ///
  /// Optinal can pass [locale]
  String format(String pattern, {String? locale}) {
    return DateFormat(pattern, locale).format(this);
  }
}
