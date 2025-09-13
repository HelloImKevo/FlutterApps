import 'package:flutter/material.dart';
import '../colors/app_colors.dart';
import '../spacing/app_spacing.dart';

/// Accessible Card widget with WCAG 2.1 compliance
///
/// This widget replaces the standard Material Card to ensure proper
/// contrast ratios, semantic structure, and accessibility features.
class AccessibleCard extends StatelessWidget {
  const AccessibleCard({
    super.key,
    required this.child,
    this.elevation,
    this.margin,
    this.color,
    this.isHighContrast = false,
    this.semanticLabel,
    this.semanticHint,
    this.onTap,
  });

  final Widget child;
  final double? elevation;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final bool isHighContrast;
  final String? semanticLabel;
  final String? semanticHint;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = _getBackgroundColor();
    final borderColor = _getBorderColor();

    Widget cardWidget = Container(
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: AppSpacing.borderRadiusMd,
        border: Border.all(
          color: borderColor,
          width: isHighContrast ? 2 : 1,
        ),
        boxShadow: elevation != null && elevation! > 0
            ? [
                BoxShadow(
                  color:
                      AppColors.black.withOpacity(isHighContrast ? 0.3 : 0.1),
                  blurRadius: elevation! * 2,
                  offset: Offset(0, elevation! / 2),
                ),
              ]
            : null,
      ),
      child: child,
    );

    if (onTap != null) {
      cardWidget = Semantics(
        label: semanticLabel,
        hint: semanticHint,
        button: true,
        child: InkWell(
          onTap: onTap,
          borderRadius: AppSpacing.borderRadiusMd,
          child: cardWidget,
        ),
      );
    } else if (semanticLabel != null) {
      cardWidget = Semantics(
        label: semanticLabel,
        child: cardWidget,
      );
    }

    return cardWidget;
  }

  Color _getBackgroundColor() {
    if (color != null) return color!;

    if (isHighContrast) {
      return AppColors.highContrastBackground;
    }

    return AppColors.white;
  }

  Color _getBorderColor() {
    if (isHighContrast) {
      return AppColors.highContrastText;
    }

    return AppColors.borderLight;
  }
}
