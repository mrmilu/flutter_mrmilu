/// Need create a instance to use validators, because this validators
/// use a local variables and private methods
class DocumentValidators {
  final String _nifControl = 'TRWAGMYFPDXBNJZSQVHLCKE';

  /// Validate NIF (Número de Identificación Fiscal)
  ///
  /// References: http://www.interior.gob.es/web/servicios-al-ciudadano/dni/calculo-del-digito-de-control-del-nif-nie
  bool nif(String value) {
    const String dniRegex = '^\\d{8}[A-Z]{1}\$';
    final nif = value.toUpperCase();

    if (RegExp(dniRegex).hasMatch(nif)) {
      final number = int.parse(nif.substring(0, 8));
      return _checkControl(number, nif.substring(8, 9));
    }
    return false;
  }

  /// Validate NIE (Número de Identidad de Extranjero)
  ///
  /// References: http://www.interior.gob.es/web/servicios-al-ciudadano/dni/calculo-del-digito-de-control-del-nif-nie
  bool nie(String value) {
    const String nieRegex = '^[XYZ]{1}[0-9]{7}[A-Z]{1}\$';
    final nie = value.toUpperCase();

    if (RegExp(nieRegex).hasMatch(nie)) {
      final list = ['X', 'Y', 'Z'];
      final numberNie = nie.replaceFirstMapped(
        RegExp('^[XYZ]'),
        (m) => list.indexOf(m[0] ?? '').toString(),
      );
      final number = int.parse(numberNie.substring(0, 8));
      return _checkControl(number, numberNie.substring(8, 9));
    }
    return false;
  }

  /// Validate CIF (Código de Identificación Fiscal)
  ///
  /// References: https://www.mapa.gob.es/app/materialvegetal/docs/CIF.pdf
  bool cif(String value) {
    const String cifControl = 'JABCDEFGHI';
    const String cifRegex = '^([ABCDEFGHJKLMNPQRSUVW])(\\d{7})([0-9A-J])\$';
    final cif = value.toUpperCase();

    if (!RegExp(cifRegex).hasMatch(cif)) {
      return false;
    }
    final String letter = value.substring(0, 1);
    final String number = value.substring(1, 8);
    final String control = value.substring(8);

    final controlDigit = _getDigitCif(number);
    final controlLetter = cifControl.substring(controlDigit, controlDigit + 1);

    if (RegExp('^[ABEH]').hasMatch(letter)) {
      return control == controlDigit.toString();
    } else if (RegExp('^[KPQS]').hasMatch(letter)) {
      return control == controlLetter;
    } else {
      return control == controlDigit.toString() || control == controlLetter;
    }
  }

  int _getDigitCif(String number) {
    int sum = 0;
    for (int i = 0; i < number.length; i++) {
      int n = int.parse(number[i]);
      if (i % 2 == 0) {
        // Sum odd numbers
        n *= 2;
        if (n >= 10) {
          // When has 2 digits, sum one with other (ten + unit)
          n = ((n ~/ 10) + (n % 10)).floor();
        }

        sum += n;
      } else {
        // Sum even numbers
        sum += n;
      }
    }
    // Get last sum number (decimal)
    sum %= 10;
    return sum != 0 ? 10 - sum : sum;
  }

  bool _checkControl(int number, String letter) {
    final int remainder = number % 23;
    final validLetter = _nifControl.substring(remainder, remainder + 1);

    return letter == validLetter;
  }
}
