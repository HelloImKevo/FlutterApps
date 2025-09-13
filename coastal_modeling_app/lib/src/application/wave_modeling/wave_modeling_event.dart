import '../../domain/value_objects/wave_parameters.dart';
import '../../domain/value_objects/coordinates.dart';

/// Base class for all wave modeling events
abstract class WaveModelingEvent {
  const WaveModelingEvent();
}

/// Initialize the wave modeling module
class Initialize extends WaveModelingEvent {
  const Initialize();
}

/// Update wave parameters
class UpdateWaveParameters extends WaveModelingEvent {
  final WaveParameters waveParameters;

  const UpdateWaveParameters({required this.waveParameters});
}

/// Update simulation location
class UpdateLocation extends WaveModelingEvent {
  final Coordinates location;

  const UpdateLocation({required this.location});
}

/// Run wave simulation
class RunWaveSimulation extends WaveModelingEvent {
  final WaveParameters waveParameters;
  final Coordinates location;

  const RunWaveSimulation({
    required this.waveParameters,
    required this.location,
  });
}

/// Cancel running simulation
class CancelSimulation extends WaveModelingEvent {
  const CancelSimulation();
}

/// Reset simulation state
class Reset extends WaveModelingEvent {
  const Reset();
}
