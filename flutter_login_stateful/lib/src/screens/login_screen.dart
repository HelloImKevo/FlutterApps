import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:logger/logger.dart';
import 'package:flutter_login_stateful/src/dimensions.dart';
import 'package:flutter_login_stateful/src/styles/constants.dart';
import 'package:flutter_login_stateful/src/utils/text_styles.dart';

final logger = Logger();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppDimensions.marginMedium(context),
      // Wrap the Form widget with a ScrollView to avoid the
      // 'overflowing RenderFlex' error when resizing the app window.
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              emailField(context),
              passwordField(context),
              Container(margin: AppDimensions.marginMedium(context)),
              submitButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget emailField(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (String? value) {
        if (value == null || value.isEmpty || !value.contains('@')) {
          logger.i('emailField: Input email address is not valid');
          // TODO: Localize this message.
          return 'Please enter your email address.';
        }
        return null;
      },
      onSaved: (String? value) {
        email = value;
      },
      style: TextStyle(
        fontSize: getScaledFontSize(context, FontSizes.baseFontSize),
      ),
      decoration: InputDecoration(
        labelText: AppLocalizations.of(context)!.emailAddress,
        hintText: 'you@example.com',
      ),
    );
  }

  Widget passwordField(BuildContext context) {
    return TextFormField(
      obscureText: true,
      autocorrect: false, // Disable auto-correct suggestions
      enableSuggestions: false, // Disable suggestions
      validator: (String? value) {
        if (value == null || value.length < 6) {
          logger.i('passwordField: Input must be at least 6 characters');
          // TODO: Localize this message.
          return 'Password must be at least 6 characters.';
        }
        return null;
      },
      onSaved: (String? value) {
        password = value;
      },
      style: TextStyle(
        fontSize: getScaledFontSize(context, FontSizes.baseFontSize),
      ),
      decoration: InputDecoration(
        labelText: AppLocalizations.of(context)!.password,
        hintText: '********',
      ),
    );
  }

  Widget submitButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (!formKey.currentState!.validate()) {
          // The Form natively shows the validation error text for each field,
          // so we don't need to show a SnackBar here.
          return;
        }

        logger.d('✅ submitButton: Form is valid');
        formKey.currentState!.save();

        logger.d('🚀 Time to POST $email and $password to the API');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      child: Text(AppLocalizations.of(context)!.submit),
    );
  }

  void showSnackBar(String message) {
    logger.w(message);

    // Check if the widget is still mounted before attempting to show a SnackBar.
    // This is necessary because the fetchImage function is asynchronous and the
    // widget might have been disposed of before the function completes.
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
