// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_simple_pics/main.dart';
import 'package:flutter_simple_pics/src/app.dart';

void main() {
  var app = const SimplePicsApp();

  testWidgets('MaterialApp is created', (WidgetTester tester) async {
    await tester.pumpWidget(app);

    expect(find.byType(MaterialApp), findsOneWidget);
  });

  testWidgets('HomeScreen is present', (WidgetTester tester) async {
    await tester.pumpWidget(app);

    expect(find.byType(HomeScreen), findsOneWidget);
  });

  testWidgets('Localization delegates are set', (WidgetTester tester) async {
    await tester.pumpWidget(app);

    final MaterialApp materialApp = tester.widget(find.byType(MaterialApp));
    expect(materialApp.localizationsDelegates,
        AppLocalizations.localizationsDelegates);
    expect(materialApp.supportedLocales, AppLocalizations.supportedLocales);
  });
}
