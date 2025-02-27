import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_login_stateful/src/app.dart';

void main() {
  testWidgets('Placeholder test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const App());
  });
}
