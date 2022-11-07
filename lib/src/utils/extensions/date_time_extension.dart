import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  /// Checks if two DateTime objects are the same day.
  /// Returns `false` if [dateTime] is null.
  bool isSameDay(DateTime? dateTime) {
    if (dateTime == null) {
      return false;
    }
    return dateTime.year == year &&
        dateTime.month == month &&
        dateTime.day == day;
  }

  /// Checks if date is after or equal to [dateTime] (date >= dateTime).
  /// Returns `false` if [dateTime] is null.
  bool isAfterOrEqualTo(DateTime? dateTime) {
    if (dateTime == null) {
      return false;
    }
    final isAtSameMomentAs = dateTime.isAtSameMomentAs(this);
    return isAtSameMomentAs | isAfter(dateTime);
  }

  /// Checks if date is before or equal to [dateTime] (date <= dateTime).
  /// Returns `false` if [dateTime] is null.
  bool isBeforeOrEqualTo(DateTime? dateTime) {
    if (dateTime == null) {
      return false;
    }
    final isAtSameMomentAs = dateTime.isAtSameMomentAs(this);
    return isAtSameMomentAs | isBefore(dateTime);
  }

  /// Checks if date is between [fromDateTime] and [toDateTime] (fromDateTime >= date >= toDateTime).
  /// Returns `false` if [fromDateTime] or [toDateTime] is null.
  bool isBetween(
    DateTime? fromDateTime,
    DateTime? toDateTime,
  ) {
    if (fromDateTime == null || toDateTime == null) {
      return false;
    }
    final isAfter = isAfterOrEqualTo(fromDateTime);
    final isBefore = isBeforeOrEqualTo(toDateTime);
    return isAfter && isBefore;
  }

  String toyMMMM() {
    return DateFormat.yMMMM().format(this);
  }

  bool equalMonthAndYear([DateTime? secondDate]) {
    secondDate ??= DateTime.now();
    return month == secondDate.month && year == secondDate.year;
  }
}
