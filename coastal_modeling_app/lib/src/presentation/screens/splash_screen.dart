import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';

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
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
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
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.2, 0.7, curve: Curves.elasticOut),
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.3, 0.8, curve: Curves.easeOutBack),
    ));

    _animationController.forward();
  }

  Future<void> _startInitialization() async {
    // Simulate initialization tasks
    await Future.delayed(const Duration(milliseconds: 2500));

    // TODO: Navigate to main dashboard once implemented
    // Navigator.of(context).pushReplacementNamed('/dashboard');
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.primaryBlue,
              AppColors.primaryBlueDark,
              AppColors.accentNavy,
            ],
            stops: [0.0, 0.6, 1.0],
          ),
        ),
        child: SafeArea(
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
                        animation: _animationController,
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

    final Path path = Path();
    final double waveHeight = 20.0;
    final double waveLength = size.width / 4;
    final double animationValue = animation.value * 2 * 3.14159265359;

    path.moveTo(0, size.height);

    for (double x = 0; x <= size.width; x += 1) {
      final double y = size.height -
          100 +
          waveHeight *
              math.sin((x / waveLength) * 2 * math.pi + animationValue);
      path.lineTo(x, y);
    }

    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);

    // Draw second wave
    final Path path2 = Path();
    path2.moveTo(0, size.height);

    for (double x = 0; x <= size.width; x += 1) {
      final double y = size.height -
          80 +
          waveHeight *
              0.7 *
              math.sin((x / (waveLength * 1.5)) * 2 * math.pi - animationValue);
      path2.lineTo(x, y);
    }

    path2.lineTo(size.width, size.height);
    path2.close();

    paint.color = waveColor.withOpacity(0.08);
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(covariant WaveBackgroundPainter oldDelegate) {
    return animation != oldDelegate.animation;
  }
}
