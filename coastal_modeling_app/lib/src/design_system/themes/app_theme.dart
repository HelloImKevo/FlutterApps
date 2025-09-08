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
        onSurface: AppColors.textPrimary,
        background: AppColors.backgroundPrimary,
        onBackground: AppColors.textPrimary,
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
        color: AppColors.surfaceCard,
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
        fillColor: AppColors.backgroundSecondary,
        contentPadding: AppSpacing.formPadding,
        border: OutlineInputBorder(
          borderRadius: AppSpacing.borderRadiusMd,
          borderSide: const BorderSide(color: AppColors.borderLight),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppSpacing.borderRadiusMd,
          borderSide: const BorderSide(color: AppColors.borderLight),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppSpacing.borderRadiusMd,
          borderSide: const BorderSide(color: AppColors.primaryBlue, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppSpacing.borderRadiusMd,
          borderSide: const BorderSide(color: AppColors.error),
        ),
        labelStyle: AppTypography.labelMedium.withColor(AppColors.textSecondary),
        hintStyle: AppTypography.bodyMedium.withColor(AppColors.textTertiary),
        errorStyle: AppTypography.errorText.withColor(AppColors.error),
        helperStyle: AppTypography.helperText.withColor(AppColors.textTertiary),
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
        titleTextStyle: AppTypography.titleMedium,
        subtitleTextStyle: AppTypography.bodySmall,
        iconColor: AppColors.textSecondary,
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
        titleTextStyle: AppTypography.headlineSmall.withColor(AppColors.textPrimary),
        contentTextStyle: AppTypography.bodyMedium.withColor(AppColors.textSecondary),
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

      // Text theme
      textTheme: TextTheme(
        displayLarge: AppTypography.displayLarge,
        displayMedium: AppTypography.displayMedium,
        displaySmall: AppTypography.displaySmall,
        headlineLarge: AppTypography.headlineLarge,
        headlineMedium: AppTypography.headlineMedium,
        headlineSmall: AppTypography.headlineSmall,
        titleLarge: AppTypography.titleLarge,
        titleMedium: AppTypography.titleMedium,
        titleSmall: AppTypography.titleSmall,
        bodyLarge: AppTypography.bodyLarge,
        bodyMedium: AppTypography.bodyMedium,
        bodySmall: AppTypography.bodySmall,
        labelLarge: AppTypography.labelLarge,
        labelMedium: AppTypography.labelMedium,
        labelSmall: AppTypography.labelSmall,
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
          borderSide: const BorderSide(color: AppColors.primaryBlueLight, width: 2),
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

  /// Theme for data visualization components
  static ThemeData getDataVisualizationTheme(BuildContext context) {
    final baseTheme = Theme.of(context);
    return baseTheme.copyWith(
      // Custom theme overrides for charts and graphs
      colorScheme: baseTheme.colorScheme.copyWith(
        primary: AppColors.primaryBlue,
        secondary: AppColors.secondaryTeal,
        tertiary: AppColors.accentCyan,
      ),
    );
  }
}
