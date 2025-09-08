import 'package:freezed_annotation/freezed_annotation.dart';
import '../value_objects/coordinates.dart';
import '../value_objects/wave_parameters.dart';

part 'coastal_model.freezed.dart';
part 'coastal_model.g.dart';

/// Represents a complete coastal modeling scenario
/// 
/// This is the main aggregate root for the coastal modeling domain.
/// It encapsulates all the information needed to define and execute
/// a coastal engineering analysis.
@freezed
class CoastalModel with _$CoastalModel {
  const factory CoastalModel({
    required String id,
    required String name,
    required String description,
    required DateTime createdAt,
    required DateTime updatedAt,
    required ModelType modelType,
    required ModelStatus status,
    required StudyArea studyArea,
    required ModelConfiguration configuration,
    List<String>? tags,
    String? projectId,
    String? createdBy,
    Map<String, dynamic>? metadata,
  }) = _CoastalModel;

  factory CoastalModel.fromJson(Map<String, dynamic> json) =>
      _$CoastalModelFromJson(json);
}

/// Study area definition for the coastal model
@freezed
class StudyArea with _$StudyArea {
  const factory StudyArea({
    required String name,
    required BoundingBox boundingBox,
    required String description,
    @Default('EPSG:4326') String coordinateSystem,
    double? characteristicDepth,
    String? region,
  }) = _StudyArea;

  factory StudyArea.fromJson(Map<String, dynamic> json) =>
      _$StudyAreaFromJson(json);
}

/// Bounding box for geographic extent
@freezed
class BoundingBox with _$BoundingBox {
  const factory BoundingBox({
    required Coordinates southWest,
    required Coordinates northEast,
  }) = _BoundingBox;

  factory BoundingBox.fromJson(Map<String, dynamic> json) =>
      _$BoundingBoxFromJson(json);
}

/// Model configuration containing all parameters and settings
@freezed
class ModelConfiguration with _$ModelConfiguration {
  const factory ModelConfiguration({
    required WaveParameters initialConditions,
    required GridConfiguration gridConfig,
    required TimeConfiguration timeConfig,
    PhysicsConfiguration? physicsConfig,
    BoundaryConditions? boundaryConditions,
    OutputConfiguration? outputConfig,
  }) = _ModelConfiguration;

  factory ModelConfiguration.fromJson(Map<String, dynamic> json) =>
      _$ModelConfigurationFromJson(json);
}

/// Grid configuration for numerical modeling
@freezed
class GridConfiguration with _$GridConfiguration {
  const factory GridConfiguration({
    required int numberOfGridPointsX,
    required int numberOfGridPointsY,
    required double gridSpacingX,
    required double gridSpacingY,
    @Default(GridType.cartesian) GridType gridType,
    String? bathymetryFile,
  }) = _GridConfiguration;

  factory GridConfiguration.fromJson(Map<String, dynamic> json) =>
      _$GridConfigurationFromJson(json);
}

/// Time configuration for model simulation
@freezed
class TimeConfiguration with _$TimeConfiguration {
  const factory TimeConfiguration({
    required DateTime startTime,
    required DateTime endTime,
    required Duration timeStep,
    Duration? outputInterval,
  }) = _TimeConfiguration;

  factory TimeConfiguration.fromJson(Map<String, dynamic> json) =>
      _$TimeConfigurationFromJson(json);
}

/// Physics configuration for model calculations
@freezed
class PhysicsConfiguration with _$PhysicsConfiguration {
  const factory PhysicsConfiguration({
    @Default(true) bool includeWaveRefraction,
    @Default(true) bool includeWaveDiffraction,
    @Default(true) bool includeWaveBreaking,
    @Default(false) bool includeWindGeneration,
    @Default(false) bool includeSedimentTransport,
    @Default(0.04) double bottomFriction,
    @Default(1.0) double windDragCoefficient,
  }) = _PhysicsConfiguration;

  factory PhysicsConfiguration.fromJson(Map<String, dynamic> json) =>
      _$PhysicsConfigurationFromJson(json);
}

/// Boundary conditions for the model domain
@freezed
class BoundaryConditions with _$BoundaryConditions {
  const factory BoundaryConditions({
    required BoundaryType westBoundary,
    required BoundaryType eastBoundary,
    required BoundaryType northBoundary,
    required BoundaryType southBoundary,
    WaveParameters? deepWaterWaves,
    String? boundaryDataFile,
  }) = _BoundaryConditions;

  factory BoundaryConditions.fromJson(Map<String, dynamic> json) =>
      _$BoundaryConditionsFromJson(json);
}

/// Output configuration for model results
@freezed
class OutputConfiguration with _$OutputConfiguration {
  const factory OutputConfiguration({
    @Default(['wave_height', 'wave_direction']) List<String> outputVariables,
    @Default(OutputFormat.netcdf) OutputFormat outputFormat,
    @Default('model_output') String outputDirectory,
    @Default(true) bool saveWaveFields,
    @Default(true) bool saveTimeseriesAtPoints,
    List<Coordinates>? outputPoints,
  }) = _OutputConfiguration;

  factory OutputConfiguration.fromJson(Map<String, dynamic> json) =>
      _$OutputConfigurationFromJson(json);
}

