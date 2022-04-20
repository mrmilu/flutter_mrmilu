import '../utils/extensions/date_time_extension.dart';

class DateValidators {
  /// Checks if [age] is greather than [legalAdultAge]
  ///
  /// By default [legalAdultAge] is [18]
  static bool isLegalAdult(DateTime age, {int legalAdultAge = 18}) {
    DateTime compareDate = DateTime(
      age.year + legalAdultAge,
      age.month,
      age.day,
    );

    return compareDate.isBeforeOrEqualTo(DateTime.now());
  }

  /// Checks if [date] is after now (DateTime.now())
  static bool isFuture(DateTime date) {
    return date.isAfter(DateTime.now());
  }
}
