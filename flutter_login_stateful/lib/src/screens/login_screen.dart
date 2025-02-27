import 'package:flutter/material.dart';
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
      child: const Text('Login Screen!'),
    );
  }
}
