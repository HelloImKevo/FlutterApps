import 'dart:async';
import 'package:logger/logger.dart';

final logger = Logger();

/// A mixin that provides validation logic for email and password fields.
///
/// This mixin includes stream transformers that validate email and password
/// inputs and log validation errors using the `Logger` package.
mixin ValidationMixin {
  /// A [StreamTransformer] that validates email addresses.
  ///
  /// This transformer checks if the input email contains an '@' character.
  /// If the email is valid, it is added to the sink. Otherwise, an error
  /// message is added to the sink.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final emailStream = StreamController<String>();
  /// emailStream.stream.transform(validateEmail).listen(
  ///   (email) => print('Valid email: $email'),
  ///   onError: (error) => print('Error: $error'),
  /// );
  /// emailStream.add('test@example.com'); // Valid email
  /// emailStream.add('invalid-email'); // Error: Enter a valid email
  /// ```
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      if (email.contains('@')) {
        sink.add(email);
      } else {
        logger.i('emailField: Input email address is not valid');
        // TODO: Localize this message.
        sink.addError('Enter a valid email');
      }
    },
  );

  /// A [StreamTransformer] that validates passwords.
  ///
  /// This transformer checks if the input password is at least 6 characters long.
  /// If the password is valid, it is added to the sink. Otherwise, an error
  /// message is added to the sink.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final passwordStream = StreamController<String>();
  /// passwordStream.stream.transform(validatePassword).listen(
  ///   (password) => print('Valid password: $password'),
  ///   onError: (error) => print('Error: $error'),
  /// );
  /// passwordStream.add('123456'); // Valid password
  /// passwordStream.add('123'); // Error: Password must be at least 6 characters
  /// ```
  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if (password.length >= 6) {
        sink.add(password);
      } else {
        logger.i('passwordField: Input must be at least 6 characters');
        // TODO: Localize this message.
        sink.addError('Password must be at least 6 characters');
      }
    },
  );
}
