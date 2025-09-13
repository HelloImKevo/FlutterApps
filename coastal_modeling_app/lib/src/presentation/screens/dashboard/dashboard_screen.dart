import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../design_system/design_system.dart';
import '../../../core/navigation/app_router.dart';

/// Main dashboard screen for the Coastal Modeling Application
///
/// Provides navigation to all major application modules and displays
/// recent projects and quick access functionality.
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: AppBar(
        title: const Text('Coastal Modeling Dashboard'),
        backgroundColor: AppColors.primaryBlue,
        foregroundColor: AppColors.white,
        elevation: AppSpacing.elevationMedium,
        actions: [
          // Debug menu for accessibility testing in development
          if (kDebugMode)
            PopupMenuButton<String>(
              icon: const Icon(Icons.accessibility),
              tooltip: 'Accessibility Tools',
              onSelected: (value) {
                if (value == 'test') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AccessibilityTestPanel(),
                    ),
                  );
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'test',
                  child: ListTile(
                    leading: Icon(Icons.accessibility),
                    title: Text('Run Accessibility Tests'),
                  ),
                ),
              ],
            ),
        ],
      ),
      body: SingleChildScrollView(
        padding: AppSpacing.screenEdgeInsets(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSpacing.gapLg,

            // Welcome section
            _buildWelcomeSection(context),
            AppSpacing.gapXl,

            // Quick actions grid
            _buildQuickActionsGrid(context),
            AppSpacing.gapXl,

            // Recent projects section
            _buildRecentProjectsSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeSection(BuildContext context) {
    return Container(
      padding: AppSpacing.cardPadding24,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primaryBlue.withValues(alpha: 0.08),
            AppColors.accentCyan.withValues(alpha: 0.04),
          ],
        ),
        borderRadius: AppSpacing.borderRadiusLg,
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.waves,
                size: 32,
                color: AppColors.primaryBlue,
              ),
              AppSpacing.gapMd,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome to Coastal Modeling',
                      style: AppTypography.headlineMedium.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    AppSpacing.gapSm,
                    Text(
                      'Professional wave & surge analysis tools for coastal engineering',
                      style: AppTypography.bodyMedium.copyWith(
                        color: AppColors.charcoal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionsGrid(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
          style: AppTypography.headlineSmall.copyWith(
            color: AppColors.black, // Use absolute black for maximum contrast
            fontWeight: FontWeight.w600,
          ),
        ),
        AppSpacing.gapMd,
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: AppSpacing.md,
          crossAxisSpacing: AppSpacing.md,
          childAspectRatio: 1.5,
          children: [
            _buildActionCard(
              context,
              title: 'Wave Modeling',
              subtitle: 'Simulate wave propagation',
              icon: Icons.water,
              color: AppColors.primaryBlue,
              onTap: () => AppRouter.pushNamed(context, AppRouter.waveModeling),
            ),
            _buildActionCard(
              context,
              title: 'Advanced Analytics',
              subtitle: 'Data analysis tools',
              icon: Icons.analytics,
              color: AppColors.secondaryTeal,
              onTap: () => AppRouter.pushNamed(context, AppRouter.analytics),
            ),
            _buildActionCard(
              context,
              title: 'Interactive Visualization',
              subtitle: 'Real-time coastal mapping',
              icon: Icons.map,
              color: AppColors.accentCyan,
              onTap: () =>
                  AppRouter.pushNamed(context, AppRouter.visualization),
            ),
            _buildActionCard(
              context,
              title: 'Engineering Tools',
              subtitle: 'Professional suite',
              icon: Icons.engineering,
              color: AppColors
                  .secondaryTeal, // Changed from accentNavy for better visibility
              onTap: () =>
                  AppRouter.pushNamed(context, AppRouter.engineeringTools),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return AccessibleActionCard(
      title: title,
      subtitle: subtitle,
      icon: icon,
      backgroundColor: context.getCardBackgroundColor(color),
      onTap: onTap,
      isHighContrast: context.isHighContrastMode,
      semanticLabel: '$title card',
      semanticHint: 'Double tap to open $title module. $subtitle',
    );
  }

  Widget _buildRecentProjectsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent Projects',
              style: AppTypography.headlineSmall.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            AccessibleActionButton(
              onPressed: () {
                // TODO: Navigate to projects screen
              },
              label: 'View All',
              icon: Icons.arrow_forward,
              isHighContrast: context.isHighContrastMode,
              semanticLabel: 'View all recent projects',
            ),
          ],
        ),
        AppSpacing.gapMd,
        _buildEmptyProjectsState(context),
      ],
    );
  }

  Widget _buildEmptyProjectsState(BuildContext context) {
    return Container(
      padding: AppSpacing.cardPadding24,
      decoration: BoxDecoration(
        color: AppColors.surfaceCard,
        borderRadius: AppSpacing.borderRadiusMd,
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        children: [
          Icon(
            Icons.folder_open,
            size: 48,
            color: AppColors.mediumGray,
          ),
          AppSpacing.gapMd,
          Text(
            'No Recent Projects',
            style: AppTypography.titleMedium.copyWith(
              color: AppColors.darkGray,
            ),
          ),
          AppSpacing.gapSm,
          Text(
            'Start by creating a new coastal model or importing existing data',
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.mediumGray,
            ),
            textAlign: TextAlign.center,
          ),
          AppSpacing.gapLg,
          AccessibleActionButton(
            onPressed: () =>
                AppRouter.pushNamed(context, AppRouter.waveModeling),
            label: 'Create New Model',
            icon: Icons.add,
            isPrimary: true,
            isHighContrast: context.isHighContrastMode,
            semanticLabel: 'Create new coastal model',
            semanticHint:
                'Opens the wave modeling screen to start a new project',
          ),
        ],
      ),
    );
  }
}
