import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_login_stateful/src/dimensions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppDimensions.marginMedium(context),
      // Wrap the Form widget with a ScrollView to avoid the
      // 'overflowing RenderFlex' error when resizing the app window.
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              emailField(context),
              passwordField(context),
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
      decoration: InputDecoration(
        labelText: AppLocalizations.of(context)!.emailAddress,
        hintText: 'you@example.com',
      ),
    );
  }

  Widget passwordField(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: AppLocalizations.of(context)!.password,
        hintText: '********',
      ),
    );
  }

  Widget submitButton(BuildContext context) {
    return Text(AppLocalizations.of(context)!.submit);
  }
}
