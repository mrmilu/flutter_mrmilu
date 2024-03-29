import 'extensions/date_time_extension.dart';

class DateTimeUtils {
  /// Generate a list of DateTime between [startDate] and [endDate],
  /// ignoring time.
  ///
  /// If don't pass endDate, will be now by default
  static List<DateTime> generateDates(
    DateTime startDate, {
    DateTime? endDate,
  }) {
    endDate ??= DateTime.now();
    final List<DateTime> dateTimes = [
      DateTime(startDate.year, startDate.month, startDate.day)
    ];
    if (startDate.isSameMonth(endDate)) {
      return dateTimes;
    }
    final monthsDifference =
        (endDate.year - startDate.year) * 12 + endDate.month - startDate.month;
    for (int i = 1; i <= monthsDifference; i++) {
      final addedMonth = startDate.month + i;

      if (addedMonth > 12) {
        final year = addedMonth ~/ 12;
        final month = addedMonth - (12 * year);
        dateTimes.add(DateTime(startDate.year + year, month, startDate.day));
        continue;
      }
      dateTimes.add(DateTime(startDate.year, addedMonth, startDate.day));
    }
    return dateTimes;
  }
}
