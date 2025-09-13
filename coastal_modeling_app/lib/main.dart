import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'src/core/dependency_injection/injection.dart';
import 'src/core/navigation/app_router.dart';
import 'src/design_system/design_system.dart';

/// Main entry point for the Coastal Modeling Application
///
/// Initializes the application with proper dependency injection,
/// theming, and platform-specific configurations for desktop usage.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Configure dependency injection
  await configureDependencies();

  // Set preferred orientations for desktop
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  runApp(const CoastalModelingApp());
}

/// Root application widget for the Coastal Modeling Application
///
/// Configures the MaterialApp with our custom theme, routing,
/// and application-wide settings optimized for desktop usage.
class CoastalModelingApp extends StatelessWidget {
  const CoastalModelingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application metadata
      title: 'Coastal Modeling Application',
      debugShowCheckedModeBanner: false,

      // Theme configuration using our design system
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,

      // Material Design 3 configuration
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            // Ensure text scaling is reasonable for desktop
            textScaleFactor:
                MediaQuery.of(context).textScaleFactor.clamp(0.8, 1.2),
          ),
          child: child!,
        );
      },

      // Initial route configuration
      initialRoute: AppRouter.splash,
      onGenerateRoute: AppRouter.onGenerateRoute,

      // Error handling
      onUnknownRoute: (settings) {
        return AppRouter.onGenerateRoute(settings);
      },
    );
  }
}
