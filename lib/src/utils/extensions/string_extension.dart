import 'package:intl/intl.dart';

extension StringExtension on String {
  /// Apply uppercase to first letter of sentence
  ///
  /// Input: `this is a text. are you sure? yes`
  ///
  /// Output: `This is a text. are you sure? yes`
  ///
  /// References:
  /// - https://stackoverflow.com/a/56085219/8700272
  /// - https://stackoverflow.com/questions/25735644/python-regex-for-splitting-text-into-sentences-sentence-tokenizing
  String toSentenceCase() {
    if (isEmpty) {
      return this;
    }
    final sentences =
        split(RegExp(r'(?<!\w\.\w.)(?<![A-Z][a-z]\.)(?<=\.|\?|\!)\s'));

    return sentences.length == 1
        ? sentences.first.toFirstLetterCase()
        : sentences.reduce((value, element) {
            final valueText =
                value == sentences.first ? value.toFirstLetterCase() : value;
            final elementText = element.toFirstLetterCase();
            return valueText + ' ' + elementText;
          });
  }

  /// Apply uppercase to first letter of each word
  ///
  /// Input: `this is a text. are you sure? yes`
  ///
  /// Output: `This is a text. Are you sure? Yes`
  String toFirstLetterCase() {
    final lowerCaseText = toLowerCase();
    return contains('¿') || contains('¡')
        ? lowerCaseText[0] +
            (toBeginningOfSentenceCase(lowerCaseText.substring(1)) ??
                lowerCaseText)
        : toBeginningOfSentenceCase(lowerCaseText) ?? lowerCaseText;
  }

  /// Join list of [texts] to this string with separator
  ///
  /// By default separator is [' '] (blank space)
  String concatenate(List<String> texts, {String separator = ' '}) {
    if (texts.isEmpty || !texts.any((text) => text.isNotEmpty)) {
      return this;
    }
    return '${this}$separator${texts.join(separator)}';
  }
}
