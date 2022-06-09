class PasswordValidators {
  /// Checks if [password] has a uppercase letter
  static bool hasUppercase(String password) {
    return RegExp(r'[A-ZÑ]+').hasMatch(password);
  }

  /// Checks if [password] has a lowercase letter
  static bool hasLowercase(String password) {
    return RegExp(r'[a-zñ]+').hasMatch(password);
  }

  /// Checks if [password] has a number
  static bool hasNumber(String password) {
    return RegExp(r'[0-9]+').hasMatch(password);
  }

  /// Checks if [password] has a special character
  /// Special character list:
  ///
  /// `&` `,` `:` `;` `=` `¿` `?` `@` `#` `|` `<` `>` `.`
  /// `^` `*` `(` `)` `¡` `!` `-` `$` `%` `/` `\` `]` `[`
  static bool hasSpecialCharacter(String password) {
    return RegExp(r'[&,:;=¿?@#|<>.^*()%¡!\$%-/\\\]\[]+').hasMatch(password);
  }

  /// Checks if [password] has a minimal length
  ///
  /// By default [minLength] is `8`
  static bool hasMinLength(String password, {int minLength = 8}) {
    return password.length >= minLength;
  }
}
