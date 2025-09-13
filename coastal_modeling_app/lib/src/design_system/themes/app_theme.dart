import 'package:flutter/material.dart';
import '../colors/app_colors.dart';
import '../typography/app_typography.dart';
import '../spacing/app_spacing.dart';

/// Defines the application theme for the Coastal Modeling Application
///
/// This class provides comprehensive theming including light and dark themes,
/// component themes, and specialized themes for data visualization components.
class AppTheme {
  AppTheme._(); // Private constructor to prevent instantiation

  /// Light theme configuration
  static ThemeData get lightTheme {
    return ThemeData(
      // Base theme properties
      useMaterial3: true,
      brightness: Brightness.light,

      // Color scheme
      colorScheme: const ColorScheme.light(
        primary: AppColors.primaryBlue,
        onPrimary: AppColors.white,
        primaryContainer: AppColors.primaryBlueLight,
        onPrimaryContainer: AppColors.white,
        secondary: AppColors.secondaryTeal,
        onSecondary: AppColors.white,
        secondaryContainer: AppColors.secondaryTealLight,
        onSecondaryContainer: AppColors.charcoal,
        tertiary: AppColors.accentCyan,
        onTertiary: AppColors.charcoal,
        surface: AppColors.white,
        onSurface: AppColors.black, // Black text on white surfaces
        background: AppColors.backgroundPrimary,
        onBackground: AppColors.black, // Black text on backgrounds
        error: AppColors.error,
        onError: AppColors.white,
        outline: AppColors.borderMedium,
        shadow: AppColors.charcoal,
      ),

      // Scaffold theme
      scaffoldBackgroundColor: AppColors.backgroundPrimary,

      // AppBar theme
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primaryBlue,
        foregroundColor: AppColors.white,
        elevation: AppSpacing.elevationLow,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontFamily: AppTypography.primaryFontFamily,
          fontSize: 20,
          fontWeight: AppTypography.semiBold,
          color: AppColors.white,
        ),
        iconTheme: const IconThemeData(
          color: AppColors.white,
          size: 24,
        ),
      ),

