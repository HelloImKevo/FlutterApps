import 'package:flutter/material.dart';
import '../../presentation/screens/splash_screen.dart';
import '../../presentation/screens/dashboard/dashboard_screen.dart';
import '../../presentation/screens/wave_modeling/wave_modeling_screen.dart';
import '../../presentation/screens/analytics/analytics_screen.dart';
import '../../presentation/screens/visualization/visualization_screen.dart';
import '../../design_system/design_system.dart';

/// Centralized routing configuration for the Coastal Modeling Application
///
/// This class manages all navigation routes and provides type-safe navigation
/// methods following Clean Architecture principles.
class AppRouter {
  AppRouter._(); // Private constructor

  // Route names as constants
  static const String splash = '/';
  static const String dashboard = '/dashboard';
  static const String waveModeling = '/wave-modeling';
  static const String analytics = '/analytics';
  static const String visualization = '/visualization';
  static const String engineeringTools = '/engineering-tools';

  /// Main route configuration
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return _buildRoute(const SplashScreen(), settings);

      case dashboard:
        return _buildRoute(const DashboardScreen(), settings);

      case waveModeling:
        return _buildRoute(const WaveModelingScreen(), settings);

      case analytics:
        return _buildRoute(const AnalyticsScreen(), settings);

      case visualization:
        return _buildRoute(const VisualizationScreen(), settings);

      case engineeringTools:
        return _buildRoute(const _EngineeringToolsScreen(), settings);

      default:
        return _buildRoute(const _NotFoundScreen(), settings);
    }
  }

  /// Builds a route with consistent page transition
  static PageRoute<T> _buildRoute<T>(Widget page, RouteSettings settings) {
    return PageRouteBuilder<T>(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Elegant slide transition from right
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOutCubic;

        var tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  /// Navigation helper methods
  static Future<T?> pushNamed<T>(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.pushNamed<T>(context, routeName, arguments: arguments);
  }

  static Future<T?> pushReplacementNamed<T extends Object?>(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.pushReplacementNamed<T, T>(
      context,
      routeName,
      arguments: arguments,
    );
  }

  static void pop<T>(BuildContext context, [T? result]) {
    Navigator.pop<T>(context, result);
  }

  static Future<T?> pushNamedAndRemoveUntil<T>(
    BuildContext context,
    String routeName,
    bool Function(Route<dynamic>) predicate, {
    Object? arguments,
  }) {
    return Navigator.pushNamedAndRemoveUntil<T>(
      context,
      routeName,
      predicate,
      arguments: arguments,
    );
  }
}

/// Placeholder screen for engineering tools (to be implemented)
class _EngineeringToolsScreen extends StatelessWidget {
  const _EngineeringToolsScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: AppBar(
        title: const Text('Engineering Tools'),
        backgroundColor: AppColors.primaryBlue,
        foregroundColor: AppColors.white,
        elevation: AppSpacing.elevationMedium,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.engineering,
              size: 64,
              color: AppColors.textTertiary,
            ),
            AppSpacing.gapMd,
            Text(
              'Engineering Tools Module',
              style: AppTypography.titleLarge.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            AppSpacing.gapSm,
            Text(
              'Coming Soon',
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 404 Not Found screen
class _NotFoundScreen extends StatelessWidget {
  const _NotFoundScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: AppBar(
        title: const Text('Page Not Found'),
        backgroundColor: AppColors.primaryBlue,
        foregroundColor: AppColors.white,
        elevation: AppSpacing.elevationMedium,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: AppColors.error,
            ),
            AppSpacing.gapMd,
            Text(
              'Page Not Found',
              style: AppTypography.titleLarge.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            AppSpacing.gapSm,
            Text(
              'The requested page could not be found',
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
