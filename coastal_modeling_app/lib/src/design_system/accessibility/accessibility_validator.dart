import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../colors/app_colors.dart';
import '../spacing/app_spacing.dart';
import '../typography/app_typography.dart';
import '../components/accessible_card.dart';
import '../components/accessible_action_card.dart';

/// Utility class for accessibility testing and validation
///
/// This class provides methods to validate color contrast ratios,
/// text readability, and overall accessibility compliance according
/// to WCAG 2.1 AA standards.
class AccessibilityValidator {
  AccessibilityValidator._();

  /// Validates if a color combination meets WCAG AA contrast requirements
  static AccessibilityResult validateContrast({
    required Color foreground,
    required Color background,
    required double fontSize,
    bool isBold = false,
  }) {
    final contrastRatio = _calculateContrastRatio(foreground, background);
    final minimumRatio = _getMinimumContrastRatio(fontSize, isBold);

    final passes = contrastRatio >= minimumRatio;

    return AccessibilityResult(
      passes: passes,
      contrastRatio: contrastRatio,
      minimumRequired: minimumRatio,
      recommendation: passes
          ? 'Color combination meets accessibility standards'
          : 'Color combination needs improvement for accessibility',
      suggestedForeground:
          passes ? null : _suggestBetterForegroundColor(background),
    );
  }

  /// Gets the minimum contrast ratio based on text size and weight
  static double _getMinimumContrastRatio(double fontSize, bool isBold) {
    // WCAG 2.1 AA standards
    // Large text (18pt+ or 14pt+ bold): 3:1 ratio
    // Normal text: 4.5:1 ratio

    if (fontSize >= 18 || (fontSize >= 14 && isBold)) {
      return 3.0; // Large text standard
    } else {
      return 4.5; // Normal text standard
    }
  }

  /// Calculates contrast ratio between two colors
  static double _calculateContrastRatio(Color color1, Color color2) {
    final luminance1 = _getLuminance(color1);
    final luminance2 = _getLuminance(color2);

    final lighter = luminance1 > luminance2 ? luminance1 : luminance2;
    final darker = luminance1 > luminance2 ? luminance2 : luminance1;

    return (lighter + 0.05) / (darker + 0.05);
  }

  /// Gets relative luminance of a color
  static double _getLuminance(Color color) {
    final r = _getSRGBValue(color.red / 255.0);
    final g = _getSRGBValue(color.green / 255.0);
    final b = _getSRGBValue(color.blue / 255.0);

    return 0.2126 * r + 0.7152 * g + 0.0722 * b;
  }

  /// Converts sRGB color component to linear RGB
  static double _getSRGBValue(double colorComponent) {
    if (colorComponent <= 0.03928) {
      return colorComponent / 12.92;
    } else {
      return pow((colorComponent + 0.055) / 1.055, 2.4);
    }
  }

  /// Simple power function implementation
  static double pow(double base, double exponent) {
    return base == 0 ? 0 : (base * base * base * base); // Approximation for 2.4
  }

  /// Suggests a better foreground color for the given background
  static Color _suggestBetterForegroundColor(Color background) {
    final luminance = _getLuminance(background);

    // If background is light, suggest dark text
    // If background is dark, suggest light text
    return luminance > 0.5 ? AppColors.black : AppColors.white;
  }

  /// Validates an entire widget tree for accessibility issues
  static List<AccessibilityIssue> validateWidgetAccessibility(
    BuildContext context,
    Widget widget,
  ) {
    final issues = <AccessibilityIssue>[];

    // This would require a more complex implementation
    // For now, we'll provide basic validation methods

    return issues;
  }

