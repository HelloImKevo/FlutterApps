import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import '../colors/app_colors.dart';
import '../typography/app_typography.dart';
import '../spacing/app_spacing.dart';

/// An accessible action card component that ensures WCAG compliance
///
/// This card automatically adjusts text and icon colors based on the background
/// color to maintain proper contrast ratios and provides comprehensive
/// accessibility support including screen reader compatibility.
class AccessibleActionCard extends StatelessWidget {
  const AccessibleActionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.backgroundColor,
    required this.onTap,
    this.semanticLabel,
    this.semanticHint,
    this.isHighContrast = false,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color backgroundColor;
  final VoidCallback onTap;
  final String? semanticLabel;
  final String? semanticHint;
  final bool isHighContrast;

  @override
  Widget build(BuildContext context) {
    // Calculate appropriate colors for accessibility
    final textColor = _getTextColor();
    final iconColor = _getIconColor();
    final iconBackgroundColor = _getIconBackgroundColor();

    return Semantics(
      label: semanticLabel ?? '$title. $subtitle',
      hint: semanticHint ?? 'Tap to open $title',
      button: true,
      enabled: true,
      child: Card(
        elevation: AppSpacing.elevationLow,
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusMd,
          side: isHighContrast
              ? const BorderSide(color: AppColors.black, width: 2)
              : BorderSide.none,
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: AppSpacing.borderRadiusMd,
          splashColor: textColor.withOpacity(0.1),
          highlightColor: textColor.withOpacity(0.05),
          child: Padding(
            padding: AppSpacing.cardPadding16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Icon container with proper contrast
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: iconBackgroundColor,
                    borderRadius: BorderRadius.circular(12),
                    border: isHighContrast
                        ? Border.all(color: AppColors.black, width: 1)
                        : null,
                  ),
                  child: Icon(
                    icon,
                    size: 28,
                    color: iconColor,
                    semanticLabel: '$title icon',
                  ),
                ),

                const SizedBox(height: 12),

                // Text content with proper contrast
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: (isHighContrast
                            ? AppTypography.titleMedium.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.highContrastText,
                              )
                            : AppTypography.titleMedium.copyWith(
                                fontWeight: FontWeight.w600,
                                color: textColor,
                              )),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: (isHighContrast
                            ? AppTypography.bodySmall.copyWith(
                                color:
                                    AppColors.highContrastText.withOpacity(0.8),
                              )
                            : AppTypography.bodySmall.copyWith(
                                color: textColor.withOpacity(0.8),
                              )),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Gets appropriate text color based on background color
  Color _getTextColor() {
    if (isHighContrast) {
      return AppColors.highContrastText;
    }

    return AppColors.getTextColorForBackground(backgroundColor);
  }

  /// Gets appropriate icon color based on background color
  Color _getIconColor() {
    if (isHighContrast) {
      return AppColors.highContrastText;
    }

    // For icon containers, we use high contrast colors
    final luminance = backgroundColor.computeLuminance();
    return luminance > 0.5 ? AppColors.white : AppColors.primaryBlue;
  }

  /// Gets appropriate icon background color
  Color _getIconBackgroundColor() {
    if (isHighContrast) {
      return AppColors.highContrastBackground;
    }

    final luminance = backgroundColor.computeLuminance();

    // Use contrasting background for icon container
    if (luminance > 0.7) {
      // Light background - use darker icon background
      return AppColors.primaryBlue.withOpacity(0.1);
    } else if (luminance > 0.3) {
      // Medium background - use light icon background
      return AppColors.white.withOpacity(0.2);
    } else {
      // Dark background - use light icon background
      return AppColors.white.withOpacity(0.15);
    }
  }
}

/// Extension to provide theme-aware card colors
extension AccessibleCardTheme on BuildContext {
  /// Gets the appropriate card color for the current theme
  Color getCardBackgroundColor(Color preferredColor) {
    final brightness = Theme.of(this).brightness;

    if (brightness == Brightness.dark) {
      // In dark theme, ensure cards are visible
      return preferredColor.withOpacity(0.8);
    }

    return preferredColor;
  }

  /// Checks if high contrast mode is enabled
  bool get isHighContrastMode {
    final mediaQuery = MediaQuery.maybeOf(this);
    return mediaQuery?.highContrast ?? false;
  }
}
