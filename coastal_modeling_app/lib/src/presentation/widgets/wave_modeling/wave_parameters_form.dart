import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import '../../../design_system/design_system.dart';

/// Accessible widget for configuring wave modeling parameters
///
/// This form provides WCAG-compliant input fields with proper contrast ratios,
/// semantic labels, and screen reader support for all wave parameter inputs.
class WaveParametersForm extends StatefulWidget {
  const WaveParametersForm({super.key});

  @override
  State<WaveParametersForm> createState() => _WaveParametersFormState();
}

class _WaveParametersFormState extends State<WaveParametersForm> {
  final _waveHeightController = TextEditingController(text: '2.0');
  final _periodController = TextEditingController(text: '8.0');
  final _directionController = TextEditingController(text: '270.0');
  final _depthController = TextEditingController(text: '15.0');

  @override
  void dispose() {
    _waveHeightController.dispose();
    _periodController.dispose();
    _directionController.dispose();
    _depthController.dispose();
    super.dispose();
  }

  /// Parameter change handler for real-time validation
  void _onParameterChanged(String parameterName, String value) {
    // Can be used for real-time validation or calculations
    // For now, just update the UI state if needed
  }

  /// Validates wave height input
  String? _validateWaveHeight(String? value) {
    if (value == null || value.isEmpty) {
      return 'Wave height is required';
    }
    final height = double.tryParse(value);
    if (height == null) {
      return 'Please enter a valid number';
    }
    if (height <= 0) {
      return 'Wave height must be greater than 0';
    }
    if (height > 50) {
      return 'Wave height seems unusually large (>50m)';
    }
    return null;
  }

  /// Validates peak period input
  String? _validatePeriod(String? value) {
    if (value == null || value.isEmpty) {
      return 'Peak period is required';
    }
    final period = double.tryParse(value);
    if (period == null) {
      return 'Please enter a valid number';
    }
    if (period <= 0) {
      return 'Period must be greater than 0';
    }
    if (period > 30) {
      return 'Period seems unusually long (>30s)';
    }
    return null;
  }

  /// Validates wave direction input
  String? _validateDirection(String? value) {
    if (value == null || value.isEmpty) {
      return 'Wave direction is required';
    }
    final direction = double.tryParse(value);
    if (direction == null) {
      return 'Please enter a valid number';
    }
    if (direction < 0 || direction > 360) {
      return 'Direction must be between 0 and 360 degrees';
    }
    return null;
  }

