import 'package:faker_dart/faker_dart.dart';
import 'package:flutter_mrmilu/flutter_mrmilu.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final faker = Faker.instance;
  group('isSameDay -', () {
    test('will be true when secondary datetime is null and get default', () {
      final primary = DateTime.now();

      final result = primary.isSameDay();
      expect(result, true);
    });
    test(
        'will be false when secondary datetime is different day than primary date time',
        () {
      final primary = DateTime.now();
      final secondary = faker.date.future(primary);
      final secondary2 = faker.date.future(primary);

      final result = primary.isSameDay(secondary);
      final result2 = primary.isSameDay(secondary2);

      expect(result, false);
      expect(result2, false);

      final secondary3 = faker.date.past(primary);
      final secondary4 = faker.date.past(primary);

      final result3 = primary.isSameDay(secondary3);
      final result4 = primary.isSameDay(secondary4);

      expect(result3, false);
      expect(result4, false);
    });
    test('will be true when datetimes has same day, month and year', () {
      final primary = faker.date.future(DateTime.now());
      final secondary = primary;

      final result = primary.isSameDay(secondary);

      expect(result, true);
    });
  });
  group('isAfterOrEqualTo', () {
    test('will be false when secondary datetime is null and get default', () {
      final primary = DateTime.now();

      final result = primary.isAfterOrEqualTo();
      // Only false for a litle difference on microseconds
      expect(result, false);
    });
    // TODO: Implement more tests
  });
  group('isBeforeOrEqualTo', () {
    test('will be true when secondary datetime is null and get default', () {
      final primary = DateTime.now();

      final result = primary.isBeforeOrEqualTo();
      // Only true for a litle difference on microseconds
      expect(result, true);
    });
    test('will be true when date is before date', () {
      final primary = DateTime.now();
      final date = faker.date.future(primary);

      final result = primary.isBeforeOrEqualTo(date);

      expect(result, true);
    });
    // TODO: Implement more tests
  });
  group('isBetween', () {
    test('will be false when date is out of range', () {
      final primary = DateTime.now();
      final end = primary.subtract(const Duration(days: 1));
      final start = faker.date.past(end);

      final result = primary.isBetween(start, end);

      expect(result, false);
    });
    test('will be true when date is inside of range', () {
      final primary = DateTime.now();
      final end = faker.date.future(primary);
      final start = faker.date.past(primary);

      final result = primary.isBetween(start, end);

      expect(result, true);
    });
    // TODO: Implement more tests
  });
  group('isSameMonth', () {
    test('will be true when get default', () {
      final primary = DateTime.now();

      final result = primary.isSameMonth();

      expect(result, true);
    });
    test('will be false when date is before month', () {
      final primary = DateTime.now();
      final secondary =
          faker.date.past(primary.subtract(const Duration(days: 32)));

      final result = primary.isSameMonth(secondary);

      expect(result, false);
    });
    // TODO: Implement more tests
  });
}
