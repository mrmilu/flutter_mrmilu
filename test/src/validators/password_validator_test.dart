import 'package:faker_dart/faker_dart.dart';
import 'package:flutter_mrmilu/flutter_mrmilu.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final faker = Faker.instance;

  group(
    'hasUppercase -',
    () {
      test('will be true when password has uppercase', () {
        final password = faker.datatype.string().toUpperCase();
        expect(PasswordValidators.hasUppercase(password), true);
      });
      test('will be false when password has not uppercase', () {
        final password = faker.datatype.string().toLowerCase();
        expect(PasswordValidators.hasUppercase(password), false);
      });
    },
  );

  group(
    'hasLowercase -',
    () {
      test('willl be true when password has lowecase', () {
        final password = faker.datatype.string().toLowerCase();
        expect(PasswordValidators.hasLowercase(password), true);
      });
      test('will be false when password has not lowercase', () {
        final password = faker.datatype.string().toUpperCase();
        expect(PasswordValidators.hasLowercase(password), false);
      });
    },
  );
  group(
    'hasNumber -',
    () {
      test('will be true when password has number', () {
        final password =
            faker.datatype.string() + faker.datatype.number().toString();
        final password2 =
            faker.datatype.number().toString() + faker.datatype.string();
        expect(PasswordValidators.hasNumber(password), true);
        expect(PasswordValidators.hasNumber(password2), true);
      });
      test('will be false when password has not number', () {
        expect(PasswordValidators.hasNumber(faker.datatype.string()), false);
      });
    },
  );

  group(
    'hasSpecialCharacter -',
    () {
      test('will be true when has special characters', () {
        final password = faker.internet.domainName();
        final password2 = '${faker.datatype.string()}\\';
        final password3 = '${faker.datatype.string()}\$';
        final password4 = '${faker.datatype.string()}]';
        final password5 = '${faker.datatype.string()}+';
        final password6 = '${faker.datatype.string()}?';

        expect(PasswordValidators.hasSpecialCharacter(password), true);
        expect(PasswordValidators.hasSpecialCharacter(password2), true);
        expect(PasswordValidators.hasSpecialCharacter(password3), true);
        expect(PasswordValidators.hasSpecialCharacter(password4), true);
        expect(PasswordValidators.hasSpecialCharacter(password5), true);
        expect(PasswordValidators.hasSpecialCharacter(password6), true);
      });
      test('will be false when not special characters', () {
        final password = faker.datatype.string();
        expect(PasswordValidators.hasSpecialCharacter(password), false);
      });
    },
  );

  group(
    'hasMinLength -',
    () {
      test('will be true when has min length', () {
        expect(PasswordValidators.hasMinLength(faker.datatype.string()), true);
        expect(PasswordValidators.hasMinLength(faker.datatype.string()), true);
        final passwordLength = faker.datatype.number(min: 1, max: 30);
        expect(
          PasswordValidators.hasMinLength(
              faker.datatype.string(length: passwordLength),
              minLength: passwordLength),
          true,
        );
        expect(
          PasswordValidators.hasMinLength(
              faker.datatype.string(length: passwordLength),
              minLength: passwordLength),
          true,
        );
      });
      test('will be false when not min length', () {
        final passwordLength = faker.datatype.number(min: 1, max: 7);
        expect(
          PasswordValidators.hasMinLength(
              faker.datatype.string(length: passwordLength)),
          false,
        );
        final passwordExtraLength = faker.datatype.number(min: 9, max: 30);
        expect(
          PasswordValidators.hasMinLength(
              faker.datatype.string(length: passwordExtraLength),
              minLength: passwordExtraLength + 1),
          false,
        );
      });
    },
  );
}
