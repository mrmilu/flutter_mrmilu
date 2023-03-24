import 'package:faker_dart/faker_dart.dart';
import 'package:flutter_mrmilu/flutter_mrmilu.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final faker = Faker.instance;

  group('toPrecision', () {
    test('when pass negative precision then return the same value', () {
      final double value = faker.datatype.float();

      final preciseValue = value.toPrecision(-faker.datatype.number(min: 1));

      expect(value, preciseValue);
    });
    test('when pass 0 precision then return value with 0 precision', () {
      final double value = faker.datatype.float();

      final preciseValue = value.toPrecision(0);
      final expectedValue = double.parse(value.toStringAsFixed(0));

      expect(expectedValue, preciseValue);
    });
    test('when pass N precision then return value with N precision', () {
      final int precision = faker.datatype.number(min: 1, max: 10);
      final double value = faker.datatype.float(
        precision: faker.datatype.number(min: precision, max: 11),
      );

      final preciseValue = value.toPrecision(precision);
      final expectedValue = double.parse(value.toStringAsFixed(precision));

      expect(preciseValue, expectedValue);
    });
  });

  group('perfectFloorRound', () {
    test('when pass negative precision then return the same value', () {
      final double value = faker.datatype.float();

      final preciseValue =
          value.perfectFloorRound(-faker.datatype.number(min: 1));

      expect(value, preciseValue);
    });
    test('when pass 0 precision then return value with 0 precision', () {
      final double value = faker.datatype.float();

      final preciseValue = value.perfectFloorRound(0);
      final expectedValue = value.truncateToDouble();

      expect(expectedValue, preciseValue);
    });

    group('perfectCeilRound', () {
      test('when pass negative precision then return the same value', () {
        final double value = faker.datatype.float();

        final preciseValue =
            value.perfectCeilRound(-faker.datatype.number(min: 1));

        expect(value, preciseValue);
      });
      test('when pass 0 precision then return value with 0 precision', () {
        final double value = faker.datatype.float();

        final preciseValue = value.perfectCeilRound(0);
        final expectedValue = value.ceilToDouble();

        expect(expectedValue, preciseValue);
      });
    });
  });
}
