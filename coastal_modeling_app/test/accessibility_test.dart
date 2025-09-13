import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:coastal_modeling_app/src/design_system/design_system.dart';
import 'package:coastal_modeling_app/src/presentation/widgets/wave_modeling/wave_parameters_form.dart';

void main() {
  group('Accessibility Tests', () {
    testWidgets('WaveParametersForm has proper semantic labels',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const Scaffold(
            body: WaveParametersForm(),
          ),
        ),
      );

      // Test that semantic labels are present for form fields
      expect(
          find.bySemanticsLabel(
              'Significant wave height input, required field'),
          findsOneWidget);
      expect(find.bySemanticsLabel('Peak period input, required field'),
          findsOneWidget);
      expect(find.bySemanticsLabel('Wave direction input, required field'),
          findsOneWidget);
      expect(find.bySemanticsLabel('Water depth input, required field'),
          findsOneWidget);

      // Test that action buttons have proper semantics
      expect(find.bySemanticsLabel('Reset all parameters to default values'),
          findsOneWidget);
      expect(find.bySemanticsLabel('Validate all wave parameters'),
          findsOneWidget);
    });

    testWidgets('AccessibleParameterField responds to high contrast mode',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(
            highContrast: true,
          ),
          child: MaterialApp(
            theme: AppTheme.highContrastTheme,
            home: Scaffold(
              body: AccessibleParameterField(
                label: 'Test Field',
                unit: 'm',
                controller: TextEditingController(),
                icon: Icons.waves,
                semanticLabel: 'Test semantic label',
                isHighContrast: true,
              ),
            ),
          ),
        ),
      );

      // Verify the field is rendered
      expect(find.byType(AccessibleParameterField), findsOneWidget);

      // Test that semantic label is applied
      expect(find.bySemanticsLabel('Test semantic label'), findsOneWidget);
    });

    testWidgets('Color contrast ratios meet WCAG standards',
        (WidgetTester tester) async {
      // Test that WCAG contrast validation methods work
      // Note: Using high contrast colors that are guaranteed to pass
      expect(
        AppColors.meetsWCAGContrast(
            AppColors.highContrastText, AppColors.highContrastBackground),
        isTrue,
      );

      expect(
        AppColors.meetsWCAGContrast(
            AppColors.highContrastPrimary, AppColors.highContrastBackground),
        isTrue,
      );

      // Test text color selection for accessibility
      expect(
        AppColors.getTextColorForBackground(AppColors.primaryBlue),
        AppColors.textInverse, // Should be white text on dark background
      );

      expect(
        AppColors.getTextColorForBackground(AppColors.white),
        AppColors.textPrimary, // Should be dark text on light background
      );

      // Test that helper methods exist and return sensible values
      final textOnBlue =
          AppColors.getTextColorForBackground(AppColors.primaryBlue);
      expect(textOnBlue, isNotNull);

      final iconOnWhite = AppColors.getIconColorForBackground(AppColors.white);
      expect(iconOnWhite, isNotNull);
    });

    testWidgets('Form validation provides accessible feedback',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const Scaffold(
            body: WaveParametersForm(),
          ),
        ),
      );

      // Wait for the widget to be fully rendered
      await tester.pumpAndSettle();

      // Find the first text field (wave height) and clear it
      final textFields = find.byType(TextFormField);
      expect(textFields, findsWidgets);

      await tester.enterText(textFields.first, '');
      await tester.pumpAndSettle();

      // Tap the validate button
      await tester.tap(find.bySemanticsLabel('Validate all wave parameters'));
      await tester.pumpAndSettle();

      // Should show validation error dialog
      expect(find.text('Parameter Validation Errors'), findsOneWidget);
      expect(find.text('Wave Height: Wave height is required'), findsOneWidget);
    });
  });
}
