// This is a basic Flutter widget test for the Coastal Modeling Application.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:coastal_modeling_app/main.dart';

void main() {
  testWidgets('Coastal Modeling App loads properly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const CoastalModelingApp());

    // Verify that our splash screen displays the app title.
    expect(find.text('Coastal Modeling'), findsOneWidget);
    expect(find.text('Professional Wave & Surge Analysis'), findsOneWidget);

    // Verify that the loading indicator is present
    expect(find.text('Initializing coastal models...'), findsOneWidget);
  });
}
