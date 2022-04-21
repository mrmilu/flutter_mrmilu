import 'package:intl/intl.dart';

extension StringExtension on String {
  /// Apply uppercase to first letter of sentence
  ///
  /// Input: `this is a text. are you sure? yes`
  ///
  /// Output: `This is a text. are you sure? yes`
  String toSentenceCase() {
    if (isEmpty) {
      return this;
    }
    const regExp =
        r'[a-zA-Z\d][^.!¡?¿]*|[^a-zA-Z\d]*[.!¡?¿][^a-zA-Z\d]*|[^a-zA-Z\d]+';

    return RegExp(regExp)
        .allMatches(this)
        .toList()
        .map((m) => (m.group(0) ?? '').toFirstLetterCase())
        .join();
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