      // Card theme
      cardTheme: CardThemeData(
        color: AppColors.white, // Ensure white background for accessibility
        elevation: AppSpacing.elevationLow,
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusMd,
        ),
        margin: AppSpacing.all8,
      ),

      // Button themes
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryBlue,
          foregroundColor: AppColors.white,
          elevation: AppSpacing.elevationLow,
          padding: AppSpacing.buttonPadding,
          shape: RoundedRectangleBorder(
            borderRadius: AppSpacing.borderRadiusMd,
          ),
          textStyle: AppTypography.buttonMedium,
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primaryBlue,
          side: const BorderSide(color: AppColors.primaryBlue, width: 1.5),
          padding: AppSpacing.buttonPadding,
          shape: RoundedRectangleBorder(
            borderRadius: AppSpacing.borderRadiusMd,
          ),
          textStyle: AppTypography.buttonMedium,
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primaryBlue,
          padding: AppSpacing.buttonPadding,
          shape: RoundedRectangleBorder(
            borderRadius: AppSpacing.borderRadiusMd,
          ),
          textStyle: AppTypography.buttonMedium,
        ),
      ),

      // Input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.white, // White background for accessibility
        contentPadding: AppSpacing.formPadding,
        border: OutlineInputBorder(
          borderRadius: AppSpacing.borderRadiusMd,
          borderSide: const BorderSide(color: AppColors.borderMedium),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppSpacing.borderRadiusMd,
          borderSide: const BorderSide(color: AppColors.borderMedium),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppSpacing.borderRadiusMd,
          borderSide: const BorderSide(color: AppColors.primaryBlue, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppSpacing.borderRadiusMd,
          borderSide: const BorderSide(color: AppColors.error),
        ),
        labelStyle: AppTypography.labelMedium.withColor(AppColors.charcoal),
        hintStyle: AppTypography.bodyMedium.withColor(AppColors.darkGray),
        errorStyle: AppTypography.errorText.withColor(AppColors.error),
        helperStyle: AppTypography.helperText.withColor(AppColors.darkGray),
      ),

      // Icon theme
      iconTheme: const IconThemeData(
        color: AppColors.textSecondary,
        size: 24,
      ),

      // Divider theme
      dividerTheme: const DividerThemeData(
        color: AppColors.borderLight,
        thickness: AppSpacing.dividerHeight,
        space: AppSpacing.md,
      ),

      // List tile theme
      listTileTheme: ListTileThemeData(
        contentPadding: AppSpacing.contentPadding,
        titleTextStyle: AppTypography.titleMedium
            .copyWith(color: AppColors.black), // Black titles
        subtitleTextStyle: AppTypography.bodySmall
            .copyWith(color: AppColors.charcoal), // Dark gray subtitles
        iconColor: AppColors.primaryBlue, // Blue icons for better visibility
      ),

      // Chip theme
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.lightGray,
        labelStyle: AppTypography.labelSmall,
        padding: AppSpacing.all8,
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusXl,
        ),
      ),

      // Dialog theme
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.white,
        elevation: AppSpacing.elevationHigh,
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusLg,
        ),
        titleTextStyle:
            AppTypography.headlineSmall.withColor(AppColors.textPrimary),
        contentTextStyle:
            AppTypography.bodyMedium.withColor(AppColors.textSecondary),
      ),

      // Bottom navigation bar theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.primaryBlue,
        unselectedItemColor: AppColors.textTertiary,
        type: BottomNavigationBarType.fixed,
        elevation: AppSpacing.elevationMedium,
        selectedLabelStyle: AppTypography.labelSmall,
        unselectedLabelStyle: AppTypography.labelSmall,
      ),

      // Navigation rail theme
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: AppColors.white,
        selectedIconTheme: const IconThemeData(color: AppColors.primaryBlue),
        unselectedIconTheme: const IconThemeData(color: AppColors.textTertiary),
        selectedLabelTextStyle: AppTypography.labelMedium,
        unselectedLabelTextStyle: AppTypography.labelMedium,
        elevation: AppSpacing.elevationLow,
      ),

      // Tab bar theme
      tabBarTheme: TabBarThemeData(
        labelColor: AppColors.primaryBlue,
        unselectedLabelColor: AppColors.textTertiary,
        labelStyle: AppTypography.navigationTab,
        unselectedLabelStyle: AppTypography.navigationTab,
        indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(color: AppColors.primaryBlue, width: 2),
        ),
      ),

      // Switch theme
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return AppColors.primaryBlue;
          }
          return AppColors.mediumGray;
        }),
        trackColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return AppColors.primaryBlueLight;
          }
          return AppColors.lightGray;
        }),
      ),

      // Checkbox theme
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return AppColors.primaryBlue;
          }
          return AppColors.lightGray;
        }),
        checkColor: MaterialStateProperty.all(AppColors.white),
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusSm,
        ),
      ),

      // Radio theme
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return AppColors.primaryBlue;
          }
          return AppColors.mediumGray;
        }),
      ),

      // Slider theme
      sliderTheme: const SliderThemeData(
        activeTrackColor: AppColors.primaryBlue,
        inactiveTrackColor: AppColors.lightGray,
        thumbColor: AppColors.primaryBlue,
        overlayColor: AppColors.primaryBlueLight,
        valueIndicatorColor: AppColors.primaryBlue,
        valueIndicatorTextStyle: AppTypography.labelSmall,
      ),

      // Progress indicator theme
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primaryBlue,
        linearTrackColor: AppColors.lightGray,
        circularTrackColor: AppColors.lightGray,
      ),

      // Snackbar theme
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: AppColors.charcoal,
        contentTextStyle: AppTypography.bodyMedium,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusMd,
        ),
      ),

      // Tooltip theme
      tooltipTheme: const TooltipThemeData(
        decoration: BoxDecoration(
          color: AppColors.charcoal,
          borderRadius: AppSpacing.borderRadiusSm,
        ),
        textStyle: AppTypography.tooltip,
        padding: AppSpacing.all8,
      ),

      // Text theme with accessibility-focused colors
      textTheme: TextTheme(
        displayLarge:
            AppTypography.displayLarge.copyWith(color: AppColors.black),
        displayMedium:
            AppTypography.displayMedium.copyWith(color: AppColors.black),
        displaySmall:
            AppTypography.displaySmall.copyWith(color: AppColors.black),
        headlineLarge:
            AppTypography.headlineLarge.copyWith(color: AppColors.black),
        headlineMedium:
            AppTypography.headlineMedium.copyWith(color: AppColors.black),
        headlineSmall:
            AppTypography.headlineSmall.copyWith(color: AppColors.black),
        titleLarge: AppTypography.titleLarge.copyWith(color: AppColors.black),
        titleMedium: AppTypography.titleMedium.copyWith(color: AppColors.black),
        titleSmall: AppTypography.titleSmall.copyWith(color: AppColors.black),
        bodyLarge: AppTypography.bodyLarge.copyWith(color: AppColors.charcoal),
        bodyMedium:
            AppTypography.bodyMedium.copyWith(color: AppColors.charcoal),
        bodySmall: AppTypography.bodySmall.copyWith(color: AppColors.charcoal),
        labelLarge:
            AppTypography.labelLarge.copyWith(color: AppColors.charcoal),
        labelMedium:
            AppTypography.labelMedium.copyWith(color: AppColors.charcoal),
        labelSmall:
            AppTypography.labelSmall.copyWith(color: AppColors.darkGray),
      ),
    );
  }

  /// Dark theme configuration
  static ThemeData get darkTheme {
    return lightTheme.copyWith(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.backgroundDark,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primaryBlueLight,
        onPrimary: AppColors.charcoal,
        primaryContainer: AppColors.primaryBlueDark,
        onPrimaryContainer: AppColors.white,
        secondary: AppColors.secondaryTealLight,
        onSecondary: AppColors.charcoal,
        secondaryContainer: AppColors.secondaryTealDark,
        onSecondaryContainer: AppColors.white,
        tertiary: AppColors.accentCyan,
        onTertiary: AppColors.charcoal,
        surface: AppColors.charcoal,
        onSurface: AppColors.white,
        background: AppColors.backgroundDark,
        onBackground: AppColors.white,
        error: AppColors.error,
        onError: AppColors.white,
        outline: AppColors.mediumGray,
        shadow: AppColors.black,
      ),
      cardTheme: CardThemeData(
        color: AppColors.charcoal,
        elevation: AppSpacing.elevationLow,
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusMd,
        ),
        margin: AppSpacing.all8,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.charcoal,
        foregroundColor: AppColors.white,
        elevation: AppSpacing.elevationLow,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontFamily: AppTypography.primaryFontFamily,
          fontSize: 20,
          fontWeight: AppTypography.semiBold,
          color: AppColors.white,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkGray,
        contentPadding: AppSpacing.formPadding,
        border: OutlineInputBorder(
          borderRadius: AppSpacing.borderRadiusMd,
          borderSide: const BorderSide(color: AppColors.borderDark),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppSpacing.borderRadiusMd,
          borderSide: const BorderSide(color: AppColors.borderDark),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppSpacing.borderRadiusMd,
          borderSide:
              const BorderSide(color: AppColors.primaryBlueLight, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppSpacing.borderRadiusMd,
          borderSide: const BorderSide(color: AppColors.error),
        ),
        labelStyle: AppTypography.labelMedium.withColor(AppColors.mediumGray),
        hintStyle: AppTypography.bodyMedium.withColor(AppColors.mediumGray),
        errorStyle: AppTypography.errorText.withColor(AppColors.error),
        helperStyle: AppTypography.helperText.withColor(AppColors.mediumGray),
      ),
    );
  }

  /// High contrast theme for accessibility
  static ThemeData get highContrastTheme {
    return lightTheme.copyWith(
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: AppColors.highContrastPrimary,
        onPrimary: AppColors.highContrastBackground,
        secondary: AppColors.highContrastSecondary,
        onSecondary: AppColors.highContrastBackground,
        surface: AppColors.highContrastBackground,
        onSurface: AppColors.highContrastText,
        background: AppColors.highContrastBackground,
        onBackground: AppColors.highContrastText,
        error: AppColors.highContrastError,
        onError: AppColors.highContrastBackground,
      ),
      cardTheme: CardThemeData(
        color: AppColors.highContrastBackground,
        elevation: AppSpacing.elevationMedium,
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusMd,
          side: const BorderSide(color: AppColors.highContrastText, width: 2),
        ),
      ),
      textTheme: TextTheme(
        displayLarge: AppTypography.displayLarge.copyWith(
          color: AppColors.highContrastText,
          fontWeight: FontWeight.w800,
        ),
        headlineLarge: AppTypography.headlineLarge.copyWith(
          color: AppColors.highContrastText,
          fontWeight: FontWeight.w700,
        ),
        titleMedium: AppTypography.titleMedium.copyWith(
          color: AppColors.highContrastText,
          fontWeight: FontWeight.w700,
        ),
        bodyMedium: AppTypography.bodyMedium.copyWith(
          color: AppColors.highContrastText,
        ),
      ),
    );
  }

  /// Theme for data visualization components
  static ThemeData getDataVisualizationTheme(BuildContext context) {
    final baseTheme = Theme.of(context);
    final isHighContrast = MediaQuery.of(context).highContrast;

    return baseTheme.copyWith(
      // Custom theme overrides for charts and graphs
      colorScheme: baseTheme.colorScheme.copyWith(
        primary: isHighContrast
            ? AppColors.highContrastPrimary
            : AppColors.primaryBlue,
        secondary: isHighContrast
            ? AppColors.highContrastSecondary
            : AppColors.secondaryTeal,
        tertiary: isHighContrast
            ? AppColors.highContrastSecondary
            : AppColors.accentCyan,
      ),
    );
  }

  /// Gets the appropriate theme based on system accessibility settings
  static ThemeData getAdaptiveTheme(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    if (mediaQuery.highContrast) {
      return highContrastTheme;
    }

    return lightTheme;
  }
}
