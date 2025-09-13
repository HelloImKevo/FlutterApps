import 'dart:math' as math;

/// Represents wave parameters used in coastal modeling
///
/// This value object encapsulates all the essential wave characteristics
/// needed for wave propagation and transformation calculations.
class WaveParameters {
  /// Significant wave height in meters
  final double significantWaveHeight;

  /// Peak wave period in seconds
  final double peakPeriod;

  /// Mean wave direction in degrees (0-360, where 0 = North)
  final double meanDirection;

  /// Directional spreading coefficient
  final double directionalSpreading;

  /// Water depth at the location in meters (positive for depth below surface)
  final double waterDepth;

  /// Wave energy density in J/m²
  final double? energyDensity;

  /// Wave steepness (H/L ratio)
  final double? steepness;

  /// Breaking wave indicator
  final bool isBreaking;

  const WaveParameters({
    required this.significantWaveHeight,
    required this.peakPeriod,
    required this.meanDirection,
    this.directionalSpreading = 30.0,
    this.waterDepth = 10.0,
    this.energyDensity,
    this.steepness,
    this.isBreaking = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'significantWaveHeight': significantWaveHeight,
      'peakPeriod': peakPeriod,
      'meanDirection': meanDirection,
      'directionalSpreading': directionalSpreading,
      'waterDepth': waterDepth,
      'energyDensity': energyDensity,
      'steepness': steepness,
      'isBreaking': isBreaking,
    };
  }

  factory WaveParameters.fromJson(Map<String, dynamic> json) {
    return WaveParameters(
      significantWaveHeight: json['significantWaveHeight']?.toDouble() ?? 0.0,
      peakPeriod: json['peakPeriod']?.toDouble() ?? 0.0,
      meanDirection: json['meanDirection']?.toDouble() ?? 0.0,
      directionalSpreading: json['directionalSpreading']?.toDouble() ?? 30.0,
      waterDepth: json['waterDepth']?.toDouble() ?? 10.0,
      energyDensity: json['energyDensity']?.toDouble(),
      steepness: json['steepness']?.toDouble(),
      isBreaking: json['isBreaking'] ?? false,
    );
  }

  WaveParameters copyWith({
    double? significantWaveHeight,
    double? peakPeriod,
    double? meanDirection,
    double? directionalSpreading,
    double? waterDepth,
    double? energyDensity,
    double? steepness,
    bool? isBreaking,
  }) {
    return WaveParameters(
      significantWaveHeight:
          significantWaveHeight ?? this.significantWaveHeight,
      peakPeriod: peakPeriod ?? this.peakPeriod,
      meanDirection: meanDirection ?? this.meanDirection,
      directionalSpreading: directionalSpreading ?? this.directionalSpreading,
      waterDepth: waterDepth ?? this.waterDepth,
      energyDensity: energyDensity ?? this.energyDensity,
      steepness: steepness ?? this.steepness,
      isBreaking: isBreaking ?? this.isBreaking,
    );
  }

  /// Validates wave parameters for physical reasonableness
  bool get isValid {
    return significantWaveHeight >= 0.0 &&
        significantWaveHeight <=
            30.0 && // Reasonable upper limit for coastal waves
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

    return (1.0 / 8.0) *
        waterDensity *
        gravity *
        significantWaveHeight *
        significantWaveHeight;
  }

  /// Calculates wave steepness (H/L)
  double get waveSteepness {
    if (steepness != null) return steepness!;
    return significantWaveHeight / wavelength;
  }

  /// Formats wave parameters for display
  String get formatted {
    return 'Hs: ${significantWaveHeight.toStringAsFixed(2)}m, '
        'Tp: ${peakPeriod.toStringAsFixed(1)}s, '
        'Dir: ${meanDirection.toStringAsFixed(0)}°, '
        'Depth: ${waterDepth.toStringAsFixed(1)}m';
  }

  /// Helper functions for hyperbolic functions
  double _tanh(double x) {
    return (math.exp(x) - math.exp(-x)) / (math.exp(x) + math.exp(-x));
  }

  double _sinh(double x) {
    return (math.exp(x) - math.exp(-x)) / 2.0;
  }
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
}
