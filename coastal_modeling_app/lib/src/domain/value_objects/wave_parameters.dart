import 'dart:math' as math;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wave_parameters.freezed.dart';
part 'wave_parameters.g.dart';

/// Represents wave parameters used in coastal modeling
/// 
/// This value object encapsulates all the essential wave characteristics
/// needed for wave propagation and transformation calculations.
@freezed
class WaveParameters with _$WaveParameters {
  const factory WaveParameters({
    /// Significant wave height in meters
    required double significantWaveHeight,
    
    /// Peak wave period in seconds
    required double peakPeriod,
    
    /// Mean wave direction in degrees (0-360, where 0 = North)
    required double meanDirection,
    
    /// Directional spreading coefficient
    @Default(30.0) double directionalSpreading,
    
    /// Water depth at the location in meters (positive for depth below surface)
    @Default(10.0) double waterDepth,
    
    /// Wave energy density in J/m²
    double? energyDensity,
    
    /// Wave steepness (H/L ratio)
    double? steepness,
    
    /// Breaking wave indicator
    @Default(false) bool isBreaking,
  }) = _WaveParameters;

  factory WaveParameters.fromJson(Map<String, dynamic> json) =>
      _$WaveParametersFromJson(json);
}

extension WaveParametersExtension on WaveParameters {
  /// Validates wave parameters for physical reasonableness
  bool get isValid {
    return significantWaveHeight >= 0.0 &&
        significantWaveHeight <= 30.0 && // Reasonable upper limit for coastal waves
        peakPeriod >= 1.0 &&
        peakPeriod <= 25.0 && // Typical range for ocean waves
        meanDirection >= 0.0 &&
        meanDirection <= 360.0 &&
        directionalSpreading >= 0.0 &&
        directionalSpreading <= 180.0 &&
        waterDepth > 0.0;
  }

  /// Calculates wave length using linear wave theory
  double get wavelength {
    const double gravity = 9.81; // m/s²
    final double omega = 2 * math.pi / peakPeriod;
    final double k = omega * omega / gravity; // Deep water approximation
    
    // For finite depth, use dispersion relation iteratively
    // tanh(kh) * (gk) = ω²
    double kh = k * waterDepth;
    
    // Iterative solution for finite depth
    for (int i = 0; i < 10; i++) {
      final double newK = (omega * omega) / (gravity * _tanh(kh));
      kh = newK * waterDepth;
    }
    
    return 2 * math.pi / (kh / waterDepth);
  }

  /// Calculates wave celerity (phase speed)
  double get celerity {
    return wavelength / peakPeriod;
  }

  /// Calculates group velocity
  double get groupVelocity {
    final double k = 2 * math.pi / wavelength;
    final double kh = k * waterDepth;
    final double n = 0.5 * (1 + (2 * kh) / _sinh(2 * kh));
    return n * celerity;
  }

  /// Calculates wave energy per unit area
  double get waveEnergy {
    if (energyDensity != null) return energyDensity!;
    
    const double waterDensity = 1025.0; // kg/m³ for seawater
    const double gravity = 9.81; // m/s²
    
    return (1.0 / 8.0) * waterDensity * gravity * 
           significantWaveHeight * significantWaveHeight;
  }

  /// Calculates wave steepness (H/L)
  double get waveSteepness {
    if (steepness != null) return steepness!;
    return significantWaveHeight / wavelength;
  }

  /// Determines if waves are in deep, intermediate, or shallow water
  WaterDepthRegime get depthRegime {
    final double k = 2 * math.pi / wavelength;
    final double kh = k * waterDepth;
    
    if (kh > math.pi) {
      return WaterDepthRegime.deep;
    } else if (kh > math.pi / 10) {
      return WaterDepthRegime.intermediate;
    } else {
      return WaterDepthRegime.shallow;
    }
  }

