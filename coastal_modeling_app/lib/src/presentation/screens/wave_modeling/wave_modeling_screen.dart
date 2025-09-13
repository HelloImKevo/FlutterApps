import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../design_system/design_system.dart';
import '../../../application/wave_modeling/wave_modeling_bloc.dart';
import '../../../application/wave_modeling/wave_modeling_event.dart';
import '../../../application/wave_modeling/wave_modeling_state.dart';
import '../../../domain/value_objects/wave_parameters.dart';
import '../../../domain/value_objects/coordinates.dart';
import '../../widgets/wave_modeling/wave_parameters_form.dart';
import '../../widgets/wave_modeling/wave_simulation_display.dart';
import '../../widgets/common/loading_overlay.dart';

/// Wave Modeling screen for coastal wave propagation simulation
///
/// This screen provides the main interface for configuring wave parameters,
/// running simulations, and visualizing wave propagation results.
class WaveModelingScreen extends StatelessWidget {
  const WaveModelingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WaveModelingBloc(),
      child: const _WaveModelingView(),
    );
  }
}

class _WaveModelingView extends StatefulWidget {
  const _WaveModelingView();

  @override
  State<_WaveModelingView> createState() => _WaveModelingViewState();
}

class _WaveModelingViewState extends State<_WaveModelingView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: AppBar(
        title: const Text('Wave Modeling & Simulation'),
        backgroundColor: AppColors.primaryBlue,
        foregroundColor: AppColors.white,
        elevation: AppSpacing.elevationMedium,
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: () => _showHelpDialog(context),
            tooltip: 'Help & Documentation',
          ),
          AppSpacing.gapMd,
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppColors.accentCyan,
          labelColor: AppColors.white,
          unselectedLabelColor: AppColors.white.withValues(alpha: 0.7),
          tabs: const [
            Tab(
              icon: Icon(Icons.tune),
              text: 'Parameters',
            ),
            Tab(
              icon: Icon(Icons.play_circle_outline),
              text: 'Simulation',
            ),
            Tab(
              icon: Icon(Icons.analytics),
              text: 'Results',
            ),
          ],
        ),
      ),
      body: BlocConsumer<WaveModelingBloc, WaveModelingState>(
        listener: (context, state) {
          if (state is WaveModelingError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: AppColors.error,
              ),
            );
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              TabBarView(
                controller: _tabController,
                children: [
                  _buildParametersTab(context, state),
                  _buildSimulationTab(context, state),
                  _buildResultsTab(context, state),
                ],
              ),
              if (state is WaveModelingLoading)
                const LoadingOverlay(message: 'Running wave simulation...'),
            ],
          );
        },
      ),
      floatingActionButton: BlocBuilder<WaveModelingBloc, WaveModelingState>(
        builder: (context, state) {
          if (_tabController.index == 1 && state is! WaveModelingLoading) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: AccessibleActionButton(
                onPressed: () => _runSimulation(context),
                label: 'Run Simulation',
                icon: Icons.play_arrow,
                isPrimary: true,
                isHighContrast: context.isHighContrastMode,
                semanticLabel: 'Run wave simulation',
                semanticHint:
                    'Starts the wave propagation simulation with current parameters',
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildParametersTab(BuildContext context, WaveModelingState state) {
    return SingleChildScrollView(
      padding: AppSpacing.screenEdgeInsets(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSpacing.gapLg,
          _buildSectionHeader(
            'Wave Parameters Configuration',
            'Configure the physical properties of waves for your simulation',
            Icons.waves,
          ),
          AppSpacing.gapMd,
          const WaveParametersForm(),
          AppSpacing.gapXl,
          _buildLocationSection(context),
          AppSpacing.gapXl,
        ],
      ),
    );
  }

  Widget _buildSimulationTab(BuildContext context, WaveModelingState state) {
    return SingleChildScrollView(
      padding: AppSpacing.screenEdgeInsets(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSpacing.gapLg,
          _buildSectionHeader(
            'Wave Simulation Environment',
            'Monitor wave propagation and transformation in real-time',
            Icons.timeline,
          ),
          AppSpacing.gapMd,
          const WaveSimulationDisplay(),
          AppSpacing.gapXl,
        ],
      ),
    );
  }

  Widget _buildResultsTab(BuildContext context, WaveModelingState state) {
    return SingleChildScrollView(
      padding: AppSpacing.screenEdgeInsets(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSpacing.gapLg,
          _buildSectionHeader(
            'Simulation Results & Analysis',
            'Analyze wave behavior and export simulation data',
            Icons.assessment,
          ),
          AppSpacing.gapMd,
          if (state is WaveModelingSuccess)
            _buildResultsContent(context, state)
          else
            _buildNoResultsState(context),
          AppSpacing.gapXl,
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, String subtitle, IconData icon) {
    return Container(
      padding: AppSpacing.cardPadding16,
      decoration: BoxDecoration(
        color: AppColors.white, // Force white background
        borderRadius: AppSpacing.borderRadiusMd,
        border: Border.all(color: AppColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primaryBlue.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
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
                  title,
                  style: AppTypography.titleMedium.copyWith(
                    color: AppColors.black, // Use black for maximum contrast
                    fontWeight: FontWeight.w600,
                  ),
                ),
                AppSpacing.gapXs,
                Text(
                  subtitle,
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.charcoal, // Use charcoal for subtitles
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationSection(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white, // Force white background
        borderRadius: AppSpacing.borderRadiusMd,
        border: Border.all(color: AppColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: AppSpacing.cardPadding16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Study Location',
              style: AppTypography.titleMedium.copyWith(
                color: AppColors.black, // Use black for maximum contrast
                fontWeight: FontWeight.w600,
              ),
            ),
            AppSpacing.gapMd,
            ListTile(
              leading: Icon(
                Icons.location_on,
                color: AppColors.primaryBlue,
              ),
              title: Text(
                'Gulf of Mexico',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                '27.7663°N, 82.6404°W',
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.charcoal,
                ),
              ),
              trailing: TextButton(
                onPressed: () {
                  // TODO: Open location picker
                },
                child: Text(
                  'Change',
                  style: AppTypography.labelMedium.copyWith(
                    color: AppColors.primaryBlue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            AppSpacing.gapSm,
            Row(
              children: [
                Expanded(
                  child: _buildInfoChip('Water Depth', '15.0 m'),
                ),
                AppSpacing.gapSm,
                Expanded(
                  child: _buildInfoChip('Grid Size', '100x100'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoChip(String label, String value) {
    return Container(
      padding: AppSpacing.all8,
      decoration: BoxDecoration(
        color: AppColors.lightGray, // Light gray background
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: AppTypography.labelSmall.copyWith(
              color: AppColors.charcoal, // Use charcoal for better contrast
            ),
          ),
          AppSpacing.gapXs,
          Text(
            value,
            style: AppTypography.titleSmall.copyWith(
              color: AppColors.black, // Use black for maximum contrast
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultsContent(BuildContext context, WaveModelingSuccess state) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.white, // Force white background
            borderRadius: AppSpacing.borderRadiusMd,
            border: Border.all(color: AppColors.borderLight),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withValues(alpha: 0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: AppSpacing.cardPadding16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Simulation Summary',
                  style: AppTypography.titleMedium.copyWith(
                    color: AppColors.black, // Use black for maximum contrast
                    fontWeight: FontWeight.w600,
                  ),
                ),
                AppSpacing.gapMd,
                Row(
                  children: [
                    Expanded(
                      child: _buildResultMetric(
                        'Max Wave Height',
                        '${state.results.metrics.maxWaveHeight.toStringAsFixed(2)} m',
                        Icons.trending_up,
                      ),
                    ),
                    Expanded(
                      child: _buildResultMetric(
                        'Energy Dissipation',
                        '${(state.results.metrics.energyDissipation * 100).toStringAsFixed(1)}%',
                        Icons.flash_off,
                      ),
                    ),
                  ],
                ),
                AppSpacing.gapMd,
                Row(
                  children: [
                    Expanded(
                      child: AccessibleActionButton(
                        onPressed: () {
                          // TODO: Export results
                        },
                        label: 'Export Data',
                        icon: Icons.download,
                        isPrimary: true,
                        isHighContrast: context.isHighContrastMode,
                        semanticLabel: 'Export simulation results',
                        semanticHint:
                            'Downloads the simulation data in a shareable format',
                      ),
                    ),
                    AppSpacing.gapMd,
                    Expanded(
                      child: AccessibleActionButton(
                        onPressed: () {
                          // TODO: Share results
                        },
                        label: 'Share',
                        icon: Icons.share,
                        isHighContrast: context.isHighContrastMode,
                        semanticLabel: 'Share simulation results',
                        semanticHint:
                            'Opens sharing options for the simulation results',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildResultMetric(String label, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: AppColors.lightGray, // Light gray background
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: AppColors.primaryBlue,
            size: 20,
          ),
          AppSpacing.gapSm,
          Text(
            value,
            style: AppTypography.titleMedium.copyWith(
              color: AppColors.black, // Use black for maximum contrast
              fontWeight: FontWeight.bold,
            ),
          ),
          AppSpacing.gapXs,
          Text(
            label,
            style: AppTypography.labelSmall.copyWith(
              color: AppColors.charcoal, // Use charcoal for labels
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildNoResultsState(BuildContext context) {
    return Container(
      padding: AppSpacing.cardPadding24,
      decoration: BoxDecoration(
        color: AppColors.white, // Use white background for visibility
        borderRadius: AppSpacing.borderRadiusMd,
        border: Border.all(color: AppColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            Icons.analytics_outlined,
            size: 64,
            color: AppColors.primaryBlue, // Use primary color for visibility
          ),
          AppSpacing.gapMd,
          Text(
            'No Simulation Results',
            style: AppTypography.titleMedium.copyWith(
              color: AppColors.charcoal, // Use charcoal for better contrast
            ),
          ),
          AppSpacing.gapSm,
          Text(
            'Run a wave simulation to see detailed analysis and results',
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.darkGray, // Use dark gray for descriptions
            ),
            textAlign: TextAlign.center,
          ),
          AppSpacing.gapLg,
          AccessibleActionButton(
            onPressed: () {
              _tabController.animateTo(1);
            },
            label: 'Go to Simulation',
            icon: Icons.play_arrow,
            isPrimary: true,
            isHighContrast: context.isHighContrastMode,
            semanticLabel: 'Navigate to simulation tab',
            semanticHint: 'Switches to the simulation tab to run wave modeling',
          ),
        ],
      ),
    );
  }

  void _runSimulation(BuildContext context) {
    final bloc = context.read<WaveModelingBloc>();

    // Create sample wave parameters for demonstration
    final waveParams = WaveParameters(
      significantWaveHeight: 2.0,
      peakPeriod: 8.0,
      meanDirection: 270.0,
      waterDepth: 15.0,
    );

    final location = CoordinatesFactory.gulfOfMexico;

    bloc.add(RunWaveSimulation(
      waveParameters: waveParams,
      location: location,
    ));

    // Switch to results tab after starting simulation
    Future.delayed(const Duration(milliseconds: 500), () {
      _tabController.animateTo(2);
    });
  }

  void _showHelpDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(
              Icons.help_outline,
              color: AppColors.primaryBlue,
            ),
            AppSpacing.gapMd,
            const Text('Wave Modeling Help'),
          ],
        ),
        content: const SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Wave Modeling Module',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                '1. Configure wave parameters in the Parameters tab\n'
                '2. Monitor simulation progress in the Simulation tab\n'
                '3. Analyze results and export data in the Results tab\n\n'
                'This module simulates wave propagation using linear wave theory '
                'and accounts for depth-limited wave transformation.',
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Got it'),
          ),
        ],
      ),
    );
  }
}
