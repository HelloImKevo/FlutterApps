import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import '../colors/app_colors.dart';
import '../typography/app_typography.dart';

/// An accessible form field widget for wave modeling parameters
///
/// This widget ensures WCAG compliance with proper contrast ratios,
/// semantic labels, and screen reader support.
class AccessibleParameterField extends StatelessWidget {
  const AccessibleParameterField({
    super.key,
    required this.label,
    required this.unit,
    required this.controller,
    required this.icon,
    this.validator,
    this.helpText,
    this.semanticLabel,
    this.onChanged,
    this.isRequired = false,
    this.isHighContrast = false,
  });

  final String label;
  final String unit;
  final TextEditingController controller;
  final IconData icon;
  final String? Function(String?)? validator;
  final String? helpText;
  final String? semanticLabel;
  final void Function(String)? onChanged;
  final bool isRequired;
  final bool isHighContrast;

  @override
  Widget build(BuildContext context) {
    final labelColor =
        isHighContrast ? AppColors.highContrastText : AppColors.textPrimary;

    final iconColor =
        isHighContrast ? AppColors.highContrastText : AppColors.primaryBlue;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label with icon
        Row(
          children: [
            Icon(
              icon,
              size: 16,
              color: iconColor,
              semanticLabel: '$label icon',
            ),
            const SizedBox(width: 8),
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: label,
                      style: (isHighContrast
                          ? AppTypography.labelMedium.copyWith(
                              color: AppColors.highContrastText,
                              fontWeight: FontWeight.w600,
                            )
                          : AppTypography.labelMedium.copyWith(
                              color: labelColor,
                              fontWeight: FontWeight.w500,
                            )),
                    ),
                    if (isRequired)
                      TextSpan(
                        text: ' *',
                        style: TextStyle(
                          color: isHighContrast
                              ? AppColors.highContrastError
                              : AppColors.error,
                          fontSize: 16,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 8),

        // Text input field with enhanced accessibility
        Semantics(
          label: semanticLabel ?? '$label input field',
          hint: helpText ?? 'Enter $label value in $unit',
          textField: true,
          child: TextFormField(
            controller: controller,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            onChanged: onChanged,
            validator: validator,
            style: isHighContrast
                ? AppTypography.bodyMedium.copyWith(
                    color: AppColors.highContrastText,
                    fontWeight: FontWeight.w500,
                  )
                : AppTypography.bodyMedium.copyWith(
                    color: AppColors.textPrimary,
                  ),
            decoration: InputDecoration(
              suffixText: unit,
              suffixStyle: isHighContrast
                  ? TextStyle(
                      color: AppColors.highContrastText.withOpacity(0.7),
                      fontWeight: FontWeight.w500,
                    )
                  : TextStyle(
                      color: AppColors.textSecondary,
                    ),
              hintText: 'Enter $label',
              hintStyle: isHighContrast
                  ? TextStyle(
                      color: AppColors.highContrastText.withOpacity(0.6),
                    )
                  : TextStyle(
                      color: AppColors.textTertiary,
                    ),
              helperText: helpText,
              helperStyle: isHighContrast
                  ? AppTypography.helperText.copyWith(
                      color: AppColors.highContrastText.withOpacity(0.8),
                    )
                  : AppTypography.helperText.copyWith(
                      color: AppColors.textSecondary,
                    ),
              filled: true,
              fillColor: isHighContrast
                  ? AppColors.highContrastBackground
                  : AppColors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: isHighContrast
                      ? AppColors.highContrastText
                      : AppColors.borderMedium,
                  width: isHighContrast ? 2 : 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: isHighContrast
                      ? AppColors.highContrastText
                      : AppColors.borderMedium,
                  width: isHighContrast ? 2 : 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: isHighContrast
                      ? AppColors.highContrastPrimary
                      : AppColors.primaryBlue,
                  width: 2,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: isHighContrast
                      ? AppColors.highContrastError
                      : AppColors.error,
                  width: 2,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// Enhanced accessible action button with proper contrast
class AccessibleActionButton extends StatelessWidget {
  const AccessibleActionButton({
    super.key,
    required this.onPressed,
    required this.label,
    required this.icon,
    this.isPrimary = false,
    this.isHighContrast = false,
    this.semanticLabel,
    this.semanticHint,
  });

  final VoidCallback? onPressed;
  final String label;
  final IconData icon;
  final bool isPrimary;
  final bool isHighContrast;
  final String? semanticLabel;
  final String? semanticHint;

  @override
  Widget build(BuildContext context) {
    if (isPrimary) {
      return Semantics(
        label: semanticLabel ?? label,
        hint: semanticHint ?? 'Tap to $label',
        button: true,
        enabled: onPressed != null,
        child: ElevatedButton.icon(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: isHighContrast
                ? AppColors.highContrastBackground
                : AppColors.white,
          ),
          label: Text(
            label,
            style: TextStyle(
              color: isHighContrast
                  ? AppColors.highContrastBackground
                  : AppColors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: isHighContrast
                ? AppColors.highContrastPrimary
                : AppColors.primaryBlue,
            foregroundColor: isHighContrast
                ? AppColors.highContrastBackground
                : AppColors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: isHighContrast
                  ? const BorderSide(
                      color: AppColors.highContrastText, width: 2)
                  : BorderSide.none,
            ),
          ),
        ),
      );
    } else {
      return Semantics(
        label: semanticLabel ?? label,
        hint: semanticHint ?? 'Tap to $label',
        button: true,
        enabled: onPressed != null,
        child: OutlinedButton.icon(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: isHighContrast
                ? AppColors.highContrastText
                : AppColors.primaryBlue,
          ),
          label: Text(
            label,
            style: TextStyle(
              color: isHighContrast
                  ? AppColors.highContrastText
                  : AppColors.primaryBlue,
              fontWeight: FontWeight.w600,
            ),
          ),
          style: OutlinedButton.styleFrom(
            foregroundColor: isHighContrast
                ? AppColors.highContrastText
                : AppColors.primaryBlue,
            backgroundColor: isHighContrast
                ? AppColors.highContrastBackground
                : AppColors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            side: BorderSide(
              color: isHighContrast
                  ? AppColors.highContrastText
                  : AppColors.primaryBlue,
              width: isHighContrast ? 2 : 1,
            ),
          ),
        ),
      );
    }
  }
}
