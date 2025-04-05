import 'package:flutter/material.dart';
import 'screens/home.dart';

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
    return MaterialApp(
      // Sets the title of the application.
      title: 'Cat Animation',
      theme: ThemeData(
        // Sets the primary color of the application to a shade of purple.
        primaryColor: const Color(0xFF6200EE),
      ),
      // Sets the initial screen of the application to `LoginScreen`.
      home: const Scaffold(
        body: Home(),
      ),
    );
  }
}
