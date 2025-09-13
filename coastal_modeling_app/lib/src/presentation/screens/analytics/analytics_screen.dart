import 'package:flutter/material.dart';
import '../../../design_system/design_system.dart';

/// Analytics screen for coastal modeling data analysis
class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: AppBar(
        title: const Text('Analytics & Data Analysis'),
        backgroundColor: AppColors.primaryBlue,
        foregroundColor: AppColors.white,
        elevation: AppSpacing.elevationMedium,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.analytics_outlined,
              size: 64,
              color: AppColors.textTertiary,
            ),
            AppSpacing.gapMd,
            Text(
              'Analytics Module',
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
