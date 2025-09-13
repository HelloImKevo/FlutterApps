import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import '../../core/navigation/app_router.dart';

/// Splash screen displayed during app initialization
///
/// This screen shows the Coastal Modeling Application branding and
/// performs initial setup tasks while providing visual feedback to the user.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _uiAnimationController;
  late AnimationController _waveAnimationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _startInitialization();
  }

  void _initializeAnimations() {
    // UI Animation Controller - runs once for splash screen elements
    _uiAnimationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    // Wave Animation Controller - loops continuously for background waves
    _waveAnimationController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _uiAnimationController,
      curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _uiAnimationController,
      curve: const Interval(0.2, 0.7, curve: Curves.elasticOut),
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _uiAnimationController,
      curve: const Interval(0.3, 0.8, curve: Curves.easeOutBack),
    ));

    // Start UI animation once
    _uiAnimationController.forward();

    // Start wave animation and make it repeat continuously
    _waveAnimationController.repeat();
  }

  Future<void> _startInitialization() async {
    // Simulate initialization tasks
    await Future.delayed(const Duration(milliseconds: 5000));

    // Navigate to main dashboard
    if (mounted) {
      AppRouter.pushReplacementNamed(context, AppRouter.dashboard);
    }
  }

  @override
  void dispose() {
    _uiAnimationController.dispose();
    _waveAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: Stack(
        children: [
          // Animated wave background
          Positioned.fill(
            child: CustomPaint(
              painter: WaveBackgroundPainter(
                animation: _waveAnimationController,
                waveColor: AppColors.accentCyan,
              ),
            ),
          ),
          // Static gradient overlay for depth
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.primaryBlue.withOpacity(0.8),
                  AppColors.primaryBlueDark.withOpacity(0.9),
                  AppColors.accentNavy.withOpacity(0.95),
                ],
                stops: const [0.0, 0.6, 1.0],
              ),
            ),
          ),
          // Main content
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                // Responsive flex distribution based on available height
                final bool isCompactHeight = constraints.maxHeight < 600;

                return Column(
                  children: [
                    Expanded(
                      flex: isCompactHeight ? 2 : 3,
                      child: Center(
                        child: AnimatedBuilder(
                          animation: _uiAnimationController,
                          builder: (context, child) {
                            return FadeTransition(
                              opacity: _fadeAnimation,
                              child: ScaleTransition(
                                scale: _scaleAnimation,
                                child: _buildLogo(isCompact: isCompactHeight),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: isCompactHeight ? 3 : 2,
                      child: SlideTransition(
                        position: _slideAnimation,
                        child: FadeTransition(
                          opacity: _fadeAnimation,
                          child: _buildContent(isCompact: isCompactHeight),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: FadeTransition(
                        opacity: _fadeAnimation,
                        child: _buildLoadingIndicator(),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogo({bool isCompact = false}) {
    final logoSize = isCompact ? 100.0 : 120.0;
    final iconSize = isCompact ? 50.0 : 60.0;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // App Icon/Logo
        Container(
          width: logoSize,
          height: logoSize,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(isCompact ? 20 : 24),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.2),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Icon(
            Icons.waves,
            size: iconSize,
            color: AppColors.primaryBlue,
          ),
        ),
        isCompact ? AppSpacing.gapMd : AppSpacing.gapLg,

        // App Title
        Text(
          'Coastal Modeling',
          style: (isCompact
                  ? AppTypography.displaySmall
                  : AppTypography.displayMedium)
              .copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        AppSpacing.gapSm,

        // Subtitle
        Text(
          'Professional Wave & Surge Analysis',
          style:
              (isCompact ? AppTypography.titleSmall : AppTypography.titleMedium)
                  .copyWith(
            color: AppColors.white.withOpacity(0.9),
          ),
        ),
      ],
    );
  }

  Widget _buildContent({bool isCompact = false}) {
    return SingleChildScrollView(
      padding: AppSpacing.screenEdgeInsets(context),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Feature highlights
          _buildFeatureRow(
            icon: Icons.analytics,
            title: 'Advanced Analytics',
            description: 'Comprehensive wave propagation modeling',
            isCompact: isCompact,
          ),
          isCompact ? AppSpacing.gapSm : AppSpacing.gapMd,
          _buildFeatureRow(
            icon: Icons.map,
            title: 'Interactive Visualization',
            description: 'Real-time coastal data mapping',
            isCompact: isCompact,
          ),
          isCompact ? AppSpacing.gapSm : AppSpacing.gapMd,
          _buildFeatureRow(
            icon: Icons.engineering,
            title: 'Engineering Tools',
            description: 'Professional coastal engineering suite',
            isCompact: isCompact,
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureRow({
    required IconData icon,
    required String title,
    required String description,
    bool isCompact = false,
  }) {
    final containerSize = isCompact ? 44.0 : 48.0;
    final iconSize = isCompact ? 22.0 : 26.0;
    final borderRadius = isCompact ? 10.0 : 12.0;

    return Row(
      children: [
        Container(
          width: containerSize,
          height: containerSize,
          decoration: BoxDecoration(
            color: AppColors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Icon(
            icon,
            color: AppColors.white,
            size: iconSize,
          ),
        ),
        AppSpacing.gapMd,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: (isCompact
                        ? AppTypography.titleSmall
                        : AppTypography.titleMedium)
                    .copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              AppSpacing.gapXs,
              Text(
                description,
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.white.withOpacity(0.8),
                ),
                maxLines: isCompact ? 1 : 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLoadingIndicator() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Wave-inspired loading animation
        SizedBox(
          width: 60,
          height: 4,
          child: LinearProgressIndicator(
            backgroundColor: AppColors.white.withOpacity(0.3),
            valueColor: AlwaysStoppedAnimation<Color>(
              AppColors.accentCyan,
            ),
          ),
        ),
        AppSpacing.gapMd,
        Text(
          'Initializing coastal models...',
          style: AppTypography.bodySmall.copyWith(
            color: AppColors.white.withOpacity(0.8),
          ),
        ),
        AppSpacing.gapSm,
        Text(
          'Version 1.0.0',
          style: AppTypography.labelSmall.copyWith(
            color: AppColors.white.withOpacity(0.6),
          ),
        ),
      ],
    );
  }
}

/// Custom painter for creating wave-like background effects
class WaveBackgroundPainter extends CustomPainter {
  final Animation<double> animation;
  final Color waveColor;

  WaveBackgroundPainter({
    required this.animation,
    required this.waveColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = waveColor.withOpacity(0.1)
      ..style = PaintingStyle.fill;

    final double animationValue = animation.value * 2 * math.pi;

    // Draw first wave layer (bottom)
    _drawWave(
      canvas,
      size,
      paint,
      animationValue,
      waveHeight: 25.0,
      yOffset: size.height - 120,
      waveLength: size.width / 3.5,
      opacity: 0.15,
    );

    // Draw second wave layer (middle)
    _drawWave(
      canvas,
      size,
      paint,
      -animationValue * 0.8,
      waveHeight: 20.0,
      yOffset: size.height - 95,
      waveLength: size.width / 4.5,
      opacity: 0.12,
    );

    // Draw third wave layer (top)
    _drawWave(
      canvas,
      size,
      paint,
      animationValue * 1.2,
      waveHeight: 15.0,
      yOffset: size.height - 70,
      waveLength: size.width / 5.5,
      opacity: 0.08,
    );
  }

  void _drawWave(
    Canvas canvas,
    Size size,
    Paint paint,
    double animationValue, {
    required double waveHeight,
    required double yOffset,
    required double waveLength,
    required double opacity,
  }) {
    final Path path = Path();
    paint.color = waveColor.withOpacity(opacity);

    path.moveTo(0, size.height);

    for (double x = 0; x <= size.width; x += 2) {
      final double y = yOffset +
          waveHeight *
              math.sin((x / waveLength) * 2 * math.pi + animationValue);
      path.lineTo(x, y);
    }

    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant WaveBackgroundPainter oldDelegate) {
    return animation != oldDelegate.animation;
  }
}
