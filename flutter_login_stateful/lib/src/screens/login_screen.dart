import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:logger/logger.dart';
import 'package:flutter_login_stateful/src/dimensions.dart';
import 'package:flutter_login_stateful/src/blocs/bloc.dart';
import 'package:flutter_login_stateful/src/styles/constants.dart';
import 'package:flutter_login_stateful/src/utils/text_styles.dart';

final logger = Logger();

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Declare our Login Business Logic Component.
    final bloc = LoginBloc();

    // The Scaffold widget is a fundamental part of the Material Design layout
    // structure in Flutter. It provides a default structure for the visual
    //interface of your app, including the app bar, drawer, bottom navigation
    //bar, and floating action button. It also provides the ScaffoldMessenger
    //for displaying snack bars.
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

  Widget submitButton(LoginBloc bloc, BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Form has been validated by our BLoC streams.
        logger.d('🚀 Time to POST email and password to the API');
        showSnackBar(context, 'Form submitted');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      child: Text(AppLocalizations.of(context)!.submit),
    );
  }

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
