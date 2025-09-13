import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:coastal_modeling_app/src/design_system/design_system.dart';
import 'package:coastal_modeling_app/src/presentation/widgets/wave_modeling/wave_parameters_form.dart';

void main() {
  group('Accessibility Tests', () {
    testWidgets('WaveParametersForm renders with semantic structure',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const Scaffold(
            body: WaveParametersForm(),
          ),
        ),
      );

      // Test that the form renders
      expect(find.byType(WaveParametersForm), findsOneWidget);

      // Test that accessible components are present
      expect(find.byType(AccessibleParameterField), findsWidgets);
      expect(find.byType(AccessibleActionButton), findsWidgets);

      // Test section header
      expect(find.text('Wave Characteristics'), findsOneWidget);
    });

    testWidgets('AccessibleParameterField has proper accessibility features',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: Scaffold(
            body: AccessibleParameterField(
              label: 'Test Field',
              unit: 'm',
              controller: TextEditingController(),
              icon: Icons.waves,
              semanticLabel: 'Test field for validation',
              helpText: 'Enter a test value',
            ),
          ),
        ),
      );

      // Verify the field renders
      expect(find.byType(AccessibleParameterField), findsOneWidget);

      // Test that the label and help text are displayed
      expect(find.textContaining('Test Field'), findsOneWidget);
      expect(find.text('Enter a test value'), findsOneWidget);
    });

    testWidgets('High contrast theme works correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(highContrast: true),
          child: MaterialApp(
            theme: AppTheme.highContrastTheme,
            home: Scaffold(
              body: AccessibleParameterField(
                label: 'High Contrast Field',
                unit: 'm',
                controller: TextEditingController(),
                icon: Icons.waves,
                isHighContrast: true,
              ),
            ),
          ),
        ),
      );

      // Test that the widget renders
      expect(find.byType(AccessibleParameterField), findsOneWidget);

      // The label text is in a RichText widget, so we need to find it within that
      expect(find.textContaining('High Contrast Field'), findsOneWidget);
    });

    test('WCAG contrast validation works correctly', () {
      // Test high contrast combinations that should pass
      expect(
        AppColors.meetsWCAGContrast(AppColors.black, AppColors.white),
        isTrue,
      );

      expect(
        AppColors.meetsWCAGContrast(
            AppColors.highContrastText, AppColors.highContrastBackground),
        isTrue,
      );

      // Test accessibility helper methods
      final textColor = AppColors.getTextColorForBackground(AppColors.white);
      expect(textColor, equals(AppColors.textPrimary));

      final iconColor =
          AppColors.getIconColorForBackground(AppColors.primaryBlue);
      expect(iconColor, isNotNull);
    });

    testWidgets('Form validation shows accessible error messages',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const Scaffold(
            body: WaveParametersForm(),
          ),
        ),
      );

      // Wait for the form to render
      await tester.pumpAndSettle();

      // Find text field by its default value and clear it
      final textFields = find.byType(TextFormField);
      expect(textFields, findsWidgets); // Ensure text fields exist

      // Clear the first text field (wave height)
      await tester.enterText(textFields.first, '');
      await tester.pumpAndSettle();

      // Find the validate button by looking for AccessibleActionButton with 'Validate Parameters'
      final validateButton =
          find.widgetWithText(AccessibleActionButton, 'Validate Parameters');
      expect(validateButton,
          findsOneWidget); // Ensure button exists before tapping

      await tester.tap(validateButton);
      await tester.pumpAndSettle();

      // Check for error dialog
      expect(find.text('Parameter Validation Errors'), findsOneWidget);
    });
  });
}
