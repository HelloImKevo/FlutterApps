import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:logger/logger.dart';
import 'package:flutter_login_stateful/src/dimensions.dart';
import 'package:flutter_login_stateful/src/blocs/bloc.dart';
import 'package:flutter_login_stateful/src/styles/constants.dart';
import 'package:flutter_login_stateful/src/utils/text_styles.dart';
import '../blocs/provider.dart';

final logger = Logger();

/// The `LoginScreen` class represents the login screen of the application.
/// It extends the `StatelessWidget` class, which means it does not have any
/// mutable state.
class LoginScreen extends StatelessWidget {
  /// The constructor for the `LoginScreen` class.
  ///
  /// It calls the `super` constructor with an optional key parameter.
  const LoginScreen({super.key});

  /// The `build` method describes the part of the user interface represented
  /// by this widget.
  ///
  /// It returns a `Scaffold` widget that contains the login form.
  ///
  /// - `context`: The build context of the widget.
  /// - Returns: A `Scaffold` widget that contains the login form.
  @override
  Widget build(BuildContext context) {
    // Acquire our Login Business Logic Component.
    final bloc = Provider.of(context);

    // The Scaffold widget is a fundamental part of the Material Design layout
    // structure in Flutter. It provides a default structure for the visual
    // interface of your app, including the app bar, drawer, bottom navigation
    // bar, and floating action button. It also provides the ScaffoldMessenger
    // for displaying snack bars.
    return Scaffold(
      body: Container(
        margin: AppDimensions.marginMedium(context),
        // Wrap the Form widget with a ScrollView to avoid the
        // 'overflowing RenderFlex' error when resizing the app window.
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                emailField(bloc, context),
                passwordField(bloc, context),
                Container(margin: AppDimensions.marginMedium(context)),
                submitButton(bloc, context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// The `emailField` function creates a text field for entering the email
  /// address.
  ///
  /// It uses a `StreamBuilder` to listen to the email stream from the `LoginBloc`
  /// and display validation errors if any.
  ///
  /// - `bloc`: The `LoginBloc` instance that manages the email stream.
  /// - `context`: The build context of the widget.
  /// - Returns: A `TextFormField` widget for entering the email address.
  Widget emailField(LoginBloc bloc, BuildContext context) {
    return StreamBuilder<String>(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextFormField(
          keyboardType: TextInputType.emailAddress,
          onChanged: bloc.changeEmail,
          style: TextStyle(
            fontSize: getScaledFontSize(context, FontSizes.baseFontSize),
          ),
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context)!.emailAddress,
            hintText: 'you@example.com',
            errorText: snapshot.error as String?,
          ),
        );
      },
    );
  }

  /// The `passwordField` function creates a text field for entering the password.
  ///
  /// It uses a `StreamBuilder` to listen to the password stream from the `LoginBloc`
  /// and display validation errors if any.
  ///
  /// - `bloc`: The `LoginBloc` instance that manages the password stream.
  /// - `context`: The build context of the widget.
  /// - Returns: A `TextFormField` widget for entering the password.
  Widget passwordField(LoginBloc bloc, BuildContext context) {
    return StreamBuilder<String>(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextFormField(
          obscureText: true,
          autocorrect: false, // Disable auto-correct suggestions
          enableSuggestions: false, // Disable suggestions
          onChanged: bloc.changePassword,
          style: TextStyle(
            fontSize: getScaledFontSize(context, FontSizes.baseFontSize),
          ),
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context)!.password,
            hintText: '********',
            errorText: snapshot.error as String?,
          ),
        );
      },
    );
  }

  /// The `submitButton` function creates a button for submitting the login form.
  ///
  /// When the button is pressed, it logs a message and shows a snack bar
  /// indicating that the form has been submitted.
  ///
  /// - `bloc`: The `LoginBloc` instance that manages the form submission.
  /// - `context`: The build context of the widget.
  /// - Returns: An `ElevatedButton` widget for submitting the login form.
  Widget submitButton(LoginBloc bloc, BuildContext context) {
    return StreamBuilder<bool>(
      stream: bloc.submitValid,
      builder: (context, AsyncSnapshot<bool> snapshot) {
        return ElevatedButton(
          onPressed: snapshot.hasData
              ? () {
                  submit(bloc, context);
                }
              : null, // Disable the button if `snapshot.hasData` is false
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
          ),
          child: Text(AppLocalizations.of(context)!.submit),
        );
      },
    );
  }

  void submit(LoginBloc bloc, BuildContext context) {
    // Form has been validated by our BLoC streams.
    logger.d('🚀 Time to POST email and password to the API');
    showSnackBar(context, 'Form submitted');
  }

  /// The `showSnackBar` function displays a snack bar with a given message.
  ///
  /// - `context`: The build context of the widget.
  /// - `message`: The message to be displayed in the snack bar.
  void showSnackBar(BuildContext context, String message) {
    logger.w(message);

    // In a StatelessWidget, there is no 'mounted' property, because the widget
    // does not have a lifecycle like StatefulWidget. The 'mounted' property
    // is used in State objects to check if the widget is still in the tree.

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
