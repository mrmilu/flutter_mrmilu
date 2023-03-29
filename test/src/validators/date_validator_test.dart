import 'package:faker_dart/faker_dart.dart';
import 'package:flutter_mrmilu/flutter_mrmilu.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final faker = Faker.instance;
  group('isLegalAdult -', () {
    test('will be legal if age is more than 18 years', () {
      final now = DateTime.now();
      final age = DateTime(now.year - 18);

      final result = DateValidators.isLegalAdult(age);

      expect(result, true);
    });
    test('dont will be legal if age is less than 18 years', () {
      final now = DateTime.now();
      final age = DateTime(now.year - faker.datatype.number(max: 17));

      final result = DateValidators.isLegalAdult(age);

      expect(result, false);
    });
    test('will be legal if age is more than legal age setted', () {
      final now = DateTime.now();
      final legalAge = faker.datatype.number(min: 19, max: 100);
      final age = DateTime(now.year - legalAge);

      final result = DateValidators.isLegalAdult(age, legalAdultAge: legalAge);

      expect(result, true);
    });
    test('dont will be legal if age is less than legal age setted', () {
      final now = DateTime.now();
      final legalAge = faker.datatype.number(min: 19, max: 100);
      final age = DateTime(now.year - faker.datatype.number(max: legalAge - 1));

      final result = DateValidators.isLegalAdult(age, legalAdultAge: legalAge);

      expect(result, false);
    });
  });

  group('isFuture - ', () {
    test('should be true when date is future', () {
      final future = faker.date.future(DateTime.now());

      expect(future.isAfter(DateTime.now()), isTrue);

      final fakerDateTime = faker.datatype.dateTime();
      final future2 = faker.date.future(fakerDateTime);

      expect(future2.isAfter(fakerDateTime), isTrue);
    });
    test('should be false when date is not future', () {
      final future = faker.date.past(DateTime.now());

      expect(future.isAfter(DateTime.now()), isFalse);

      final fakerDateTime = faker.datatype.dateTime();
      final future2 = faker.date.past(fakerDateTime);

      expect(future2.isAfter(fakerDateTime), isFalse);
    });
  });
}
