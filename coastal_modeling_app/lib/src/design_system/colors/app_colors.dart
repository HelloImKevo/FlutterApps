import 'package:flutter/material.dart';

/// Defines the color palette for the Coastal Modeling Application
///
/// This class provides a consistent color scheme inspired by coastal environments,
/// featuring ocean blues, sandy beiges, and natural earth tones that reflect
/// the marine and coastal engineering domain.
class AppColors {
  AppColors._(); // Private constructor to prevent instantiation

  // Primary Colors - Ocean Blues
  static const Color primaryBlue = Color(0xFF1E3A8A); // Deep ocean blue
  static const Color primaryBlueDark =
      Color(0xFF1E40AF); // Darker blue for contrast
  static const Color primaryBlueLight =
      Color(0xFF3B82F6); // Lighter blue for highlights

  // Secondary Colors - Coastal Tones
  static const Color secondaryTeal = Color(0xFF0891B2); // Tropical water teal
  static const Color secondaryTealDark = Color(0xFF0E7490); // Deep teal
  static const Color secondaryTealLight = Color(0xFF06B6D4); // Light teal

  // Accent Colors - Wave and Foam
  static const Color accentCyan = Color(0xFF22D3EE); // Wave crest cyan
  static const Color accentNavy = Color(0xFF1E293B); // Deep sea navy

  // Natural Colors - Beach and Earth
  static const Color sandBeige = Color(0xFFF5F5DC); // Beach sand
  static const Color driftwood = Color(0xFF8B7355); // Weathered wood
  static const Color seafoam = Color(0xFFE0F7FA); // Light sea foam

  // Status Colors
  static const Color success = Color(0xFF10B981); // Emerald green
  static const Color warning = Color(0xFFF59E0B); // Amber warning
  static const Color error = Color(0xFFEF4444); // Coral red
  static const Color info = Color(0xFF3B82F6); // Information blue

  // Neutral Colors - Grays and Whites
  static const Color white = Color(0xFFFFFFFF);
  static const Color offWhite = Color(0xFFFAFAFA);
  static const Color lightGray = Color(0xFFF3F4F6);
  static const Color mediumGray = Color(0xFF9CA3AF);
  static const Color darkGray = Color(0xFF374151);
  static const Color charcoal = Color(0xFF1F2937);
  static const Color black = Color(0xFF000000);

  // Background Colors
  static const Color backgroundPrimary = offWhite;
  static const Color backgroundSecondary = lightGray;
  static const Color backgroundDark = charcoal;

  // Surface Colors
  static const Color surfaceElevated = white;
  static const Color surfaceCard = white;
  static const Color surfaceOverlay = Color(0x80000000); // 50% black overlay

  // Border Colors
  static const Color borderLight = Color(0xFFE5E7EB);
  static const Color borderMedium = mediumGray;
  static const Color borderDark = darkGray;

  // Text Colors
  static const Color textPrimary = charcoal;
  static const Color textSecondary = darkGray;
  static const Color textTertiary = mediumGray;
  static const Color textInverse = white;
  static const Color textDisabled = mediumGray;

  // Card-specific text colors for accessibility compliance
  static const Color cardTextOnLight = charcoal; // High contrast on light cards
  static const Color cardTextOnDark = white; // High contrast on dark cards
  static const Color cardTextOnPrimary = white; // Text on primary colored cards
  static const Color cardTextOnSecondary =
      white; // Text on secondary colored cards

  // Icon colors for sufficient contrast
  static const Color iconOnLight = primaryBlue; // Icons on light backgrounds
  static const Color iconOnDark = white; // Icons on dark backgrounds
  static const Color iconOnPrimary =
      white; // Icons on primary colored backgrounds
  static const Color iconOnSecondary =
      white; // Icons on secondary colored backgrounds

  // Data Visualization Colors
  static const List<Color> chartColors = [
    primaryBlue,
    secondaryTeal,
    accentCyan,
    success,
    warning,
    error,
    driftwood,
    accentNavy,
  ];

