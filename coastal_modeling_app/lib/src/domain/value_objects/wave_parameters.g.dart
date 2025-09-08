// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wave_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WaveParametersImpl _$$WaveParametersImplFromJson(Map<String, dynamic> json) =>
    _$WaveParametersImpl(
      significantWaveHeight: (json['significantWaveHeight'] as num).toDouble(),
      peakPeriod: (json['peakPeriod'] as num).toDouble(),
      meanDirection: (json['meanDirection'] as num).toDouble(),
      directionalSpreading:
          (json['directionalSpreading'] as num?)?.toDouble() ?? 30.0,
      waterDepth: (json['waterDepth'] as num?)?.toDouble() ?? 10.0,
      energyDensity: (json['energyDensity'] as num?)?.toDouble(),
      steepness: (json['steepness'] as num?)?.toDouble(),
      isBreaking: json['isBreaking'] as bool? ?? false,
    );

Map<String, dynamic> _$$WaveParametersImplToJson(
        _$WaveParametersImpl instance) =>
    <String, dynamic>{
      'significantWaveHeight': instance.significantWaveHeight,
      'peakPeriod': instance.peakPeriod,
      'meanDirection': instance.meanDirection,
      'directionalSpreading': instance.directionalSpreading,
      'waterDepth': instance.waterDepth,
      'energyDensity': instance.energyDensity,
      'steepness': instance.steepness,
      'isBreaking': instance.isBreaking,
    };
