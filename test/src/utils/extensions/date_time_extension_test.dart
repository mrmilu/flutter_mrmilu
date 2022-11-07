import 'package:flutter_mrmilu/flutter_mrmilu.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('isSameDay -', () {
    test('will be false when secondary datetime is null', () {
      final primary = DateTime.now();

      final result = primary.isSameDay(null);
      expect(result, false);
    });
    test(
        'will be false when secondary datetime is different day than primary date time',
        () {
      final primary = DateTime.now();
      final secondary = primary.add(const Duration(days: 1));
      final secondary2 = primary.add(const Duration(days: 365));

      final result = primary.isSameDay(secondary);
      final result2 = primary.isSameDay(secondary2);

      expect(result, false);
      expect(result2, false);

      final secondary3 = primary.subtract(const Duration(days: 1));
      final secondary4 = primary.subtract(const Duration(days: 1));

      final result3 = primary.isSameDay(secondary3);
      final result4 = primary.isSameDay(secondary4);

      expect(result3, false);
      expect(result4, false);
    });
    test('will be true when datetimes has same day, month and year', () {
      final primary = DateTime.now();
      final secondary = DateTime.now();

      final result = primary.isSameDay(secondary);

      expect(result, true);
    });
  });
  group('isAfterOrEqualTo', () {
    test('will be false when secondary datetime is null', () {
      final primary = DateTime.now();

      final result = primary.isAfterOrEqualTo(null);
      expect(result, false);
    });
    // TODO: Implement more tests
  });
  group('isBeforeOrEqualTo', () {
    test('will be false when secondary datetime is null', () {
      final primary = DateTime.now();

      final result = primary.isBeforeOrEqualTo(null);
      expect(result, false);
    });
    // TODO: Implement more tests
  });
  group('isBetween', () {
    test('will be false when someone of datetimes are null', () {
      final primary = DateTime.now();

      final result = primary.isBetween(null, null);
      final result2 = primary.isBetween(DateTime.now(), null);
      final result3 = primary.isBetween(null, DateTime.now());

      expect(result, false);
      expect(result2, false);
      expect(result3, false);
    });
    // TODO: Implement more tests
  });
  group('equalMonthAndYear', () {});
}
