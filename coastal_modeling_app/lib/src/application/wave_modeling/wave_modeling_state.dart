import '../../domain/entities/wave_simulation_result.dart';

/// Base class for all wave modeling states
abstract class WaveModelingState {
  const WaveModelingState();
}

/// Initial state
class WaveModelingInitial extends WaveModelingState {
  const WaveModelingInitial();
}

/// Loading state during simulation
class WaveModelingLoading extends WaveModelingState {
  final String? message;
  final double? progress;

  const WaveModelingLoading({
    this.message,
    this.progress,
  });
}

/// Success state with simulation results
class WaveModelingSuccess extends WaveModelingState {
  final WaveSimulationResult results;

  const WaveModelingSuccess({required this.results});
}

/// Error state
class WaveModelingError extends WaveModelingState {
  final String message;
  final String? code;

  const WaveModelingError({
    required this.message,
    this.code,
  });
}

/// Parameters updated state
class WaveModelingParametersUpdated extends WaveModelingState {
  const WaveModelingParametersUpdated();
}
