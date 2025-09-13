import '../value_objects/wave_parameters.dart';
import '../value_objects/coordinates.dart';

/// Represents the result of a wave propagation simulation
///
/// Contains all output data from a wave modeling simulation including
/// wave heights, energy distribution, and transformation parameters.
class WaveSimulationResult {
  final String simulationId;
  final DateTime timestamp;
  final WaveParameters inputParameters;
  final Coordinates location;
  final Duration simulationDuration;
  final SimulationMetrics metrics;
  final List<WaveDataPoint> waveField;
  final Map<String, dynamic>? additionalData;

  const WaveSimulationResult({
    required this.simulationId,
    required this.timestamp,
    required this.inputParameters,
    required this.location,
    required this.simulationDuration,
    required this.metrics,
    required this.waveField,
    this.additionalData,
  });

  Map<String, dynamic> toJson() {
    return {
      'simulationId': simulationId,
      'timestamp': timestamp.toIso8601String(),
      'inputParameters': inputParameters.toJson(),
      'location': location.toJson(),
      'simulationDuration': simulationDuration.inMilliseconds,
      'metrics': metrics.toJson(),
      'waveField': waveField.map((e) => e.toJson()).toList(),
      'additionalData': additionalData,
    };
  }

  factory WaveSimulationResult.fromJson(Map<String, dynamic> json) {
    return WaveSimulationResult(
      simulationId: json['simulationId'],
      timestamp: DateTime.parse(json['timestamp']),
      inputParameters: WaveParameters.fromJson(json['inputParameters']),
      location: Coordinates.fromJson(json['location']),
      simulationDuration: Duration(milliseconds: json['simulationDuration']),
      metrics: SimulationMetrics.fromJson(json['metrics']),
      waveField: (json['waveField'] as List)
          .map((e) => WaveDataPoint.fromJson(e))
          .toList(),
      additionalData: json['additionalData'],
    );
  }
}

/// Simulation metrics and statistics
class SimulationMetrics {
  final double maxWaveHeight;
  final double minWaveHeight;
  final double averageWaveHeight;
  final double energyDissipation;
  final double waveSetup;
  final int totalGridPoints;
  final int timeSteps;
  final double computationTime;

  const SimulationMetrics({
    required this.maxWaveHeight,
    required this.minWaveHeight,
    required this.averageWaveHeight,
    required this.energyDissipation,
    required this.waveSetup,
    required this.totalGridPoints,
    required this.timeSteps,
    this.computationTime = 0.0,
  });

  Map<String, dynamic> toJson() {
    return {
      'maxWaveHeight': maxWaveHeight,
      'minWaveHeight': minWaveHeight,
      'averageWaveHeight': averageWaveHeight,
      'energyDissipation': energyDissipation,
      'waveSetup': waveSetup,
      'totalGridPoints': totalGridPoints,
      'timeSteps': timeSteps,
      'computationTime': computationTime,
    };
  }

  factory SimulationMetrics.fromJson(Map<String, dynamic> json) {
    return SimulationMetrics(
      maxWaveHeight: json['maxWaveHeight'],
      minWaveHeight: json['minWaveHeight'],
      averageWaveHeight: json['averageWaveHeight'],
      energyDissipation: json['energyDissipation'],
      waveSetup: json['waveSetup'],
      totalGridPoints: json['totalGridPoints'],
      timeSteps: json['timeSteps'],
      computationTime: json['computationTime'] ?? 0.0,
    );
  }
}

/// Individual wave data point in the simulation grid
class WaveDataPoint {
  final Coordinates position;
  final double waveHeight;
  final double waveDirection;
  final double wavePeriod;
  final double waterDepth;
  final double waveEnergy;
  final bool isBreaking;

  const WaveDataPoint({
    required this.position,
    required this.waveHeight,
    required this.waveDirection,
    required this.wavePeriod,
    required this.waterDepth,
    this.waveEnergy = 0.0,
    this.isBreaking = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'position': position.toJson(),
      'waveHeight': waveHeight,
      'waveDirection': waveDirection,
      'wavePeriod': wavePeriod,
      'waterDepth': waterDepth,
      'waveEnergy': waveEnergy,
      'isBreaking': isBreaking,
    };
  }

