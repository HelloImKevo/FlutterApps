import 'dart:async';
import 'package:flutter_login_stateful/src/mixins/validation_mixin.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';

/// A BLoC (Business Logic Component) for handling the login functionality.
///
/// This class uses the [ValidationMixin] to validate email and password inputs
/// and provides streams for these inputs. It also provides methods to change
/// the email and password values.
class LoginBloc with ValidationMixin {
  final logger = Logger();

  /// The `_emailController` and `_passwordController` are `StreamController`s
  /// configured with the `broadcast` variant. This allows multiple listeners
  /// to simultaneously subscribe to the stream, which is essential in scenarios
  /// where multiple widgets or components need to react to the same stream of
  /// data. Without `broadcast`, a `StreamController` can only have a single
  /// listener, which would limit the flexibility and reusability of the streams
  /// in a reactive UI framework like Flutter.
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

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

  /// A stream that combines the email and password streams to determine if
  /// the login form is valid.
  /// See also: https://rxmarbles.com/#combineLatest
  Stream<bool> get submitValid => Rx.combineLatest2(
        email,
        password,
        (String e, String p) => true,
      );

  /// A function that adds a new email address to the email stream.
  ///
  /// This function is used to change the email value.
  ///
  /// The `Function(String)` syntax in Dart defines a type for a function that
  /// takes a `String` argument and returns nothing (void). This is similar to:
  /// - **Kotlin**: A function type `(String) -> Unit`, which defines a function
  ///   that takes a `String` argument and returns `Unit` (void).
  /// - **Java**: A functional interface with a single abstract method that takes
  ///   a `String` argument and returns nothing, implemented using a lambda
  ///   expression.
  ///
  /// This allows the `changeEmail` function to be passed around as a variable,
  /// making the code more flexible and modular.
  ///
  /// The implementation uses Dart's shorthand syntax for defining a function
  /// that forwards its argument to another function. This is a concise way to
  /// define a function that simply calls another function with the same
  /// argument.
  Function(String) get changeEmail => _emailController.sink.add;

  /// A function that adds a new password to the password stream.
  ///
  /// This function is used to change the password value.
  ///
  /// The `Function(String)` syntax in Dart defines a type for a function that
  /// takes a `String` argument and returns nothing (void). This is similar to:
  /// - **Kotlin**: A function type `(String) -> Unit`, which defines a function
  ///   that takes a `String` argument and returns `Unit` (void).
  /// - **Java**: A functional interface with a single abstract method that takes
  ///   a `String` argument and returns nothing, implemented using a lambda
  ///   expression.
  ///
  /// This allows the `changePassword` function to be passed around as a variable,
  /// making the code more flexible and modular.
  ///
  /// The implementation uses Dart's shorthand syntax for defining a function
  /// that forwards its argument to another function. This is a concise way to
  /// define a function that simply calls another function with the same
  /// argument.
  Function(String) get changePassword => _passwordController.sink.add;

  void submit() {
    // Form has been validated by our BLoC streams.
    logger.d('🚀 Time to POST email and password to the API');
    final validEmail = _emailController.value;
    final validPassword = _passwordController.value;
    login(validEmail, validPassword);
    logger.d('Logging in...');
  }

  void login(String email, String password) async {
    logger.d('Starting login process...');

    // Simulate a long-running process with a 2-second delay.
    await Future.delayed(const Duration(seconds: 2));

    // Replace the password with asterisks of the same length.
    final maskedPassword = '*' * password.length;

    // Log the success message after the delay.
    logger.d("Logged in with email: $email and password: $maskedPassword");
  }

  /// Closes the email and password stream controllers.
  ///
  /// This method should be called when the BLoC is no longer needed to release
  /// resources.
  void dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
