import 'package:flutter/material.dart';

/// Defines typography styles for the Coastal Modeling Application
/// 
/// This class provides a consistent typography system with proper scaling,
/// weights, and letter spacing optimized for technical data display and
/// coastal engineering content.
class AppTypography {
  AppTypography._(); // Private constructor to prevent instantiation

  // Font Family
  static const String primaryFontFamily = 'Inter';
  static const String monospaceFontFamily = 'SF Mono';

  // Font Weights
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;

  // Display Styles - Large headings for dashboard and main screens
  static const TextStyle displayLarge = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 32,
    fontWeight: bold,
    letterSpacing: -0.5,
    height: 1.2,
  );

  static const TextStyle displayMedium = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 28,
    fontWeight: bold,
    letterSpacing: -0.25,
    height: 1.25,
  );

  static const TextStyle displaySmall = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 24,
    fontWeight: semiBold,
    letterSpacing: 0,
    height: 1.3,
  );

  // Headline Styles - Section headers and page titles
  static const TextStyle headlineLarge = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 22,
    fontWeight: semiBold,
    letterSpacing: 0,
    height: 1.3,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 20,
    fontWeight: semiBold,
    letterSpacing: 0.15,
    height: 1.35,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 18,
    fontWeight: medium,
    letterSpacing: 0.15,
    height: 1.4,
  );

  // Title Styles - Card headers and dialog titles
  static const TextStyle titleLarge = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 16,
    fontWeight: semiBold,
    letterSpacing: 0.15,
    height: 1.4,
  );

  static const TextStyle titleMedium = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 14,
    fontWeight: medium,
    letterSpacing: 0.1,
    height: 1.45,
  );

  static const TextStyle titleSmall = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 12,
    fontWeight: medium,
    letterSpacing: 0.1,
    height: 1.45,
  );

  // Body Styles - Main content text
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 16,
    fontWeight: regular,
    letterSpacing: 0.5,
    height: 1.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 14,
    fontWeight: regular,
    letterSpacing: 0.25,
    height: 1.5,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 12,
    fontWeight: regular,
    letterSpacing: 0.4,
    height: 1.5,
  );

  // Label Styles - Buttons, form labels, captions
  static const TextStyle labelLarge = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 14,
    fontWeight: medium,
    letterSpacing: 0.1,
    height: 1.4,
  );

  static const TextStyle labelMedium = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 12,
    fontWeight: medium,
    letterSpacing: 0.5,
    height: 1.35,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 10,
    fontWeight: medium,
    letterSpacing: 0.5,
    height: 1.3,
  );

  // Data Styles - Numerical data, coordinates, measurements
  static const TextStyle dataLarge = TextStyle(
    fontFamily: monospaceFontFamily,
    fontSize: 16,
    fontWeight: medium,
    letterSpacing: 0,
    height: 1.4,
  );

  static const TextStyle dataMedium = TextStyle(
    fontFamily: monospaceFontFamily,
    fontSize: 14,
    fontWeight: regular,
    letterSpacing: 0,
    height: 1.4,
  );

  static const TextStyle dataSmall = TextStyle(
    fontFamily: monospaceFontFamily,
    fontSize: 12,
    fontWeight: regular,
    letterSpacing: 0,
    height: 1.3,
  );

  // Code Styles - For displaying code snippets or formulas
  static const TextStyle codeBlock = TextStyle(
    fontFamily: monospaceFontFamily,
    fontSize: 13,
    fontWeight: regular,
    letterSpacing: 0,
    height: 1.5,
  );

  static const TextStyle codeInline = TextStyle(
    fontFamily: monospaceFontFamily,
    fontSize: 13,
    fontWeight: regular,
    letterSpacing: 0,
    height: 1.2,
  );

  // Button Styles
  static const TextStyle buttonLarge = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 16,
    fontWeight: semiBold,
    letterSpacing: 0.5,
    height: 1.25,
  );

  static const TextStyle buttonMedium = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 14,
    fontWeight: semiBold,
    letterSpacing: 0.25,
    height: 1.25,
  );

  static const TextStyle buttonSmall = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 12,
    fontWeight: semiBold,
    letterSpacing: 0.25,
    height: 1.2,
  );

  // Navigation Styles
  static const TextStyle navigationTab = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 14,
    fontWeight: medium,
    letterSpacing: 0.1,
    height: 1.3,
  );

  static const TextStyle navigationDrawer = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 16,
    fontWeight: regular,
    letterSpacing: 0.15,
    height: 1.4,
  );

  // Tooltip and Helper Text
  static const TextStyle tooltip = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 12,
    fontWeight: regular,
    letterSpacing: 0.4,
    height: 1.3,
  );

  static const TextStyle helperText = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 12,
    fontWeight: regular,
    letterSpacing: 0.4,
    height: 1.3,
  );

  // Error Text
  static const TextStyle errorText = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 12,
    fontWeight: regular,
    letterSpacing: 0.4,
    height: 1.3,
  );

  /// Creates a custom TextStyle with specified parameters
  static TextStyle custom({
    String? fontFamily,
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    double? height,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: fontFamily ?? primaryFontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterSpacing,
      height: height,
      decoration: decoration,
    );
  }
}

/// Extension to easily apply colors to TextStyle
extension TextStyleColorExtension on TextStyle {
  TextStyle withColor(Color color) => copyWith(color: color);
  TextStyle withSize(double fontSize) => copyWith(fontSize: fontSize);
  TextStyle withWeight(FontWeight fontWeight) => copyWith(fontWeight: fontWeight);
}
