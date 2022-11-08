import 'package:faker_dart/faker_dart.dart';
import 'package:flutter_mrmilu/src/utils/date_time_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final faker = Faker.instance;
  test('will be generate one option when has equal start date and end date',
      () {
    final pastDate = faker.date.past(DateTime.now());

    final options = DateTimeUtils.generateDates(pastDate, endDate: pastDate);

    expect(options.length, 1);
    expect(options.first.year, pastDate.year);
    expect(options.first.month, pastDate.month);
    expect(options.first.day, pastDate.day);

    final now = DateTime.now();

    final options2 = DateTimeUtils.generateDates(now);

    expect(options2.length, 1);
    expect(options2.first.year, now.year);
    expect(options2.first.month, now.month);
    expect(options2.first.day, now.day);
  });
  test(
      'will be generate one option when has start date and end date with different day',
      () {
    final pastDate = faker.date.past(DateTime.now());
    final startDate = DateTime(
      pastDate.year,
      pastDate.month,
      faker.datatype.number(min: 1, max: 28),
    );
    final endDate = DateTime(
      pastDate.year,
      pastDate.month,
      faker.datatype.number(min: 1, max: 28),
    );

    final options = DateTimeUtils.generateDates(startDate, endDate: endDate);

    expect(options.length, 1);
    expect(options.first.year, startDate.year);
    expect(options.first.month, startDate.month);
    expect(options.first.day, startDate.day);
  });
  test(
      'will be generate two options when has start date and end date with one month of difference',
      () {
    final pastDate = faker.date.past(DateTime.now());
    final startDate = DateTime(pastDate.year);
    final endDate = DateTime(pastDate.year, 2);

    final options = DateTimeUtils.generateDates(startDate, endDate: endDate);

    expect(options.length, 2);
    expect(options.first.year, startDate.year);
    expect(options.first.month, startDate.month);
    expect(options.last.year, endDate.year);
    expect(options.last.month, endDate.month);
  });
  test(
      'will be generate 13 options when start date and end date has one year of difference',
      () {
    final pastDate = faker.date.past(DateTime.now());
    final startDate = DateTime(pastDate.year, pastDate.month);
    final endDate = DateTime(pastDate.year + 1, pastDate.month);

    final options = DateTimeUtils.generateDates(startDate, endDate: endDate);

    expect(options.length, 13);
    expect(options.first.year, startDate.year);
    expect(options.first.month, startDate.month);
    expect(options.last.year, endDate.year);
    expect(options.last.month, endDate.month);
  });
  test('will be generate N options when start date and end date are different',
      () {
    final startDate = faker.date.past(DateTime.now());
    final endDate = faker.date.future(DateTime.now());

    final options = DateTimeUtils.generateDates(startDate, endDate: endDate);

    expect(options.length > 1, true);
    expect(options.first.year, startDate.year);
    expect(options.first.month, startDate.month);
    expect(options.last.year, endDate.year);
    expect(options.last.month, endDate.month);
  });
}
