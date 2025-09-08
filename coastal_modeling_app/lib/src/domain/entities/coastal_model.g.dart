// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coastal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CoastalModelImpl _$$CoastalModelImplFromJson(Map<String, dynamic> json) =>
    _$CoastalModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      modelType: $enumDecode(_$ModelTypeEnumMap, json['modelType']),
      status: $enumDecode(_$ModelStatusEnumMap, json['status']),
      studyArea: StudyArea.fromJson(json['studyArea'] as Map<String, dynamic>),
      configuration: ModelConfiguration.fromJson(
          json['configuration'] as Map<String, dynamic>),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      projectId: json['projectId'] as String?,
      createdBy: json['createdBy'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$CoastalModelImplToJson(_$CoastalModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'modelType': _$ModelTypeEnumMap[instance.modelType]!,
      'status': _$ModelStatusEnumMap[instance.status]!,
      'studyArea': instance.studyArea,
      'configuration': instance.configuration,
      'tags': instance.tags,
      'projectId': instance.projectId,
      'createdBy': instance.createdBy,
      'metadata': instance.metadata,
    };

const _$ModelTypeEnumMap = {
  ModelType.wavePropagation: 'wave_propagation',
  ModelType.stormSurge: 'storm_surge',
  ModelType.sedimentTransport: 'sediment_transport',
  ModelType.coastalErosion: 'coastal_erosion',
  ModelType.combined: 'combined',
};

const _$ModelStatusEnumMap = {
  ModelStatus.draft: 'draft',
  ModelStatus.configured: 'configured',
  ModelStatus.running: 'running',
  ModelStatus.completed: 'completed',
  ModelStatus.failed: 'failed',
  ModelStatus.cancelled: 'cancelled',
};

_$StudyAreaImpl _$$StudyAreaImplFromJson(Map<String, dynamic> json) =>
    _$StudyAreaImpl(
      name: json['name'] as String,
      boundingBox:
          BoundingBox.fromJson(json['boundingBox'] as Map<String, dynamic>),
      description: json['description'] as String,
      coordinateSystem: json['coordinateSystem'] as String? ?? 'EPSG:4326',
      characteristicDepth: (json['characteristicDepth'] as num?)?.toDouble(),
      region: json['region'] as String?,
    );

Map<String, dynamic> _$$StudyAreaImplToJson(_$StudyAreaImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'boundingBox': instance.boundingBox,
      'description': instance.description,
      'coordinateSystem': instance.coordinateSystem,
      'characteristicDepth': instance.characteristicDepth,
      'region': instance.region,
    };

_$BoundingBoxImpl _$$BoundingBoxImplFromJson(Map<String, dynamic> json) =>
    _$BoundingBoxImpl(
      southWest:
          Coordinates.fromJson(json['southWest'] as Map<String, dynamic>),
      northEast:
          Coordinates.fromJson(json['northEast'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BoundingBoxImplToJson(_$BoundingBoxImpl instance) =>
    <String, dynamic>{
      'southWest': instance.southWest,
      'northEast': instance.northEast,
    };

_$ModelConfigurationImpl _$$ModelConfigurationImplFromJson(
        Map<String, dynamic> json) =>
    _$ModelConfigurationImpl(
      initialConditions: WaveParameters.fromJson(
          json['initialConditions'] as Map<String, dynamic>),
      gridConfig: GridConfiguration.fromJson(
          json['gridConfig'] as Map<String, dynamic>),
      timeConfig: TimeConfiguration.fromJson(
          json['timeConfig'] as Map<String, dynamic>),
      physicsConfig: json['physicsConfig'] == null
          ? null
          : PhysicsConfiguration.fromJson(
              json['physicsConfig'] as Map<String, dynamic>),
      boundaryConditions: json['boundaryConditions'] == null
          ? null
          : BoundaryConditions.fromJson(
              json['boundaryConditions'] as Map<String, dynamic>),
      outputConfig: json['outputConfig'] == null
          ? null
          : OutputConfiguration.fromJson(
              json['outputConfig'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ModelConfigurationImplToJson(
        _$ModelConfigurationImpl instance) =>
    <String, dynamic>{
      'initialConditions': instance.initialConditions,
      'gridConfig': instance.gridConfig,
      'timeConfig': instance.timeConfig,
      'physicsConfig': instance.physicsConfig,
      'boundaryConditions': instance.boundaryConditions,
      'outputConfig': instance.outputConfig,
    };

_$GridConfigurationImpl _$$GridConfigurationImplFromJson(
        Map<String, dynamic> json) =>
    _$GridConfigurationImpl(
      numberOfGridPointsX: (json['numberOfGridPointsX'] as num).toInt(),
      numberOfGridPointsY: (json['numberOfGridPointsY'] as num).toInt(),
      gridSpacingX: (json['gridSpacingX'] as num).toDouble(),
      gridSpacingY: (json['gridSpacingY'] as num).toDouble(),
      gridType: $enumDecodeNullable(_$GridTypeEnumMap, json['gridType']) ??
          GridType.cartesian,
      bathymetryFile: json['bathymetryFile'] as String?,
    );

Map<String, dynamic> _$$GridConfigurationImplToJson(
        _$GridConfigurationImpl instance) =>
    <String, dynamic>{
      'numberOfGridPointsX': instance.numberOfGridPointsX,
      'numberOfGridPointsY': instance.numberOfGridPointsY,
      'gridSpacingX': instance.gridSpacingX,
      'gridSpacingY': instance.gridSpacingY,
      'gridType': _$GridTypeEnumMap[instance.gridType]!,
      'bathymetryFile': instance.bathymetryFile,
    };

const _$GridTypeEnumMap = {
  GridType.cartesian: 'cartesian',
  GridType.curvilinear: 'curvilinear',
  GridType.unstructured: 'unstructured',
};

_$TimeConfigurationImpl _$$TimeConfigurationImplFromJson(
        Map<String, dynamic> json) =>
    _$TimeConfigurationImpl(
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      timeStep: Duration(microseconds: (json['timeStep'] as num).toInt()),
      outputInterval: json['outputInterval'] == null
          ? null
          : Duration(microseconds: (json['outputInterval'] as num).toInt()),
    );

Map<String, dynamic> _$$TimeConfigurationImplToJson(
        _$TimeConfigurationImpl instance) =>
    <String, dynamic>{
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'timeStep': instance.timeStep.inMicroseconds,
      'outputInterval': instance.outputInterval?.inMicroseconds,
    };

_$PhysicsConfigurationImpl _$$PhysicsConfigurationImplFromJson(
        Map<String, dynamic> json) =>
    _$PhysicsConfigurationImpl(
      includeWaveRefraction: json['includeWaveRefraction'] as bool? ?? true,
      includeWaveDiffraction: json['includeWaveDiffraction'] as bool? ?? true,
      includeWaveBreaking: json['includeWaveBreaking'] as bool? ?? true,
      includeWindGeneration: json['includeWindGeneration'] as bool? ?? false,
      includeSedimentTransport:
          json['includeSedimentTransport'] as bool? ?? false,
      bottomFriction: (json['bottomFriction'] as num?)?.toDouble() ?? 0.04,
      windDragCoefficient:
          (json['windDragCoefficient'] as num?)?.toDouble() ?? 1.0,
    );

Map<String, dynamic> _$$PhysicsConfigurationImplToJson(
        _$PhysicsConfigurationImpl instance) =>
    <String, dynamic>{
      'includeWaveRefraction': instance.includeWaveRefraction,
      'includeWaveDiffraction': instance.includeWaveDiffraction,
      'includeWaveBreaking': instance.includeWaveBreaking,
      'includeWindGeneration': instance.includeWindGeneration,
      'includeSedimentTransport': instance.includeSedimentTransport,
      'bottomFriction': instance.bottomFriction,
      'windDragCoefficient': instance.windDragCoefficient,
    };

_$BoundaryConditionsImpl _$$BoundaryConditionsImplFromJson(
        Map<String, dynamic> json) =>
    _$BoundaryConditionsImpl(
      westBoundary: $enumDecode(_$BoundaryTypeEnumMap, json['westBoundary']),
      eastBoundary: $enumDecode(_$BoundaryTypeEnumMap, json['eastBoundary']),
      northBoundary: $enumDecode(_$BoundaryTypeEnumMap, json['northBoundary']),
      southBoundary: $enumDecode(_$BoundaryTypeEnumMap, json['southBoundary']),
      deepWaterWaves: json['deepWaterWaves'] == null
          ? null
          : WaveParameters.fromJson(
              json['deepWaterWaves'] as Map<String, dynamic>),
      boundaryDataFile: json['boundaryDataFile'] as String?,
    );

Map<String, dynamic> _$$BoundaryConditionsImplToJson(
        _$BoundaryConditionsImpl instance) =>
    <String, dynamic>{
      'westBoundary': _$BoundaryTypeEnumMap[instance.westBoundary]!,
      'eastBoundary': _$BoundaryTypeEnumMap[instance.eastBoundary]!,
      'northBoundary': _$BoundaryTypeEnumMap[instance.northBoundary]!,
      'southBoundary': _$BoundaryTypeEnumMap[instance.southBoundary]!,
      'deepWaterWaves': instance.deepWaterWaves,
      'boundaryDataFile': instance.boundaryDataFile,
    };

const _$BoundaryTypeEnumMap = {
  BoundaryType.open: 'open',
  BoundaryType.closed: 'closed',
  BoundaryType.periodic: 'periodic',
  BoundaryType.radiation: 'radiation',
};

_$OutputConfigurationImpl _$$OutputConfigurationImplFromJson(
        Map<String, dynamic> json) =>
    _$OutputConfigurationImpl(
      outputVariables: (json['outputVariables'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const ['wave_height', 'wave_direction'],
      outputFormat:
          $enumDecodeNullable(_$OutputFormatEnumMap, json['outputFormat']) ??
              OutputFormat.netcdf,
      outputDirectory: json['outputDirectory'] as String? ?? 'model_output',
      saveWaveFields: json['saveWaveFields'] as bool? ?? true,
      saveTimeseriesAtPoints: json['saveTimeseriesAtPoints'] as bool? ?? true,
      outputPoints: (json['outputPoints'] as List<dynamic>?)
          ?.map((e) => Coordinates.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$OutputConfigurationImplToJson(
        _$OutputConfigurationImpl instance) =>
    <String, dynamic>{
      'outputVariables': instance.outputVariables,
      'outputFormat': _$OutputFormatEnumMap[instance.outputFormat]!,
      'outputDirectory': instance.outputDirectory,
      'saveWaveFields': instance.saveWaveFields,
      'saveTimeseriesAtPoints': instance.saveTimeseriesAtPoints,
      'outputPoints': instance.outputPoints,
    };

const _$OutputFormatEnumMap = {
  OutputFormat.netcdf: 'netcdf',
  OutputFormat.ascii: 'ascii',
  OutputFormat.binary: 'binary',
  OutputFormat.hdf5: 'hdf5',
};
