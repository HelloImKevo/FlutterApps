/// Design System for the Coastal Modeling Application
/// 
/// This library provides centralized, reusable design components that establish
/// consistent styling and branding across the entire application. It includes color
/// definitions, theme configurations, typography, and spacing utilities.
/// 
/// ## Architecture
/// 
/// The design system is structured into several key components:
/// 
/// - **Colors**: Defines the color palette used throughout the application
/// - **Themes**: Configures widget themes (buttons, text fields, etc.)
/// - **Typography**: Provides consistent text styles and hierarchy
/// - **Spacing**: Defines a consistent spacing system for margins and padding
/// 
/// ## Usage
/// 
/// Import the design system in your Dart files:
/// 
/// ```dart
/// import 'package:coastal_modeling_app/src/design_system/design_system.dart';
/// ```
/// 
/// ### Using Colors
/// 
/// ```dart
/// Container(
///   color: AppColors.primaryBlue,
///   child: Text('Hello Ocean'),
/// )
/// ```
/// 
/// ### Using Themes
/// 
/// ```dart
/// MaterialApp(
///   theme: AppTheme.lightTheme,
///   darkTheme: AppTheme.darkTheme,
///   home: MyHomeScreen(),
/// )
/// ```
/// 
/// ### Using Typography
/// 
/// ```dart
/// Text(
///   'Coastal Model Title',
///   style: AppTypography.headlineLarge.withColor(AppColors.primaryBlue),
/// )
/// ```
/// 
/// ### Using Spacing System
/// 
/// ```dart
/// // Using predefined spacing constants
/// Padding(
///   padding: AppSpacing.contentPadding,
///   child: Text('Content'),
/// )
/// 
/// // Using responsive spacing
/// Padding(
///   padding: AppSpacing.screenEdgeInsets(context),
///   child: Text('Screen content'),
/// )
/// 
/// // Using spacing gaps
/// Column(
///   children: [
///     Text('Wave Height: 2.5m'),
///     AppSpacing.gapMd,
///     Text('Period: 8.2s'),
///   ],
/// )
/// ```
/// 
/// ### Coastal-Specific Design Elements
/// 
/// The design system includes specialized colors and gradients for coastal data:
/// 
/// ```dart
/// // Wave height visualization
/// Container(
///   decoration: BoxDecoration(
///     gradient: LinearGradient(
///       colors: AppColors.waveHeightGradient,
///     ),
///   ),
/// )
/// 
/// // Bathymetry (depth) visualization
/// Container(
///   decoration: BoxDecoration(
///     gradient: LinearGradient(
///       colors: AppColors.bathymetryGradient,
///     ),
///   ),
/// )
/// ```
library design_system;

// Export all the design system components
export 'colors/app_colors.dart';
export 'themes/app_theme.dart';
export 'typography/app_typography.dart';
export 'spacing/app_spacing.dart';
