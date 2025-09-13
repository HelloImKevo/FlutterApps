import '../value_objects/coordinates.dart';
import '../value_objects/wave_parameters.dart';

/// Represents a complete coastal modeling scenario
///
/// This is the main aggregate root for the coastal modeling domain.
/// It encapsulates all the information needed to define and execute
/// a coastal engineering analysis.
class CoastalModel {
  final String id;
  final String name;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final ModelType modelType;
  final ModelStatus status;
  final StudyArea studyArea;
  final ModelConfiguration configuration;
  final List<String>? tags;
  final String? projectId;
  final String? createdBy;
  final Map<String, dynamic>? metadata;

  const CoastalModel({
    required this.id,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.modelType,
    required this.status,
    required this.studyArea,
    required this.configuration,
    this.tags,
    this.projectId,
    this.createdBy,
    this.metadata,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'modelType': modelType.name,
      'status': status.name,
      'studyArea': studyArea.toJson(),
      'configuration': configuration.toJson(),
      'tags': tags,
      'projectId': projectId,
      'createdBy': createdBy,
      'metadata': metadata,
    };
  }

  factory CoastalModel.fromJson(Map<String, dynamic> json) {
    return CoastalModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      modelType:
          ModelType.values.firstWhere((e) => e.name == json['modelType']),
      status: ModelStatus.values.firstWhere((e) => e.name == json['status']),
      studyArea: StudyArea.fromJson(json['studyArea']),
      configuration: ModelConfiguration.fromJson(json['configuration']),
      tags: json['tags']?.cast<String>(),
      projectId: json['projectId'],
      createdBy: json['createdBy'],
      metadata: json['metadata']?.cast<String, dynamic>(),
    );
  }

  CoastalModel copyWith({
    String? id,
    String? name,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
    ModelType? modelType,
    ModelStatus? status,
    StudyArea? studyArea,
    ModelConfiguration? configuration,
    List<String>? tags,
    String? projectId,
    String? createdBy,
    Map<String, dynamic>? metadata,
  }) {
    return CoastalModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      modelType: modelType ?? this.modelType,
      status: status ?? this.status,
      studyArea: studyArea ?? this.studyArea,
      configuration: configuration ?? this.configuration,
      tags: tags ?? this.tags,
      projectId: projectId ?? this.projectId,
      createdBy: createdBy ?? this.createdBy,
      metadata: metadata ?? this.metadata,
    );
  }
}

/// Study area definition for the coastal model
class StudyArea {
  final String name;
  final BoundingBox boundingBox;
  final String description;
  final String coordinateSystem;
  final double? characteristicDepth;
  final String? region;

  const StudyArea({
    required this.name,
    required this.boundingBox,
    required this.description,
    this.coordinateSystem = 'EPSG:4326',
    this.characteristicDepth,
    this.region,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'boundingBox': boundingBox.toJson(),
      'description': description,
      'coordinateSystem': coordinateSystem,
      'characteristicDepth': characteristicDepth,
      'region': region,
    };
  }

  factory StudyArea.fromJson(Map<String, dynamic> json) {
    return StudyArea(
      name: json['name'],
      boundingBox: BoundingBox.fromJson(json['boundingBox']),
      description: json['description'],
      coordinateSystem: json['coordinateSystem'] ?? 'EPSG:4326',
      characteristicDepth: json['characteristicDepth']?.toDouble(),
      region: json['region'],
    );
  }
}

/// Bounding box for geographic extent
class BoundingBox {
  final Coordinates southWest;
  final Coordinates northEast;

  const BoundingBox({
    required this.southWest,
    required this.northEast,
  });

  Map<String, dynamic> toJson() {
    return {
      'southWest': southWest.toJson(),
      'northEast': northEast.toJson(),
    };
  }

  factory BoundingBox.fromJson(Map<String, dynamic> json) {
    return BoundingBox(
      southWest: Coordinates.fromJson(json['southWest']),
      northEast: Coordinates.fromJson(json['northEast']),
    );
  }
}

/// Model configuration containing all parameters and settings
class ModelConfiguration {
  final WaveParameters initialConditions;
  final GridConfiguration gridConfig;
  final TimeConfiguration timeConfig;
  final PhysicsConfiguration? physicsConfig;
  final BoundaryConditions? boundaryConditions;
  final OutputConfiguration? outputConfig;

  const ModelConfiguration({
    required this.initialConditions,
    required this.gridConfig,
    required this.timeConfig,
    this.physicsConfig,
    this.boundaryConditions,
    this.outputConfig,
  });

  Map<String, dynamic> toJson() {
    return {
      'initialConditions': initialConditions.toJson(),
      'gridConfig': gridConfig.toJson(),
      'timeConfig': timeConfig.toJson(),
      'physicsConfig': physicsConfig?.toJson(),
      'boundaryConditions': boundaryConditions?.toJson(),
      'outputConfig': outputConfig?.toJson(),
    };
  }

