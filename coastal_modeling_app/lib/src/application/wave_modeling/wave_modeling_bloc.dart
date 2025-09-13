import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'dart:math' as math;

import 'wave_modeling_event.dart';
import 'wave_modeling_state.dart';
import '../../domain/entities/wave_simulation_result.dart';
import '../../domain/value_objects/wave_parameters.dart';
import '../../domain/value_objects/coordinates.dart';

/// BLoC for managing wave modeling simulation state
class WaveModelingBloc extends Bloc<WaveModelingEvent, WaveModelingState> {
  Timer? _simulationTimer;
  double _simulationProgress = 0.0;

  WaveModelingBloc() : super(const WaveModelingInitial()) {
    on<Initialize>(_onInitialize);
    on<UpdateWaveParameters>(_onUpdateWaveParameters);
    on<UpdateLocation>(_onUpdateLocation);
    on<RunWaveSimulation>(_onRunWaveSimulation);
    on<CancelSimulation>(_onCancelSimulation);
    on<Reset>(_onReset);
  }

  @override
  Future<void> close() {
    _simulationTimer?.cancel();
    return super.close();
  }

  void _onInitialize(Initialize event, Emitter<WaveModelingState> emit) {
    emit(const WaveModelingInitial());
  }

  void _onUpdateWaveParameters(
    UpdateWaveParameters event,
    Emitter<WaveModelingState> emit,
  ) {
    emit(const WaveModelingParametersUpdated());
  }

  void _onUpdateLocation(
    UpdateLocation event,
    Emitter<WaveModelingState> emit,
  ) {
    emit(const WaveModelingParametersUpdated());
  }

  void _onRunWaveSimulation(
    RunWaveSimulation event,
    Emitter<WaveModelingState> emit,
  ) async {
    try {
      // Validate parameters
      if (!event.waveParameters.isValid || !event.location.isValid) {
        emit(const WaveModelingError(
          message: 'Invalid wave parameters or location',
        ));
        return;
      }

      // Start simulation
      emit(const WaveModelingLoading(
        message: 'Initializing simulation...',
        progress: 0.0,
      ));

      // Simulate wave propagation (simplified mock implementation)
      await _runSimulation(event.waveParameters, event.location, emit);
    } catch (e) {
      emit(WaveModelingError(
        message: 'Simulation failed: ${e.toString()}',
      ));
    }
  }

  void _onCancelSimulation(
    CancelSimulation event,
    Emitter<WaveModelingState> emit,
  ) {
    _simulationTimer?.cancel();
    emit(const WaveModelingInitial());
  }

  void _onReset(Reset event, Emitter<WaveModelingState> emit) {
    _simulationTimer?.cancel();
    _simulationProgress = 0.0;
    emit(const WaveModelingInitial());
  }

  Future<void> _runSimulation(
    WaveParameters parameters,
    Coordinates location,
    Emitter<WaveModelingState> emit,
  ) async {
    const int totalSteps = 100;
    const int stepDuration = 50; // milliseconds

    _simulationProgress = 0.0;

    _simulationTimer = Timer.periodic(
      const Duration(milliseconds: stepDuration),
      (timer) {
        _simulationProgress += 1.0 / totalSteps;

        if (_simulationProgress >= 1.0) {
          timer.cancel();
          _onSimulationComplete(parameters, location, emit);
        } else {
          final percentage = (_simulationProgress * 100).round();
          emit(WaveModelingLoading(
            message: 'Running wave simulation... $percentage%',
            progress: _simulationProgress,
          ));
        }
      },
    );
  }

  void _onSimulationComplete(
    WaveParameters parameters,
    Coordinates location,
    Emitter<WaveModelingState> emit,
  ) {
    // Generate mock simulation results
    final result = _generateMockResults(parameters, location);

    emit(WaveModelingSuccess(results: result));
  }

  WaveSimulationResult _generateMockResults(
    WaveParameters parameters,
    Coordinates location,
  ) {
    final random = math.Random();
    final now = DateTime.now();

    // Generate mock wave field data
    final waveField = <WaveDataPoint>[];
    const int gridSize = 50;

    for (int i = 0; i < gridSize; i++) {
      for (int j = 0; j < gridSize; j++) {
        final x = location.longitude + (i - gridSize / 2) * 0.001;
        final y = location.latitude + (j - gridSize / 2) * 0.001;

        // Simulate wave propagation with some randomness
        final distance = math.sqrt(
            math.pow(i - gridSize / 2, 2) + math.pow(j - gridSize / 2, 2));

        final waveHeight = parameters.significantWaveHeight *
            math.exp(-distance / (gridSize / 4)) *
            (0.8 + 0.4 * random.nextDouble());

        waveField.add(WaveDataPoint(
          position: Coordinates(latitude: y, longitude: x),
          waveHeight: math.max(0.0, waveHeight),
          waveDirection:
              parameters.meanDirection + (random.nextDouble() - 0.5) * 20,
          wavePeriod: parameters.peakPeriod * (0.9 + 0.2 * random.nextDouble()),
          waterDepth: parameters.waterDepth,
          waveEnergy: waveHeight * waveHeight * 1.25, // Simplified energy calc
          isBreaking: waveHeight > parameters.waterDepth * 0.8,
        ));
      }
    }

    // Calculate metrics
    final waveHeights = waveField.map((e) => e.waveHeight).toList();
    final maxHeight = waveHeights.reduce(math.max);
    final minHeight = waveHeights.reduce(math.min);
    final avgHeight = waveHeights.reduce((a, b) => a + b) / waveHeights.length;

    final metrics = SimulationMetrics(
      maxWaveHeight: maxHeight,
      minWaveHeight: minHeight,
      averageWaveHeight: avgHeight,
      energyDissipation: (parameters.waveEnergy * 0.15), // 15% dissipation
      waveSetup: maxHeight * 0.1, // Simplified setup calculation
      totalGridPoints: waveField.length,
      timeSteps: 100,
      computationTime: 5.0, // Mock computation time
    );

    return WaveSimulationResult(
      simulationId: 'sim_${now.millisecondsSinceEpoch}',
      timestamp: now,
      inputParameters: parameters,
      location: location,
      simulationDuration: const Duration(seconds: 5),
      metrics: metrics,
      waveField: waveField,
      additionalData: {
        'simulationType': 'linear_wave_theory',
        'gridResolution': 0.001,
        'boundaryConditions': 'open',
      },
    );
  }
}
