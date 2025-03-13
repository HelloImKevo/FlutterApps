import 'dart:async';
import 'package:flutter_login_stateful/src/mixins/validation_mixin.dart';

/// A BLoC (Business Logic Component) for handling the login functionality.
///
/// This class uses the [ValidationMixin] to validate email and password inputs
/// and provides streams for these inputs. It also provides methods to change
/// the email and password values.
class LoginBloc with ValidationMixin {
  final _emailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

  /// A stream that provides validated email addresses.
  ///
  /// This stream uses the [validateEmail] transformer from the [ValidationMixin]
  /// to validate the email addresses.
  Stream<String> get email => _emailController.stream.transform(validateEmail);

  /// A stream that provides validated passwords.
  ///
  /// This stream uses the [validatePassword] transformer from the [ValidationMixin]
  /// to validate the passwords.
  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);

  /// A function that adds a new email address to the email stream.
  ///
  /// This function is used to change the email value.
  Function(String) get changeEmail => _emailController.sink.add;

  /// A function that adds a new password to the password stream.
  ///
  /// This function is used to change the password value.
  Function(String) get changePassword => _passwordController.sink.add;

  /// Closes the email and password stream controllers.
  ///
  /// This method should be called when the BLoC is no longer needed to release
  /// resources.
  void dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