  /// Validates water depth input
  String? _validateDepth(String? value) {
    if (value == null || value.isEmpty) {
      return 'Water depth is required';
    }
    final depth = double.tryParse(value);
    if (depth == null) {
      return 'Please enter a valid number';
    }
    if (depth <= 0) {
      return 'Water depth must be greater than 0';
    }
    if (depth > 10000) {
      return 'Depth seems unusually deep (>10km)';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final isHighContrast = MediaQuery.of(context).highContrast;

    return AccessibleCard(
      elevation: AppSpacing.elevationLow,
      isHighContrast: isHighContrast,
      semanticLabel: 'Wave characteristics input form',
      semanticHint:
          'Configure wave modeling parameters including height, period, direction, and depth',
      child: Padding(
        padding: AppSpacing.cardPadding16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section header with improved accessibility
            Row(
              children: [
                Icon(
                  Icons.waves,
                  color: isHighContrast
                      ? AppColors.highContrastPrimary
                      : AppColors.primaryBlue,
                  size: 24,
                  semanticLabel: 'Wave characteristics section',
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Wave Characteristics',
                    style: (isHighContrast
                        ? AppTypography.titleMedium.copyWith(
                            color: AppColors.highContrastText,
                            fontWeight: FontWeight.w700,
                          )
                        : AppTypography.titleMedium.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w600,
                          )),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Parameter input fields with improved accessibility
            Row(
              children: [
                Expanded(
                  child: AccessibleParameterField(
                    label: 'Significant Wave Height',
                    unit: 'meters',
                    controller: _waveHeightController,
                    icon: Icons.waves,
                    isRequired: true,
                    isHighContrast: isHighContrast,
                    helpText: 'Average height of highest 1/3 of waves',
                    semanticLabel:
                        'Significant wave height input, required field',
                    validator: _validateWaveHeight,
                    onChanged: (value) =>
                        _onParameterChanged('waveHeight', value),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: AccessibleParameterField(
                    label: 'Peak Period',
                    unit: 'seconds',
                    controller: _periodController,
                    icon: Icons.timer,
                    isRequired: true,
                    isHighContrast: isHighContrast,
                    helpText: 'Time between wave peaks',
                    semanticLabel: 'Peak period input, required field',
                    validator: _validatePeriod,
                    onChanged: (value) => _onParameterChanged('period', value),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: AccessibleParameterField(
                    label: 'Wave Direction',
                    unit: 'degrees',
                    controller: _directionController,
                    icon: Icons.navigation,
                    isRequired: true,
                    isHighContrast: isHighContrast,
                    helpText: 'Direction waves are coming from (0-360°)',
                    semanticLabel: 'Wave direction input, required field',
                    validator: _validateDirection,
                    onChanged: (value) =>
                        _onParameterChanged('direction', value),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: AccessibleParameterField(
                    label: 'Water Depth',
                    unit: 'meters',
                    controller: _depthController,
                    icon: Icons.straighten,
                    isRequired: true,
                    isHighContrast: isHighContrast,
                    helpText: 'Depth of water at simulation location',
                    semanticLabel: 'Water depth input, required field',
                    validator: _validateDepth,
                    onChanged: (value) => _onParameterChanged('depth', value),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Action buttons with improved accessibility
            Row(
              children: [
                Expanded(
                  child: AccessibleActionButton(
                    onPressed: _resetToDefaults,
                    label: 'Reset Defaults',
                    icon: Icons.refresh,
                    isHighContrast: isHighContrast,
                    semanticLabel: 'Reset all parameters to default values',
                    semanticHint:
                        'This will clear all inputs and restore default wave parameters',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: AccessibleActionButton(
                    onPressed: _validateParameters,
                    label: 'Validate Parameters',
                    icon: Icons.check_circle,
                    isPrimary: true,
                    isHighContrast: isHighContrast,
                    semanticLabel: 'Validate all wave parameters',
                    semanticHint:
                        'Check if all parameters are within valid ranges',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _resetToDefaults() {
    _waveHeightController.text = '2.0';
    _periodController.text = '8.0';
    _directionController.text = '270.0';
    _depthController.text = '15.0';

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Parameters reset to default values'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _validateParameters() {
    final errors = <String>[];
    final isHighContrast = MediaQuery.of(context).highContrast;

    // Validate each parameter using individual validation methods
    final heightError = _validateWaveHeight(_waveHeightController.text);
    final periodError = _validatePeriod(_periodController.text);
    final directionError = _validateDirection(_directionController.text);
    final depthError = _validateDepth(_depthController.text);

    if (heightError != null) errors.add('Wave Height: $heightError');
    if (periodError != null) errors.add('Peak Period: $periodError');
    if (directionError != null) errors.add('Wave Direction: $directionError');
    if (depthError != null) errors.add('Water Depth: $depthError');

    if (errors.isEmpty) {
      // Success feedback with accessibility support
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(
                Icons.check_circle,
                color: isHighContrast
                    ? AppColors.highContrastBackground
                    : AppColors.white,
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                    'All wave parameters are valid and ready for simulation'),
              ),
            ],
          ),
          backgroundColor: isHighContrast
              ? AppColors.highContrastSuccess
              : AppColors.success,
          duration: const Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
          action: SnackBarAction(
            label: 'Dismiss',
            textColor: isHighContrast
                ? AppColors.highContrastBackground
                : AppColors.white,
            onPressed: () =>
                ScaffoldMessenger.of(context).hideCurrentSnackBar(),
          ),
        ),
      );

      // Announce success to screen readers
      SemanticsService.announce(
        'All wave parameters validated successfully. Ready for simulation.',
        TextDirection.ltr,
      );
    } else {
      // Error feedback with enhanced accessibility
      showDialog(
        context: context,
        builder: (context) => Semantics(
          label: 'Parameter validation errors dialog',
          hint: 'Review and fix the validation errors listed',
          child: AlertDialog(
            backgroundColor: isHighContrast
                ? AppColors.highContrastBackground
                : AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: isHighContrast
                  ? const BorderSide(
                      color: AppColors.highContrastText, width: 2)
                  : BorderSide.none,
            ),
            title: Row(
              children: [
                Icon(
                  Icons.error_outline,
                  color: isHighContrast
                      ? AppColors.highContrastError
                      : AppColors.error,
                  semanticLabel: 'Error icon',
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Parameter Validation Errors',
                    style: TextStyle(
                      color: isHighContrast
                          ? AppColors.highContrastText
                          : AppColors.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Please fix the following issues:',
                    style: TextStyle(
                      color: isHighContrast
                          ? AppColors.highContrastText
                          : AppColors.textSecondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...errors.map((error) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.circle,
                              size: 6,
                              color: isHighContrast
                                  ? AppColors.highContrastError
                                  : AppColors.error,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                error,
                                style: TextStyle(
                                  color: isHighContrast
                                      ? AppColors.highContrastText
                                      : AppColors.textPrimary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                style: TextButton.styleFrom(
                  foregroundColor: isHighContrast
                      ? AppColors.highContrastPrimary
                      : AppColors.primaryBlue,
                ),
                child: const Text('OK'),
              ),
            ],
          ),
        ),
      );

      // Announce errors to screen readers
      SemanticsService.announce(
        'Parameter validation failed. ${errors.length} errors found. Please review and fix the issues.',
        TextDirection.ltr,
      );
    }
  }
}
