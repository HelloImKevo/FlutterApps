import 'package:logger/logger.dart';

final logger = Logger();

mixin ValidationMixin {
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty || !value.contains('@')) {
      logger.i('emailField: Input email address is not valid');
      // TODO: Localize this message.
      return 'Please enter your email address.';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.length < 6) {
      logger.i('passwordField: Input must be at least 6 characters');
      // TODO: Localize this message.
      return 'Password must be at least 6 characters.';
    }
    return null;
  }
}