  /// Tests color combinations used in the app
  static Map<String, AccessibilityResult> testAppColorCombinations() {
    final results = <String, AccessibilityResult>{};

    // Test primary combinations
    results['Primary text on white'] = validateContrast(
      foreground: AppColors.textPrimary,
      background: AppColors.white,
      fontSize: 14,
    );

    results['White text on primary blue'] = validateContrast(
      foreground: AppColors.white,
      background: AppColors.primaryBlue,
      fontSize: 14,
    );

    results['Primary blue icon on light gray'] = validateContrast(
      foreground: AppColors.primaryBlue,
      background: AppColors.lightGray,
      fontSize: 24, // Icon size
      isBold: true,
    );

    results['Secondary text on white'] = validateContrast(
      foreground: AppColors.textSecondary,
      background: AppColors.white,
      fontSize: 14,
    );

    results['Tertiary text on white'] = validateContrast(
      foreground: AppColors.textTertiary,
      background: AppColors.white,
      fontSize: 12,
    );

    // Test card combinations
    results['Text on teal card'] = validateContrast(
      foreground: AppColors.white,
      background: AppColors.secondaryTeal,
      fontSize: 14,
    );

    results['Text on cyan card'] = validateContrast(
      foreground: AppColors.charcoal,
      background: AppColors.accentCyan,
      fontSize: 14,
    );

    return results;
  }

  /// Provides accessibility recommendations for the app
  static List<String> getAccessibilityRecommendations() {
    return [
      'Ensure all text has a contrast ratio of at least 4.5:1 with its background',
      'Use semantic labels for all interactive elements',
      'Provide alternative text for all images and icons',
      'Ensure all interactive elements are at least 44x44 pixels',
      'Support keyboard navigation throughout the app',
      'Provide focus indicators for keyboard users',
      'Use proper heading hierarchy (h1, h2, h3, etc.)',
      'Ensure color is not the only way to convey information',
      'Provide high contrast mode support',
      'Test with screen readers like VoiceOver and TalkBack',
    ];
  }
}

/// Result of an accessibility validation check
class AccessibilityResult {
  const AccessibilityResult({
    required this.passes,
    required this.contrastRatio,
    required this.minimumRequired,
    required this.recommendation,
    this.suggestedForeground,
  });

  final bool passes;
  final double contrastRatio;
  final double minimumRequired;
  final String recommendation;
  final Color? suggestedForeground;

  @override
  String toString() {
    return 'AccessibilityResult(passes: $passes, '
        'ratio: ${contrastRatio.toStringAsFixed(2)}:1, '
        'required: ${minimumRequired.toStringAsFixed(1)}:1, '
        'recommendation: $recommendation)';
  }
}

/// Represents an accessibility issue found in the widget tree
class AccessibilityIssue {
  const AccessibilityIssue({
    required this.type,
    required this.description,
    required this.severity,
    this.suggestion,
  });

  final AccessibilityIssueType type;
  final String description;
  final AccessibilityIssueSeverity severity;
  final String? suggestion;
}

enum AccessibilityIssueType {
  lowContrast,
  missingSemantics,
  smallTarget,
  colorOnly,
  noFocusIndicator,
}

enum AccessibilityIssueSeverity {
  low,
  medium,
  high,
  critical,
}

