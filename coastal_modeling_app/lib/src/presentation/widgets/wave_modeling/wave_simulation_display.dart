import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../design_system/design_system.dart';
import '../../../application/wave_modeling/wave_modeling_bloc.dart';
import '../../../application/wave_modeling/wave_modeling_state.dart';

/// Widget for displaying wave simulation progress and visualization
class WaveSimulationDisplay extends StatelessWidget {
  const WaveSimulationDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaveModelingBloc, WaveModelingState>(
      builder: (context, state) {
        return AccessibleCard(
          elevation: AppSpacing.elevationLow,
          isHighContrast: context.isHighContrastMode,
          semanticLabel: 'Wave simulation display area',
          child: Padding(
            padding: AppSpacing.cardPadding16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                AppSpacing.gapLg,
                _buildSimulationArea(context, state),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.primaryBlue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.play_circle_outline,
            color: AppColors.primaryBlue,
            size: 24,
          ),
        ),
        AppSpacing.gapMd,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Wave Propagation Simulation',
                style: AppTypography.titleMedium.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              AppSpacing.gapXs,
              Text(
                'Real-time wave modeling and visualization',
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSimulationArea(BuildContext context, WaveModelingState state) {
    if (state is WaveModelingLoading) {
      return _buildLoadingState(state);
    } else if (state is WaveModelingSuccess) {
      return _buildSuccessState(state);
    } else if (state is WaveModelingError) {
      return _buildErrorState(state);
    } else {
      return _buildIdleState();
    }
  }

  Widget _buildIdleState() {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: AppColors.backgroundSecondary,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.waves_outlined,
            size: 64,
            color: AppColors.textTertiary,
          ),
          AppSpacing.gapMd,
          Text(
            'Ready to Simulate',
            style: AppTypography.titleMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          AppSpacing.gapSm,
          Text(
            'Configure parameters and run simulation to visualize wave propagation',
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textTertiary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState(WaveModelingLoading state) {
    final progress = state.progress ?? 0.0;
    final progressPercentage = (progress * 100).round();

    return Container(
      height: 300,
      padding: AppSpacing.cardPadding16,
      decoration: BoxDecoration(
        color: AppColors.backgroundSecondary,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Animated wave simulation visualization
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildWaveAnimation(progress),
                  AppSpacing.gapLg,
                  Text(
                    'Simulating Wave Propagation',
                    style: AppTypography.titleMedium.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  AppSpacing.gapSm,
                  Text(
                    state.message ?? 'Running simulation...',
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AppSpacing.gapMd,
          // Progress indicator
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Progress',
                    style: AppTypography.labelMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  Text(
                    '$progressPercentage%',
                    style: AppTypography.labelMedium.copyWith(
                      color: AppColors.primaryBlue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              AppSpacing.gapSm,
              LinearProgressIndicator(
                value: progress,
                backgroundColor: AppColors.borderLight,
                valueColor:
                    AlwaysStoppedAnimation<Color>(AppColors.primaryBlue),
                minHeight: 6,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessState(WaveModelingSuccess state) {
    return Container(
      height: 300,
      padding: AppSpacing.cardPadding16,
      decoration: BoxDecoration(
        color: AppColors.backgroundSecondary,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.check_circle,
                color: AppColors.success,
                size: 24,
              ),
              AppSpacing.gapMd,
              Expanded(
                child: Text(
                  'Simulation Completed Successfully',
                  style: AppTypography.titleMedium.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          AppSpacing.gapMd,
          Expanded(
            child: _buildResultsPreview(state),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(WaveModelingError state) {
    return Container(
      height: 300,
      padding: AppSpacing.cardPadding16,
      decoration: BoxDecoration(
        color: AppColors.error.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.error.withOpacity(0.3)),
      ),
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
            'Simulation Failed',
            style: AppTypography.titleMedium.copyWith(
              color: AppColors.error,
              fontWeight: FontWeight.w600,
            ),
          ),
          AppSpacing.gapSm,
          Text(
            state.message,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          AppSpacing.gapLg,
          AccessibleActionButton(
            onPressed: () {
              // TODO: Retry simulation
            },
            label: 'Retry',
            icon: Icons.refresh,
            isPrimary: true,
            isHighContrast: false, // Will be determined by theme
            semanticLabel: 'Retry failed simulation',
            semanticHint:
                'Attempts to run the wave simulation again after the previous failure',
          ),
        ],
      ),
    );
  }

  Widget _buildWaveAnimation(double progress) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: AppColors.primaryBlue.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Stack(
        children: [
          Center(
            child: CircularProgressIndicator(
              value: progress,
              strokeWidth: 4,
              backgroundColor: AppColors.borderLight,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryBlue),
            ),
          ),
          Center(
            child: Icon(
              Icons.waves,
              size: 48,
              color: AppColors.primaryBlue,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultsPreview(WaveModelingSuccess state) {
    final metrics = state.results.metrics;

    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 2.5,
      children: [
        _buildMetricCard(
          'Max Height',
          '${metrics.maxWaveHeight.toStringAsFixed(2)} m',
          Icons.trending_up,
        ),
        _buildMetricCard(
          'Grid Points',
          '${metrics.totalGridPoints}',
          Icons.grid_4x4,
        ),
        _buildMetricCard(
          'Time Steps',
          '${metrics.timeSteps}',
          Icons.timeline,
        ),
        _buildMetricCard(
          'Computation',
          '${metrics.computationTime.toStringAsFixed(1)}s',
          Icons.timer,
        ),
      ],
    );
  }

  Widget _buildMetricCard(String label, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: AppColors.primaryBlue,
            size: 16,
          ),
          AppSpacing.gapXs,
          Text(
            value,
            style: AppTypography.titleSmall.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            style: AppTypography.labelSmall.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