  factory WaveDataPoint.fromJson(Map<String, dynamic> json) {
    return WaveDataPoint(
      position: Coordinates.fromJson(json['position']),
      waveHeight: json['waveHeight'],
      waveDirection: json['waveDirection'],
      wavePeriod: json['wavePeriod'],
      waterDepth: json['waterDepth'],
      waveEnergy: json['waveEnergy'] ?? 0.0,
      isBreaking: json['isBreaking'] ?? false,
    );
  }
}

/// Factory for creating simulation results
class WaveSimulationResultFactory {
  WaveSimulationResultFactory._();

  /// Creates a sample simulation result for testing
  static WaveSimulationResult createSample({
    required WaveParameters inputParams,
    required Coordinates location,
  }) {
    final now = DateTime.now();

    // Generate sample wave field data
    final waveField = <WaveDataPoint>[];
    for (int i = 0; i < 100; i++) {
      for (int j = 0; j < 100; j++) {
        final lat = location.latitude + (i - 50) * 0.001;
        final lon = location.longitude + (j - 50) * 0.001;

        // Simple wave height variation based on distance from center
        final distance = (i - 50).abs() + (j - 50).abs();
        final heightReduction = 1.0 - (distance / 100.0) * 0.3;
        final waveHeight = inputParams.significantWaveHeight * heightReduction;

        waveField.add(WaveDataPoint(
          position: Coordinates(latitude: lat, longitude: lon),
          waveHeight: waveHeight,
          waveDirection: inputParams.meanDirection,
          wavePeriod: inputParams.peakPeriod,
          waterDepth: inputParams.waterDepth,
          waveEnergy: (waveHeight * waveHeight) * 1025 * 9.81 / 8,
          isBreaking: waveHeight / inputParams.waterDepth > 0.78,
        ));
      }
    }

    final metrics = SimulationMetrics(
      maxWaveHeight: inputParams.significantWaveHeight * 1.1,
      minWaveHeight: inputParams.significantWaveHeight * 0.7,
      averageWaveHeight: inputParams.significantWaveHeight,
      energyDissipation: 0.15, // 15% energy loss
      waveSetup: 0.05, // 5cm wave setup
      totalGridPoints: 10000,
      timeSteps: 1000,
      computationTime: 2.5, // 2.5 seconds
    );

    return WaveSimulationResult(
      simulationId: 'sim_${now.millisecondsSinceEpoch}',
      timestamp: now,
      inputParameters: inputParams,
      location: location,
      simulationDuration: const Duration(seconds: 3),
      metrics: metrics,
      waveField: waveField,
    );
  }
}

/// Extensions for additional functionality
extension WaveSimulationResultExtension on WaveSimulationResult {
  /// Gets the wave height at a specific location (nearest neighbor)
  double getWaveHeightAt(Coordinates position) {
    if (waveField.isEmpty) return 0.0;

    WaveDataPoint? nearest;
    double minDistance = double.infinity;

    for (final point in waveField) {
      final distance = position.distanceTo(point.position);
      if (distance < minDistance) {
        minDistance = distance;
        nearest = point;
      }
    }

    return nearest?.waveHeight ?? 0.0;
  }

  /// Gets all breaking wave locations
  List<WaveDataPoint> get breakingWaves {
    return waveField.where((point) => point.isBreaking).toList();
  }

  /// Calculates total wave energy in the domain
  double get totalWaveEnergy {
    return waveField.fold(0.0, (sum, point) => sum + point.waveEnergy);
  }

  /// Gets the simulation efficiency (grid points per second)
  double get simulationEfficiency {
    if (metrics.computationTime <= 0) return 0.0;
    return metrics.totalGridPoints / metrics.computationTime;
  }

  /// Checks if the simulation is considered high quality
  bool get isHighQuality {
    return metrics.totalGridPoints >= 10000 &&
        metrics.timeSteps >= 500 &&
        simulationDuration.inSeconds >= 1;
  }
}

extension SimulationMetricsExtension on SimulationMetrics {
  /// Gets the wave height variation (max - min)
  double get waveHeightRange {
    return maxWaveHeight - minWaveHeight;
  }

  /// Gets the relative energy dissipation percentage
  double get energyDissipationPercent {
    return energyDissipation * 100;
  }

  /// Checks if significant wave setup occurred
  bool get hasSignificantWaveSetup {
    return waveSetup > 0.02; // > 2cm
  }
}
