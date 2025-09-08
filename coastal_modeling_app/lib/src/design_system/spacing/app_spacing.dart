import 'package:flutter/material.dart';

/// Defines consistent spacing values for the Coastal Modeling Application
/// 
/// This class provides a systematic approach to spacing that ensures consistent
/// layouts and visual hierarchy throughout the application.
class AppSpacing {
  AppSpacing._(); // Private constructor to prevent instantiation

  // Base spacing unit (8dp Material Design guideline)
  static const double _baseUnit = 8.0;

  // Spacing Constants
  static const double xs = _baseUnit * 0.5; // 4.0
  static const double sm = _baseUnit * 1.0; // 8.0
  static const double md = _baseUnit * 2.0; // 16.0
  static const double lg = _baseUnit * 3.0; // 24.0
  static const double xl = _baseUnit * 4.0; // 32.0
  static const double xxl = _baseUnit * 5.0; // 40.0
  static const double xxxl = _baseUnit * 6.0; // 48.0

  // Semantic Spacing
  static const double elementSpacing = sm; // Space between related elements
  static const double sectionSpacing = lg; // Space between sections
  static const double componentSpacing = md; // Space between components
  static const double contentSpacing = md; // General content spacing

  // Screen Edge Margins
  static const double screenMarginMobile = md; // 16.0
  static const double screenMarginTablet = lg; // 24.0
  static const double screenMarginDesktop = xl; // 32.0

  // Card and Container Padding
  static const double cardPadding = md; // 16.0
  static const double cardPaddingLarge = lg; // 24.0
  static const double containerPadding = md; // 16.0

  // Button Spacing
  static const double buttonPaddingHorizontal = lg; // 24.0
  static const double buttonPaddingVertical = md; // 16.0
  static const double buttonSpacing = md; // Space between buttons

  // Form Spacing
  static const double formFieldSpacing = md; // 16.0
  static const double formSectionSpacing = xl; // 32.0
  static const double formFieldPadding = md; // 16.0

  // List and Grid Spacing
  static const double listItemSpacing = sm; // 8.0
  static const double gridItemSpacing = md; // 16.0

  // Icon Spacing
  static const double iconSpacing = sm; // 8.0
  static const double iconPadding = xs; // 4.0

  // Chart and Visualization Spacing
  static const double chartPadding = md; // 16.0
  static const double chartMargin = lg; // 24.0
  static const double legendSpacing = sm; // 8.0