  factory ModelConfiguration.fromJson(Map<String, dynamic> json) {
    return ModelConfiguration(
      initialConditions: WaveParameters.fromJson(json['initialConditions']),
      gridConfig: GridConfiguration.fromJson(json['gridConfig']),
      timeConfig: TimeConfiguration.fromJson(json['timeConfig']),
      physicsConfig: json['physicsConfig'] != null
          ? PhysicsConfiguration.fromJson(json['physicsConfig'])
          : null,
      boundaryConditions: json['boundaryConditions'] != null
          ? BoundaryConditions.fromJson(json['boundaryConditions'])
          : null,
      outputConfig: json['outputConfig'] != null
          ? OutputConfiguration.fromJson(json['outputConfig'])
          : null,
    );
  }
}

/// Grid configuration for numerical modeling
class GridConfiguration {
  final int numberOfGridPointsX;
  final int numberOfGridPointsY;
  final double gridSpacingX;
  final double gridSpacingY;
  final GridType gridType;
  final String? bathymetryFile;

  const GridConfiguration({
    required this.numberOfGridPointsX,
    required this.numberOfGridPointsY,
    required this.gridSpacingX,
    required this.gridSpacingY,
    this.gridType = GridType.cartesian,
    this.bathymetryFile,
  });

  Map<String, dynamic> toJson() {
    return {
      'numberOfGridPointsX': numberOfGridPointsX,
      'numberOfGridPointsY': numberOfGridPointsY,
      'gridSpacingX': gridSpacingX,
      'gridSpacingY': gridSpacingY,
      'gridType': gridType.name,
      'bathymetryFile': bathymetryFile,
    };
  }

  factory GridConfiguration.fromJson(Map<String, dynamic> json) {
    return GridConfiguration(
      numberOfGridPointsX: json['numberOfGridPointsX'],
      numberOfGridPointsY: json['numberOfGridPointsY'],
      gridSpacingX: json['gridSpacingX']?.toDouble() ?? 0.0,
      gridSpacingY: json['gridSpacingY']?.toDouble() ?? 0.0,
      gridType: GridType.values.firstWhere(
        (e) => e.name == json['gridType'],
        orElse: () => GridType.cartesian,
      ),
      bathymetryFile: json['bathymetryFile'],
    );
  }
}

/// Time configuration for model simulation
class TimeConfiguration {
  final DateTime startTime;
  final DateTime endTime;
  final Duration timeStep;
  final Duration? outputInterval;

  const TimeConfiguration({
    required this.startTime,
    required this.endTime,
    required this.timeStep,
    this.outputInterval,
  });

  Map<String, dynamic> toJson() {
    return {
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
      'timeStep': timeStep.inMilliseconds,
      'outputInterval': outputInterval?.inMilliseconds,
    };
  }

  factory TimeConfiguration.fromJson(Map<String, dynamic> json) {
    return TimeConfiguration(
      startTime: DateTime.parse(json['startTime']),
      endTime: DateTime.parse(json['endTime']),
      timeStep: Duration(milliseconds: json['timeStep']),
      outputInterval: json['outputInterval'] != null
          ? Duration(milliseconds: json['outputInterval'])
          : null,
    );
  }
}

/// Physics configuration for model calculations
class PhysicsConfiguration {
  final bool includeWaveRefraction;
  final bool includeWaveDiffraction;
  final bool includeWaveBreaking;
  final bool includeWindGeneration;
  final bool includeSedimentTransport;
  final double bottomFriction;
  final double windDragCoefficient;

  const PhysicsConfiguration({
    this.includeWaveRefraction = true,
    this.includeWaveDiffraction = true,
    this.includeWaveBreaking = true,
    this.includeWindGeneration = false,
    this.includeSedimentTransport = false,
    this.bottomFriction = 0.04,
    this.windDragCoefficient = 1.0,
  });

  Map<String, dynamic> toJson() {
    return {
      'includeWaveRefraction': includeWaveRefraction,
      'includeWaveDiffraction': includeWaveDiffraction,
      'includeWaveBreaking': includeWaveBreaking,
      'includeWindGeneration': includeWindGeneration,
      'includeSedimentTransport': includeSedimentTransport,
      'bottomFriction': bottomFriction,
      'windDragCoefficient': windDragCoefficient,
    };
  }

  factory PhysicsConfiguration.fromJson(Map<String, dynamic> json) {
    return PhysicsConfiguration(
      includeWaveRefraction: json['includeWaveRefraction'] ?? true,
      includeWaveDiffraction: json['includeWaveDiffraction'] ?? true,
      includeWaveBreaking: json['includeWaveBreaking'] ?? true,
      includeWindGeneration: json['includeWindGeneration'] ?? false,
      includeSedimentTransport: json['includeSedimentTransport'] ?? false,
      bottomFriction: json['bottomFriction']?.toDouble() ?? 0.04,
      windDragCoefficient: json['windDragCoefficient']?.toDouble() ?? 1.0,
    );
  }
}

