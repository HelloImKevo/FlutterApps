import 'package:flutter/material.dart';
import '../../../design_system/design_system.dart';

/// Loading overlay widget for displaying loading states
class LoadingOverlay extends StatelessWidget {
  final String message;
  final double? progress;

  const LoadingOverlay({
    super.key,
    this.message = 'Loading...',
    this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      child: Center(
        child: AccessibleCard(
          margin: AppSpacing.cardPadding24,
          semanticLabel: 'Loading progress',
          child: Padding(
            padding: AppSpacing.cardPadding24,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (progress != null)
                  CircularProgressIndicator(
                    value: progress,
                    strokeWidth: 4,
                    backgroundColor: AppColors.borderLight,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(AppColors.primaryBlue),
                  )
                else
                  CircularProgressIndicator(
                    strokeWidth: 4,
                    backgroundColor: AppColors.borderLight,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(AppColors.primaryBlue),
                  ),
                AppSpacing.gapLg,
                Text(
                  message,
                  style: AppTypography.titleMedium.copyWith(
                    color: AppColors.textPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
                if (progress != null) ...[
                  AppSpacing.gapMd,
                  Text(
                    '${(progress! * 100).round()}%',
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