  // Responsive EdgeInsets
  static EdgeInsets screenEdgeInsets(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 600) {
      return const EdgeInsets.all(screenMarginMobile);
    } else if (screenWidth < 1200) {
      return const EdgeInsets.all(screenMarginTablet);
    } else {
      return const EdgeInsets.all(screenMarginDesktop);
    }
  }

  // Common EdgeInsets
  static const EdgeInsets zero = EdgeInsets.zero;
  
  static const EdgeInsets all4 = EdgeInsets.all(xs);
  static const EdgeInsets all8 = EdgeInsets.all(sm);
  static const EdgeInsets all16 = EdgeInsets.all(md);
  static const EdgeInsets all24 = EdgeInsets.all(lg);
  static const EdgeInsets all32 = EdgeInsets.all(xl);

  static const EdgeInsets horizontal4 = EdgeInsets.symmetric(horizontal: xs);
  static const EdgeInsets horizontal8 = EdgeInsets.symmetric(horizontal: sm);
  static const EdgeInsets horizontal16 = EdgeInsets.symmetric(horizontal: md);
  static const EdgeInsets horizontal24 = EdgeInsets.symmetric(horizontal: lg);
  static const EdgeInsets horizontal32 = EdgeInsets.symmetric(horizontal: xl);

  static const EdgeInsets vertical4 = EdgeInsets.symmetric(vertical: xs);
  static const EdgeInsets vertical8 = EdgeInsets.symmetric(vertical: sm);
  static const EdgeInsets vertical16 = EdgeInsets.symmetric(vertical: md);
  static const EdgeInsets vertical24 = EdgeInsets.symmetric(vertical: lg);
  static const EdgeInsets vertical32 = EdgeInsets.symmetric(vertical: xl);

  // Content-specific EdgeInsets
  static const EdgeInsets cardPadding16 = EdgeInsets.all(md);
  static const EdgeInsets cardPadding24 = EdgeInsets.all(lg);
  static const EdgeInsets contentPadding = EdgeInsets.all(md);
  static const EdgeInsets formPadding = EdgeInsets.all(md);
  
  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(
    horizontal: buttonPaddingHorizontal,
    vertical: buttonPaddingVertical,
  );

  // SizedBox Gaps for easier spacing in Columns/Rows
  static const Widget gapXs = SizedBox(width: xs, height: xs);
  static const Widget gapSm = SizedBox(width: sm, height: sm);
  static const Widget gapMd = SizedBox(width: md, height: md);
  static const Widget gapLg = SizedBox(width: lg, height: lg);
  static const Widget gapXl = SizedBox(width: xl, height: xl);
  static const Widget gapXxl = SizedBox(width: xxl, height: xxl);

  // Directional Gaps
  static const Widget gapHorizontalXs = SizedBox(width: xs);
  static const Widget gapHorizontalSm = SizedBox(width: sm);
  static const Widget gapHorizontalMd = SizedBox(width: md);
  static const Widget gapHorizontalLg = SizedBox(width: lg);
  static const Widget gapHorizontalXl = SizedBox(width: xl);

  static const Widget gapVerticalXs = SizedBox(height: xs);
  static const Widget gapVerticalSm = SizedBox(height: sm);
  static const Widget gapVerticalMd = SizedBox(height: md);
  static const Widget gapVerticalLg = SizedBox(height: lg);
  static const Widget gapVerticalXl = SizedBox(height: xl);

  // Divider Heights
  static const double dividerHeight = 1.0;
  static const double thickDividerHeight = 2.0;

  // Border Radius
  static const double radiusXs = 2.0;
  static const double radiusSm = 4.0;
  static const double radiusMd = 8.0;
  static const double radiusLg = 12.0;
  static const double radiusXl = 16.0;
  static const double radiusXxl = 24.0;

  // Common BorderRadius
  static const BorderRadius borderRadiusXs = BorderRadius.all(Radius.circular(radiusXs));
  static const BorderRadius borderRadiusSm = BorderRadius.all(Radius.circular(radiusSm));
  static const BorderRadius borderRadiusMd = BorderRadius.all(Radius.circular(radiusMd));
  static const BorderRadius borderRadiusLg = BorderRadius.all(Radius.circular(radiusLg));
  static const BorderRadius borderRadiusXl = BorderRadius.all(Radius.circular(radiusXl));
  static const BorderRadius borderRadiusXxl = BorderRadius.all(Radius.circular(radiusXxl));

  // Elevation values
  static const double elevationNone = 0.0;
  static const double elevationLow = 2.0;
  static const double elevationMedium = 4.0;
  static const double elevationHigh = 8.0;
  static const double elevationExtra = 16.0;

  /// Helper method to create custom spacing
  static double custom(double multiplier) => _baseUnit * multiplier;

  /// Helper method to create custom EdgeInsets
  static EdgeInsets customAll(double multiplier) => EdgeInsets.all(_baseUnit * multiplier);

  /// Helper method to create custom horizontal EdgeInsets
  static EdgeInsets customHorizontal(double multiplier) => 
      EdgeInsets.symmetric(horizontal: _baseUnit * multiplier);

  /// Helper method to create custom vertical EdgeInsets
  static EdgeInsets customVertical(double multiplier) => 
      EdgeInsets.symmetric(vertical: _baseUnit * multiplier);

  /// Helper method to create custom SizedBox gap
  static Widget customGap(double multiplier) => 
      SizedBox(width: _baseUnit * multiplier, height: _baseUnit * multiplier);
}