/// Enumeration for model types
enum ModelType {
  @JsonValue('wave_propagation')
  wavePropagation,
  
  @JsonValue('storm_surge')
  stormSurge,
  
  @JsonValue('sediment_transport')
  sedimentTransport,
  
  @JsonValue('coastal_erosion')
  coastalErosion,
  
  @JsonValue('combined')
  combined,
}

/// Enumeration for model status
enum ModelStatus {
  @JsonValue('draft')
  draft,
  
  @JsonValue('configured')
  configured,
  
  @JsonValue('running')
  running,
  
  @JsonValue('completed')
  completed,
  
  @JsonValue('failed')
  failed,
  
  @JsonValue('cancelled')
  cancelled,
}

/// Enumeration for grid types
enum GridType {
  @JsonValue('cartesian')
  cartesian,
  
  @JsonValue('curvilinear')
  curvilinear,
  
  @JsonValue('unstructured')
  unstructured,
}

/// Enumeration for boundary types
enum BoundaryType {
  @JsonValue('open')
  open,
  
  @JsonValue('closed')
  closed,
  
  @JsonValue('periodic')
  periodic,
  
  @JsonValue('radiation')
  radiation,
}

/// Enumeration for output formats
enum OutputFormat {
  @JsonValue('netcdf')
  netcdf,
  
  @JsonValue('ascii')
  ascii,
  
  @JsonValue('binary')
  binary,
  
  @JsonValue('hdf5')
  hdf5,
}

/// Extensions for enhanced functionality
extension CoastalModelExtension on CoastalModel {
  /// Checks if the model is ready to run
  bool get isReadyToRun {
    return status == ModelStatus.configured &&
           studyArea.boundingBox.isValid &&
           configuration.isValid;
  }

  /// Calculates the total simulation duration
  Duration get simulationDuration {
    return configuration.timeConfig.endTime
        .difference(configuration.timeConfig.startTime);
  }

  /// Gets the study area center point
  Coordinates get studyAreaCenter {
    final bbox = studyArea.boundingBox;
    return Coordinates(
      latitude: (bbox.southWest.latitude + bbox.northEast.latitude) / 2,
      longitude: (bbox.southWest.longitude + bbox.northEast.longitude) / 2,
    );
  }

  /// Creates a copy with updated status
  CoastalModel withStatus(ModelStatus newStatus) {
    return copyWith(
      status: newStatus,
      updatedAt: DateTime.now(),
    );
  }

  /// Gets the total number of grid points
  int get totalGridPoints {
    return configuration.gridConfig.numberOfGridPointsX *
           configuration.gridConfig.numberOfGridPointsY;
  }

  /// Estimates memory requirements (rough calculation)
  double get estimatedMemoryMB {
    const double bytesPerGridPoint = 32.0; // Rough estimate for multiple variables
    return (totalGridPoints * bytesPerGridPoint) / (1024 * 1024);
  }
}

extension BoundingBoxExtension on BoundingBox {
  /// Validates that the bounding box is properly formed
  bool get isValid {
    return southWest.latitude < northEast.latitude &&
           southWest.longitude < northEast.longitude &&
           southWest.isValid &&
           northEast.isValid;
  }

  /// Calculates the area of the bounding box in square degrees
  double get area {
    return (northEast.latitude - southWest.latitude) *
           (northEast.longitude - southWest.longitude);
  }

  /// Gets the center point of the bounding box
  Coordinates get center {
    return Coordinates(
      latitude: (southWest.latitude + northEast.latitude) / 2,
      longitude: (southWest.longitude + northEast.longitude) / 2,
    );
  }

  /// Checks if a coordinate is within the bounding box
  bool contains(Coordinates point) {
    return point.latitude >= southWest.latitude &&
           point.latitude <= northEast.latitude &&
           point.longitude >= southWest.longitude &&
           point.longitude <= northEast.longitude;
  }
}

extension ModelConfigurationExtension on ModelConfiguration {
  /// Validates the entire model configuration
  bool get isValid {
    return initialConditions.isValid &&
           gridConfig.isValid &&
           timeConfig.isValid;
  }

  /// Gets the total number of time steps
  int get totalTimeSteps {
    final duration = timeConfig.endTime.difference(timeConfig.startTime);
    return (duration.inMicroseconds / timeConfig.timeStep.inMicroseconds).ceil();
  }
}

extension GridConfigurationExtension on GridConfiguration {
  /// Validates grid configuration
  bool get isValid {
    return numberOfGridPointsX > 0 &&
           numberOfGridPointsY > 0 &&
           gridSpacingX > 0 &&
           gridSpacingY > 0;
  }

  /// Gets the total domain size in X direction
  double get domainSizeX {
    return (numberOfGridPointsX - 1) * gridSpacingX;
  }

  /// Gets the total domain size in Y direction
  double get domainSizeY {
    return (numberOfGridPointsY - 1) * gridSpacingY;
  }
}

extension TimeConfigurationExtension on TimeConfiguration {
  /// Validates time configuration
  bool get isValid {
    return startTime.isBefore(endTime) &&
           timeStep.inMicroseconds > 0;
  }

  /// Gets the simulation duration
  Duration get duration {
    return endTime.difference(startTime);
  }
}