  /// Checks if waves are likely to break based on steepness
  bool get shouldBreak {
    if (isBreaking) return true;
    
    // Deep water breaking criterion
    if (depthRegime == WaterDepthRegime.deep) {
      return waveSteepness > 0.142; // H/L > 1/7
    }
    
    // Shallow water breaking criterion (depth-limited)
    final double brekerIndex = significantWaveHeight / waterDepth;
    return brekerIndex > 0.78; // γ > 0.78
  }

  /// Creates a copy with breaking status updated
  WaveParameters withBreakingStatus() {
    return copyWith(isBreaking: shouldBreak);
  }

  /// Converts to deep water equivalent parameters
  WaveParameters toDeepWater() {
    if (depthRegime == WaterDepthRegime.deep) return this;
    
    // Shoaling coefficient calculation
    final double k = 2 * math.pi / wavelength;
    final double kh = k * waterDepth;
    final double ks = math.sqrt(2 * kh / _sinh(2 * kh));
    
    // Deep water wave height
    final double deepWaterHeight = significantWaveHeight / ks;
    
    return copyWith(
      significantWaveHeight: deepWaterHeight,
      waterDepth: double.infinity,
    );
  }

  /// Formats wave parameters for display
  String get formatted {
    return 'Hs: ${significantWaveHeight.toStringAsFixed(2)}m, '
           'Tp: ${peakPeriod.toStringAsFixed(1)}s, '
           'Dir: ${meanDirection.toStringAsFixed(0)}°, '
           'Depth: ${waterDepth.toStringAsFixed(1)}m';
  }
}

/// Enumeration for water depth regimes
enum WaterDepthRegime {
  deep,
  intermediate,
  shallow,
}

/// Factory for creating common wave parameter instances
class WaveParametersFactory {
  WaveParametersFactory._();

  /// Creates typical calm sea conditions
  static WaveParameters calm({double waterDepth = 10.0}) {
    return WaveParameters(
      significantWaveHeight: 0.5,
      peakPeriod: 4.0,
      meanDirection: 90.0,
      waterDepth: waterDepth,
    );
  }

  /// Creates moderate sea conditions
  static WaveParameters moderate({double waterDepth = 10.0}) {
    return WaveParameters(
      significantWaveHeight: 2.0,
      peakPeriod: 7.0,
      meanDirection: 90.0,
      waterDepth: waterDepth,
    );
  }

  /// Creates rough sea conditions
  static WaveParameters rough({double waterDepth = 15.0}) {
    return WaveParameters(
      significantWaveHeight: 4.0,
      peakPeriod: 10.0,
      meanDirection: 90.0,
      waterDepth: waterDepth,
    );
  }

  /// Creates storm conditions
  static WaveParameters storm({double waterDepth = 20.0}) {
    return WaveParameters(
      significantWaveHeight: 8.0,
      peakPeriod: 14.0,
      meanDirection: 90.0,
      waterDepth: waterDepth,
    );
  }

  /// Creates hurricane conditions
  static WaveParameters hurricane({double waterDepth = 25.0}) {
    return WaveParameters(
      significantWaveHeight: 15.0,
      peakPeriod: 18.0,
      meanDirection: 90.0,
      waterDepth: waterDepth,
      isBreaking: true,
    );
  }

  /// Creates parameters from NDBC buoy data format
  static WaveParameters fromNDBCData({
    required double waveHeight,
    required double dominantPeriod,
    required double meanDirection,
    required double waterDepth,
  }) {
    return WaveParameters(
      significantWaveHeight: waveHeight,
      peakPeriod: dominantPeriod,
      meanDirection: meanDirection,
      waterDepth: waterDepth,
    );
  }
}

/// Helper functions for hyperbolic functions
double _tanh(double x) {
  return (math.exp(x) - math.exp(-x)) / (math.exp(x) + math.exp(-x));
}

double _sinh(double x) {
  return (math.exp(x) - math.exp(-x)) / 2.0;
}