/// Boundary conditions for the model domain
class BoundaryConditions {
  final BoundaryType westBoundary;
  final BoundaryType eastBoundary;
  final BoundaryType northBoundary;
  final BoundaryType southBoundary;
  final WaveParameters? deepWaterWaves;
  final String? boundaryDataFile;

  const BoundaryConditions({
    required this.westBoundary,
    required this.eastBoundary,
    required this.northBoundary,
    required this.southBoundary,
    this.deepWaterWaves,
    this.boundaryDataFile,
  });

  Map<String, dynamic> toJson() {
    return {
      'westBoundary': westBoundary.name,
      'eastBoundary': eastBoundary.name,
      'northBoundary': northBoundary.name,
      'southBoundary': southBoundary.name,
      'deepWaterWaves': deepWaterWaves?.toJson(),
      'boundaryDataFile': boundaryDataFile,
    };
  }

  factory BoundaryConditions.fromJson(Map<String, dynamic> json) {
    return BoundaryConditions(
      westBoundary:
          BoundaryType.values.firstWhere((e) => e.name == json['westBoundary']),
      eastBoundary:
          BoundaryType.values.firstWhere((e) => e.name == json['eastBoundary']),
      northBoundary: BoundaryType.values
          .firstWhere((e) => e.name == json['northBoundary']),
      southBoundary: BoundaryType.values
          .firstWhere((e) => e.name == json['southBoundary']),
      deepWaterWaves: json['deepWaterWaves'] != null
          ? WaveParameters.fromJson(json['deepWaterWaves'])
          : null,
      boundaryDataFile: json['boundaryDataFile'],
    );
  }
}

/// Output configuration for model results
class OutputConfiguration {
  final List<String> outputVariables;
  final OutputFormat outputFormat;
  final String outputDirectory;
  final bool saveWaveFields;
  final bool saveTimeseriesAtPoints;
  final List<Coordinates>? outputPoints;

  const OutputConfiguration({
    this.outputVariables = const ['wave_height', 'wave_direction'],
    this.outputFormat = OutputFormat.netcdf,
    this.outputDirectory = 'model_output',
    this.saveWaveFields = true,
    this.saveTimeseriesAtPoints = true,
    this.outputPoints,
  });

  Map<String, dynamic> toJson() {
    return {
      'outputVariables': outputVariables,
      'outputFormat': outputFormat.name,
      'outputDirectory': outputDirectory,
      'saveWaveFields': saveWaveFields,
      'saveTimeseriesAtPoints': saveTimeseriesAtPoints,
      'outputPoints': outputPoints?.map((p) => p.toJson()).toList(),
    };
  }

  factory OutputConfiguration.fromJson(Map<String, dynamic> json) {
    return OutputConfiguration(
      outputVariables: json['outputVariables']?.cast<String>() ??
          ['wave_height', 'wave_direction'],
      outputFormat: OutputFormat.values.firstWhere(
        (e) => e.name == json['outputFormat'],
        orElse: () => OutputFormat.netcdf,
      ),
      outputDirectory: json['outputDirectory'] ?? 'model_output',
      saveWaveFields: json['saveWaveFields'] ?? true,
      saveTimeseriesAtPoints: json['saveTimeseriesAtPoints'] ?? true,
      outputPoints: json['outputPoints'] != null
          ? (json['outputPoints'] as List)
              .map((p) => Coordinates.fromJson(p))
              .toList()
          : null,
    );
  }
}

/// Enumeration for model types
enum ModelType {
  wavePropagation,
  stormSurge,
  sedimentTransport,
  coastalErosion,
  combined,
}

/// Enumeration for model status
enum ModelStatus {
  draft,
  configured,
  running,
  completed,
  failed,
  cancelled,
}

/// Enumeration for grid types
enum GridType {
  cartesian,
  curvilinear,
  unstructured,
}

/// Enumeration for boundary types
enum BoundaryType {
  open,
  closed,
  periodic,
  radiation,
}

/// Enumeration for output formats
enum OutputFormat {
  netcdf,
  ascii,
  binary,
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
    const double bytesPerGridPoint =
        32.0; // Rough estimate for multiple variables
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
    return (duration.inMicroseconds / timeConfig.timeStep.inMicroseconds)
        .ceil();
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
    return startTime.isBefore(endTime) && timeStep.inMicroseconds > 0;
  }

  /// Gets the simulation duration
  Duration get duration {
    return endTime.difference(startTime);
  }
}
