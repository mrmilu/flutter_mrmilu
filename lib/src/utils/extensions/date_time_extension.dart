import 'package:flutter/material.dart';

extension DateTimeExtension on DateTime {
  /// Checks if two DateTime objects are the same day.
  ///
  /// If don't pass dateTime, will be now by default
  bool isSameDay([DateTime? dateTime]) {
    dateTime ??= DateTime.now();
    return DateUtils.isSameDay(this, dateTime);
  }

  /// Checks if date is after or equal to [dateTime] (`date >= dateTime`).
  ///
  /// If don't pass dateTime, will be now by default
  bool isAfterOrEqualTo([DateTime? dateTime]) {
    dateTime ??= DateTime.now();
    final isAtSameMomentAs = dateTime.isAtSameMomentAs(this);
    return isAtSameMomentAs || isAfter(dateTime);
  }

  /// Checks if date is before or equal to [dateTime] (`date <= dateTime`).
  ///
  /// If don't pass dateTime, will be now by default
  bool isBeforeOrEqualTo([DateTime? dateTime]) {
    dateTime ??= DateTime.now();
    final isAtSameMomentAs = dateTime.isAtSameMomentAs(this);
    return isAtSameMomentAs || isBefore(dateTime);
  }

  /// Checks if date is between [fromDateTime] and [toDateTime]
  /// (`fromDateTime >= date >= toDateTime`).
  ///
  /// Use includeStartDate and includeEndDate to include or exclude
  /// the start and end time when compare dates
  bool isBetween(
    DateTime fromDateTime,
    DateTime toDateTime, {
    bool includeStartDate = true,
    bool includeEndDate = true,
  }) {
    final after = includeStartDate
        ? isAfterOrEqualTo(fromDateTime)
        : isAfter(fromDateTime);
    final before =
        includeEndDate ? isBeforeOrEqualTo(toDateTime) : isBefore(toDateTime);
    return after && before;
  }

  /// Checks if two DateTime objects are the month and year.
  ///
  /// If don't pass dateTime, will be now by default
  bool isSameMonth([DateTime? secondDate]) {
    secondDate ??= DateTime.now();
    return DateUtils.isSameMonth(this, secondDate);
  }

  /// Get difference in year between `DateTime.now()` and [this] date
  ///
  /// Warning: This calculation don't consider years with 366 days
  // TODO: Improve with this implementation: https://github.com/JErazo7/age_calculator
  int yearsFromNow() {
    return (DateTime.now().difference(this).inDays / 365).round();
  }
}
