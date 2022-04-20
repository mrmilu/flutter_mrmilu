class SocialSecurityNumberValidators {
  /// Validate social security number (Spain)
  ///
  /// References: https://intervia.com/doc/validar-numeros-de-la-seguridad-social/
  static bool spanishSSN(String number) {
    const String ssnRegex = '^\\d{12}\$';
    if (RegExp(ssnRegex).hasMatch(number)) {
      final provinceNumber = int.tryParse(number.substring(0, 2));
      if ((provinceNumber ?? 0) < 1) {
        //// Not valid province code
        return false;
      }
      final affiliationNumber = int.tryParse(number.substring(2, 10));
      final controlDigit = int.tryParse(number.substring(10));

      if (affiliationNumber != null && controlDigit != null) {
        const int tenMillions = 10000000;
        int result = 0;
        if (affiliationNumber < tenMillions) {
          result = affiliationNumber + provinceNumber! * tenMillions;
        } else {
          // Concatenate numbers
          result = int.parse(
            provinceNumber.toString() + affiliationNumber.toString(),
          );
        }
        final validationNumber = result % 97;
        return validationNumber == controlDigit;
      }
    }
    return false;
  }
}