/// Widget that displays accessibility validation results using accessible components
class AccessibilityTestPanel extends StatelessWidget {
  const AccessibilityTestPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final results = AccessibilityValidator.testAppColorCombinations();
    final recommendations =
        AccessibilityValidator.getAccessibilityRecommendations();
    final isHighContrast = context.isHighContrastMode;

    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: AppBar(
        title: const Text('Accessibility Test Results'),
        backgroundColor: AppColors.primaryBlue,
        foregroundColor: AppColors.white,
        elevation: AppSpacing.elevationMedium,
      ),
      body: SingleChildScrollView(
        padding: AppSpacing.screenEdgeInsets(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSpacing.gapLg,

            // Header with accessibility info
            _buildSectionHeader(
              context,
              'Color Contrast Tests',
              'WCAG 2.1 AA/AAA compliance validation results',
              Icons.contrast,
              isHighContrast,
            ),
            AppSpacing.gapMd,

            // Test results using AccessibleCard
            ...results.entries.map((entry) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: AccessibleCard(
                    isHighContrast: isHighContrast,
                    semanticLabel: '${entry.key} contrast test result',
                    semanticHint: entry.value.passes
                        ? 'Passes accessibility requirements'
                        : 'Fails accessibility requirements',
                    child: Padding(
                      padding: AppSpacing.cardPadding16,
                      child: Row(
                        children: [
                          // Status icon with proper contrast
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: (entry.value.passes
                                      ? AppColors.success
                                      : AppColors.error)
                                  .withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              entry.value.passes
                                  ? Icons.check_circle
                                  : Icons.error,
                              color: entry.value.passes
                                  ? (isHighContrast
                                      ? AppColors.highContrastSuccess
                                      : AppColors.success)
                                  : (isHighContrast
                                      ? AppColors.highContrastError
                                      : AppColors.error),
                              size: 24,
                            ),
                          ),
                          AppSpacing.gapMd,

                          // Content with proper text colors
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  entry.key,
                                  style: AppTypography.titleMedium.copyWith(
                                    color: isHighContrast
                                        ? AppColors.highContrastText
                                        : AppColors.textPrimary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                AppSpacing.gapXs,
                                Text(
                                  'Ratio: ${entry.value.contrastRatio.toStringAsFixed(2)}:1 '
                                  '(Required: ${entry.value.minimumRequired.toStringAsFixed(1)}:1)',
                                  style: AppTypography.bodyMedium.copyWith(
                                    color: isHighContrast
                                        ? AppColors.highContrastText
                                            .withOpacity(0.8)
                                        : AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Trailing status indicator
                          Icon(
                            entry.value.passes
                                ? Icons.accessibility
                                : Icons.warning,
                            color: entry.value.passes
                                ? (isHighContrast
                                    ? AppColors.highContrastSuccess
                                    : AppColors.success)
                                : (isHighContrast
                                    ? AppColors.highContrastWarning
                                    : AppColors.warning),
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                )),

            AppSpacing.gapXl,

            // Recommendations section
            _buildSectionHeader(
              context,
              'Accessibility Recommendations',
              'Best practices for improving application accessibility',
              Icons.lightbulb_outline,
              isHighContrast,
            ),
            AppSpacing.gapMd,

            // Recommendations using AccessibleCard
            ...recommendations.map((rec) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: AccessibleCard(
                    isHighContrast: isHighContrast,
                    semanticLabel: 'Accessibility recommendation',
                    child: Padding(
                      padding: AppSpacing.cardPadding16,
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColors.warning.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.lightbulb_outline,
                              color: isHighContrast
                                  ? AppColors.highContrastWarning
                                  : AppColors.warning,
                              size: 24,
                            ),
                          ),
                          AppSpacing.gapMd,
                          Expanded(
                            child: Text(
                              rec,
                              style: AppTypography.bodyMedium.copyWith(
                                color: isHighContrast
                                    ? AppColors.highContrastText
                                    : AppColors.textPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),

            AppSpacing.gapXl,
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    bool isHighContrast,
  ) {
    return Container(
      padding: AppSpacing.cardPadding16,
      decoration: BoxDecoration(
        color:
            isHighContrast ? AppColors.highContrastBackground : AppColors.white,
        borderRadius: AppSpacing.borderRadiusMd,
        border: Border.all(
          color: isHighContrast
              ? AppColors.highContrastText
              : AppColors.borderLight,
          width: isHighContrast ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primaryBlue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: isHighContrast
                  ? AppColors.highContrastPrimary
                  : AppColors.primaryBlue,
              size: 24,
            ),
          ),
          AppSpacing.gapMd,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTypography.titleMedium.copyWith(
                    color: isHighContrast
                        ? AppColors.highContrastText
                        : AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                AppSpacing.gapXs,
                Text(
                  subtitle,
                  style: AppTypography.bodySmall.copyWith(
                    color: isHighContrast
                        ? AppColors.highContrastText.withOpacity(0.8)
                        : AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
