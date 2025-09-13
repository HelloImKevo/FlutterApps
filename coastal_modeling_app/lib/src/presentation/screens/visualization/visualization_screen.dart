import 'package:flutter/material.dart';
import '../../../design_system/design_system.dart';

/// Visualization screen for coastal modeling data visualization
class VisualizationScreen extends StatelessWidget {
  const VisualizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: AppBar(
        title: const Text('Data Visualization'),
        backgroundColor: AppColors.primaryBlue,
        foregroundColor: AppColors.white,
        elevation: AppSpacing.elevationMedium,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.show_chart,
              size: 64,
              color: AppColors.textTertiary,
            ),
            AppSpacing.gapMd,
            Text(
              'Visualization Module',
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
