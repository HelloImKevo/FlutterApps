import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'src/core/dependency_injection/injection.dart';
import 'src/design_system/design_system.dart';
import 'src/presentation/screens/splash_screen.dart';

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
            textScaleFactor: MediaQuery.of(context).textScaleFactor.clamp(0.8, 1.2),
          ),
          child: child!,
        );
      },
      
      // Home screen
      home: const SplashScreen(),
      
      // TODO: Add routing configuration once more screens are implemented
      // routes: {
      //   '/': (context) => const SplashScreen(),
      //   '/dashboard': (context) => const DashboardScreen(),
      //   '/model': (context) => const ModelScreen(),
      // },
      
      // Error handling
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const _ErrorScreen(),
        );
      },
    );
  }
}

/// Error screen for unknown routes
class _ErrorScreen extends StatelessWidget {
  const _ErrorScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: AppBar(
        title: const Text('Page Not Found'),
        backgroundColor: AppColors.primaryBlue,
        foregroundColor: AppColors.white,
      ),
      body: Center(
        child: Padding(
          padding: AppSpacing.screenEdgeInsets(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 64,
                color: AppColors.error,
              ),
              AppSpacing.gapLg,
              Text(
                'Page Not Found',
                style: AppTypography.headlineMedium.withColor(AppColors.textPrimary),
              ),
              AppSpacing.gapMd,
              Text(
                'The requested page could not be found.',
                style: AppTypography.bodyMedium.withColor(AppColors.textSecondary),
                textAlign: TextAlign.center,
              ),
              AppSpacing.gapXl,
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    '/',
                    (route) => false,
                  );
                },
                icon: const Icon(Icons.home),
                label: const Text('Return Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
