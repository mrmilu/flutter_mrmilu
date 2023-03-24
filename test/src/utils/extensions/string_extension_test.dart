import 'package:faker_dart/faker_dart.dart';
import 'package:flutter_mrmilu/flutter_mrmilu.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final faker = Faker.instance;

  group('concatenate -', () {
    test('will be return string when texts is empty or with empty strings', () {
      final string = faker.lorem.word();

      final result = string.concatenate([]);

      expect(result, string);

      final result2 = string.concatenate(['', '', '']);

      expect(result2, string);
    });
    test('will be return concatenate string when has texts', () {
      final string = faker.lorem.word();
      final text1 = faker.lorem.word();

      final result = string.concatenate([text1]);

      expect(result, '$string $text1');

      final text2 = faker.lorem.word();

      final result2 = string.concatenate([text1, text2]);

      expect(result2, '$string $text1 $text2');
    });
    test(
        'will be return concatenate string with custom separator when has texts and pass separator',
        () {
      final string = faker.lorem.word();
      final text1 = faker.lorem.word();

      final result = string.concatenate([text1], separator: '*');

      expect(result, '$string*$text1');

      final text2 = faker.lorem.word();

      final result2 = string.concatenate([text1, text2], separator: '-');

      expect(result2, '$string-$text1-$text2');
    });
  });
  group('toSentenceCase -', () {
    test('return empty if string is empty', () {
      const text = '';
      expect(text.toSentenceCase(), '');
    });
    test('convert a single word', () {
      final lowercaseText = faker.lorem.word();
      final text = 't$lowercaseText';
      expect(text.toSentenceCase(), 'T$lowercaseText');

      final upperCaseText = faker.lorem.word();
      final secondText = 'a$upperCaseText';
      expect(secondText.toSentenceCase(), 'A${upperCaseText.toLowerCase()}');
    });
    test('convert a many words', () {
      final lowercaseText = faker.lorem
          .sentence(wordCount: faker.datatype.number(min: 2, max: 20))
          .toLowerCase();
      final text = 't$lowercaseText';

      expect(text.toSentenceCase(), 'T$lowercaseText');

      final upperCaseText = faker.lorem
          .sentence(wordCount: faker.datatype.number(min: 2, max: 20))
          .toUpperCase();
      final secondText = 't$upperCaseText';

      expect(secondText.toSentenceCase(), 'T${upperCaseText.toLowerCase()}');
    });
    group('dot mark', () {
      test('convert two sentences with single word each', () {
        final sentenceText = faker.lorem.sentence(wordCount: 1).toLowerCase();
        final text = 't$sentenceText a$sentenceText';

        expect(text.toSentenceCase(), 'T$sentenceText A$sentenceText');
      });
      test('convert two sentences with many words each', () {
        final sentenceText = faker.lorem
            .sentence(wordCount: faker.datatype.number(min: 2, max: 20))
            .toLowerCase();
        final text = 't$sentenceText a$sentenceText';

        expect(text.toSentenceCase(), 'T$sentenceText A$sentenceText');
      });
      test('convert many sentences with many words each', () {
        final sentenceText = faker.lorem
            .sentence(wordCount: faker.datatype.number(min: 2, max: 20))
            .toLowerCase();
        final text =
            't$sentenceText z$sentenceText a$sentenceText u$sentenceText';

        expect(
          text.toSentenceCase(),
          'T$sentenceText Z$sentenceText A$sentenceText U$sentenceText',
        );
      });
    });
    group('exclamation marks (¡!)', () {
      test('convert sentente with start exclamation (¡)', () {
        final sentenceText = faker.lorem
            .sentence(wordCount: faker.datatype.number(min: 2, max: 20))
            .toLowerCase();
        final text = 't$sentenceText ¡z$sentenceText';
        expect(text.toSentenceCase(), 'T$sentenceText ¡Z$sentenceText');
      });
      test('convert sentente with many exclamations (two types ¡!)', () {
        final sentenceText = faker.lorem
            .sentence(wordCount: faker.datatype.number(min: 2, max: 20))
            .toLowerCase()
            .replaceFirst('.', '!');
        final text = '¡t$sentenceText ¡z$sentenceText ¡a$sentenceText';
        expect(
          text.toSentenceCase(),
          '¡T$sentenceText ¡Z$sentenceText ¡A$sentenceText',
        );
      });
      test('convert sentente with many exclamations (one types !)', () {
        final sentenceText = faker.lorem
            .sentence(wordCount: faker.datatype.number(min: 2, max: 20))
            .toLowerCase()
            .replaceFirst('.', '!');
        final text = 't$sentenceText z$sentenceText a$sentenceText';
        expect(
          text.toSentenceCase(),
          'T$sentenceText Z$sentenceText A$sentenceText',
        );
      });
    });
    group('interrogation marks (¿?)', () {
      test('convert sentente with start interrogation (¿)', () {
        final sentenceText = faker.lorem
            .sentence(wordCount: faker.datatype.number(min: 2, max: 20))
            .toLowerCase();
        final text = 't$sentenceText ¿z$sentenceText';
        expect(text.toSentenceCase(), 'T$sentenceText ¿Z$sentenceText');
      });
      test('convert sentente with many interrogations (two types ¿?)', () {
        final sentenceText = faker.lorem
            .sentence(wordCount: faker.datatype.number(min: 2, max: 20))
            .toLowerCase()
            .replaceFirst('.', '?');
        final text = '¿t$sentenceText ¿z$sentenceText ¿a$sentenceText';
        expect(
          text.toSentenceCase(),
          '¿T$sentenceText ¿Z$sentenceText ¿A$sentenceText',
        );
      });
      test('convert sentente with many interrogations (one types ?)', () {
        final sentenceText = faker.lorem
            .sentence(wordCount: faker.datatype.number(min: 2, max: 20))
            .toLowerCase()
            .replaceFirst('.', '?');
        final text = 't$sentenceText z$sentenceText a$sentenceText';
        expect(
          text.toSentenceCase(),
          'T$sentenceText Z$sentenceText A$sentenceText',
        );
      });
    });
  });

  group('toFirstLetterCase', () {
    test('return empty if string is empty', () {
      const text = '';
      expect(text.toSentenceCase(), '');
    });
  });

  group('toSnakeCase', () {
    test('should return empty if string is empty', () {
      const text = '';
      expect(text.toSnakeCase(), '');
    });
    test('should return snake case formatted string when get camel case', () {
      final word1 = faker.lorem.word();
      final word2 = faker.lorem.word();
      final text = '$word1 $word2 $word1 $word2'.toCamelCase(separator: ' ');
      final textSnakeCase = '${word1}_${word2}_${word1}_$word2';

      expect(text.toSnakeCase(), textSnakeCase);
    });
    test(
        'should return screaming snake case formatted string when get camel case',
        () {
      final word1 = faker.lorem.word();
      final word2 = faker.lorem.word();
      final text = '$word1 $word2 $word1 $word2'.toCamelCase(separator: ' ');
      final textSnakeCase = '${word1}_${word2}_${word1}_$word2'.toUpperCase();

      expect(text.toSnakeCase(screaming: true), textSnakeCase);
    });
    test('should return snake case formatted string when string', () {
      final word1 = faker.lorem.word();
      final word2 = faker.lorem.word();
      final text = '$word1 $word2 $word1 $word2';
      final textSnakeCase = '${word1}_${word2}_${word1}_$word2';

      expect(text.toSnakeCase(fromCamelCase: false), textSnakeCase);
    });
    test('should return screaming snake case formatted string when string', () {
      final word1 = faker.lorem.word();
      final word2 = faker.lorem.word();
      final text = '$word1 $word2 $word1 $word2';
      final textSnakeCase = '${word1}_${word2}_${word1}_$word2'.toUpperCase();

      expect(
        text.toSnakeCase(fromCamelCase: false, screaming: true),
        textSnakeCase,
      );
    });
  });
  group('toCamelCase', () {
    test('should return empty if string is empty', () {
      const text = '';
      expect(text.toCamelCase(), '');
    });

    test('should return camel case formatted string when get snake case', () {
      final wordInitial = faker.lorem.word();
      final word1 = faker.lorem.word().toFirstLetterCase();
      final word2 = faker.lorem.word().toFirstLetterCase();
      final text =
          '${wordInitial.toFirstLetterCase()}_${word2.toUpperCase()}_${word1.toLowerCase()}_$word2';
      final textCamelCase = '$wordInitial$word2$word1$word2';

      expect(text.toCamelCase(), textCamelCase);
    });

    test(
        'should return camel case formatted string when get string with different separators',
        () {
      final wordInitial = faker.lorem.word();
      final word1 = faker.lorem.word().toFirstLetterCase();
      final word2 = faker.lorem.word().toFirstLetterCase();
      const separator1 = ' ';
      const separator2 = '-';
      final text =
          '${wordInitial.toFirstLetterCase()}$separator1${word2.toUpperCase()}$separator1${word1.toLowerCase()}$separator1$word2';
      final text2 =
          '${wordInitial.toFirstLetterCase()}$separator2${word2.toUpperCase()}$separator2${word1.toLowerCase()}$separator2$word2';
      final textCamelCase = '$wordInitial$word2$word1$word2';

      expect(text.toCamelCase(separator: separator1), textCamelCase);
      expect(text2.toCamelCase(separator: separator2), textCamelCase);
    });
  });
}