  // Wave Height Visualization Gradient
  static const List<Color> waveHeightGradient = [
    Color(0xFFE3F2FD), // Very light blue (calm)
    Color(0xFF90CAF9), // Light blue (small waves)
    Color(0xFF42A5F5), // Medium blue (moderate waves)
    Color(0xFF1E88E5), // Blue (large waves)
    Color(0xFF1565C0), // Dark blue (very large waves)
    Color(0xFF0D47A1), // Very dark blue (extreme waves)
  ];

  // Bathymetry (Water Depth) Gradient
  static const List<Color> bathymetryGradient = [
    Color(0xFF8D6E63), // Brown (land/shallow)
    Color(0xFFFFE082), // Yellow (very shallow)
    Color(0xFF81C784), // Light green (shallow)
    Color(0xFF4FC3F7), // Light blue (medium depth)
    Color(0xFF29B6F6), // Blue (deep)
    Color(0xFF1976D2), // Dark blue (very deep)
    Color(0xFF0D47A1), // Navy (deepest)
  ];

  // Storm Surge Intensity Colors
  static const List<Color> stormSurgeColors = [
    Color(0xFF4CAF50), // Green (no surge)
    Color(0xFF8BC34A), // Light green (minimal)
    Color(0xFFFFEB3B), // Yellow (low)
    Color(0xFFFF9800), // Orange (moderate)
    Color(0xFFFF5722), // Red-orange (high)
    Color(0xFFF44336), // Red (severe)
    Color(0xFF9C27B0), // Purple (extreme)
  ];

  /// Creates a MaterialColor swatch from a base color
  static MaterialColor createMaterialColor(Color color) {
    final List<double> strengths = <double>[
      0.05,
      0.1,
      0.2,
      0.3,
      0.4,
      0.5,
      0.6,
      0.7,
      0.8,
      0.9
    ];
    final Map<int, Color> swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      swatch[(i + 1) * 100] = Color.fromRGBO(
        r + ((255 - r) * strengths[i]).round(),
        g + ((255 - g) * strengths[i]).round(),
        b + ((255 - b) * strengths[i]).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }

  /// Primary color swatch for Material Theme
  static final MaterialColor primarySwatch = createMaterialColor(primaryBlue);

  /// Accessibility helper methods

  /// Gets appropriate text color for the given background color
  static Color getTextColorForBackground(Color backgroundColor) {
    // Calculate luminance to determine if background is light or dark
    final luminance = backgroundColor.computeLuminance();

    // Use white text on dark backgrounds, dark text on light backgrounds
    // Threshold of 0.5 provides good contrast in most cases
    return luminance > 0.5 ? textPrimary : textInverse;
  }

  /// Gets appropriate icon color for the given background color
  static Color getIconColorForBackground(Color backgroundColor) {
    final luminance = backgroundColor.computeLuminance();
    return luminance > 0.5 ? iconOnLight : iconOnDark;
  }

  /// Validates if color combination meets WCAG AA contrast ratio (4.5:1)
  static bool meetsWCAGContrast(Color foreground, Color background) {
    final double contrastRatio =
        _calculateContrastRatio(foreground, background);
    return contrastRatio >= 4.5; // WCAG AA standard
  }

  /// Calculates contrast ratio between two colors
  static double _calculateContrastRatio(Color color1, Color color2) {
    final double luminance1 = color1.computeLuminance();
    final double luminance2 = color2.computeLuminance();

    final double lighter = luminance1 > luminance2 ? luminance1 : luminance2;
    final double darker = luminance1 > luminance2 ? luminance2 : luminance1;

    return (lighter + 0.05) / (darker + 0.05);
  }

  /// High contrast color variants for accessibility
  static const Color highContrastPrimary = Color(0xFF000080); // Navy blue
  static const Color highContrastSecondary = Color(0xFF800080); // Purple
  static const Color highContrastSuccess = Color(0xFF006400); // Dark green
  static const Color highContrastWarning = Color(0xFF8B4513); // Saddle brown
  static const Color highContrastError = Color(0xFF8B0000); // Dark red
  static const Color highContrastText = Color(0xFF000000); // Pure black
  static const Color highContrastBackground = Color(0xFFFFFFFF); // Pure white
}
