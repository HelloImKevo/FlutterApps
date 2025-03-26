import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/login_screen.dart';
import 'blocs/provider.dart';

/// The `App` class is the main entry point of the application. It extends the
/// `StatelessWidget` class, which means it does not have any mutable state.
///
/// The `App` class sets up the application's localization, theme, and the
/// initial screen to be displayed.
class App extends StatelessWidget {
  /// The constructor for the `App` class.
  ///
  /// It calls the `super` constructor with an optional key parameter.
  const App({super.key});

  /// The `build` method describes the part of the user interface represented
  /// by this widget.
  ///
  /// It returns a `Provider` widget that wraps a `MaterialApp` widget. The
  /// `Provider` widget makes the `LoginBloc` available to all descendant
  /// widgets in the widget tree.
  ///
  /// - `context`: The build context of the widget.
  /// - Returns: A `Provider` widget that wraps a `MaterialApp` widget.
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: const MaterialApp(
        // Sets the locale of the application to English.
        locale: Locale('en'),
        // Provides localization delegates for the application.
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        // Specifies the supported locales for the application.
        supportedLocales: AppLocalizations.supportedLocales,
        // Sets the title of the application.
        title: 'Log Me In!',
        // Sets the initial screen of the application to `LoginScreen`.
        home: Scaffold(
          body: LoginScreen(),
        ),
      ),
    );
  }
}
