// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wave_parameters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WaveParameters _$WaveParametersFromJson(Map<String, dynamic> json) {
  return _WaveParameters.fromJson(json);
}

/// @nodoc
mixin _$WaveParameters {
  /// Significant wave height in meters
  double get significantWaveHeight => throw _privateConstructorUsedError;

  /// Peak wave period in seconds
  double get peakPeriod => throw _privateConstructorUsedError;

  /// Mean wave direction in degrees (0-360, where 0 = North)
  double get meanDirection => throw _privateConstructorUsedError;

  /// Directional spreading coefficient
  double get directionalSpreading => throw _privateConstructorUsedError;

  /// Water depth at the location in meters (positive for depth below surface)
  double get waterDepth => throw _privateConstructorUsedError;

  /// Wave energy density in J/m²
  double? get energyDensity => throw _privateConstructorUsedError;

  /// Wave steepness (H/L ratio)
  double? get steepness => throw _privateConstructorUsedError;

  /// Breaking wave indicator
  bool get isBreaking => throw _privateConstructorUsedError;

  /// Serializes this WaveParameters to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WaveParameters
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WaveParametersCopyWith<WaveParameters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WaveParametersCopyWith<$Res> {
  factory $WaveParametersCopyWith(
          WaveParameters value, $Res Function(WaveParameters) then) =
      _$WaveParametersCopyWithImpl<$Res, WaveParameters>;
  @useResult
  $Res call(
      {double significantWaveHeight,
      double peakPeriod,
      double meanDirection,
      double directionalSpreading,
      double waterDepth,
      double? energyDensity,
      double? steepness,
      bool isBreaking});
}

/// @nodoc
class _$WaveParametersCopyWithImpl<$Res, $Val extends WaveParameters>
    implements $WaveParametersCopyWith<$Res> {
  _$WaveParametersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WaveParameters
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? significantWaveHeight = null,
    Object? peakPeriod = null,
    Object? meanDirection = null,
    Object? directionalSpreading = null,
    Object? waterDepth = null,
    Object? energyDensity = freezed,
    Object? steepness = freezed,
    Object? isBreaking = null,
  }) {
    return _then(_value.copyWith(
      significantWaveHeight: null == significantWaveHeight
          ? _value.significantWaveHeight
          : significantWaveHeight // ignore: cast_nullable_to_non_nullable
              as double,
      peakPeriod: null == peakPeriod
          ? _value.peakPeriod
          : peakPeriod // ignore: cast_nullable_to_non_nullable
              as double,
      meanDirection: null == meanDirection
          ? _value.meanDirection
          : meanDirection // ignore: cast_nullable_to_non_nullable
              as double,
      directionalSpreading: null == directionalSpreading
          ? _value.directionalSpreading
          : directionalSpreading // ignore: cast_nullable_to_non_nullable
              as double,
      waterDepth: null == waterDepth
          ? _value.waterDepth
          : waterDepth // ignore: cast_nullable_to_non_nullable
              as double,
      energyDensity: freezed == energyDensity
          ? _value.energyDensity
          : energyDensity // ignore: cast_nullable_to_non_nullable
              as double?,
      steepness: freezed == steepness
          ? _value.steepness
          : steepness // ignore: cast_nullable_to_non_nullable
              as double?,
      isBreaking: null == isBreaking
          ? _value.isBreaking
          : isBreaking // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WaveParametersImplCopyWith<$Res>
    implements $WaveParametersCopyWith<$Res> {
  factory _$$WaveParametersImplCopyWith(_$WaveParametersImpl value,
          $Res Function(_$WaveParametersImpl) then) =
      __$$WaveParametersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double significantWaveHeight,
      double peakPeriod,
      double meanDirection,
      double directionalSpreading,
      double waterDepth,
      double? energyDensity,
      double? steepness,
      bool isBreaking});
}

/// @nodoc
class __$$WaveParametersImplCopyWithImpl<$Res>
    extends _$WaveParametersCopyWithImpl<$Res, _$WaveParametersImpl>
    implements _$$WaveParametersImplCopyWith<$Res> {
  __$$WaveParametersImplCopyWithImpl(
      _$WaveParametersImpl _value, $Res Function(_$WaveParametersImpl) _then)
      : super(_value, _then);

  /// Create a copy of WaveParameters
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? significantWaveHeight = null,
    Object? peakPeriod = null,
    Object? meanDirection = null,
    Object? directionalSpreading = null,
    Object? waterDepth = null,
    Object? energyDensity = freezed,
    Object? steepness = freezed,
    Object? isBreaking = null,
  }) {
    return _then(_$WaveParametersImpl(
      significantWaveHeight: null == significantWaveHeight
          ? _value.significantWaveHeight
          : significantWaveHeight // ignore: cast_nullable_to_non_nullable
              as double,
      peakPeriod: null == peakPeriod
          ? _value.peakPeriod
          : peakPeriod // ignore: cast_nullable_to_non_nullable
              as double,
      meanDirection: null == meanDirection
          ? _value.meanDirection
          : meanDirection // ignore: cast_nullable_to_non_nullable
              as double,
      directionalSpreading: null == directionalSpreading
          ? _value.directionalSpreading
          : directionalSpreading // ignore: cast_nullable_to_non_nullable
              as double,
      waterDepth: null == waterDepth
          ? _value.waterDepth
          : waterDepth // ignore: cast_nullable_to_non_nullable
              as double,
      energyDensity: freezed == energyDensity
          ? _value.energyDensity
          : energyDensity // ignore: cast_nullable_to_non_nullable
              as double?,
      steepness: freezed == steepness
          ? _value.steepness
          : steepness // ignore: cast_nullable_to_non_nullable
              as double?,
      isBreaking: null == isBreaking
          ? _value.isBreaking
          : isBreaking // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WaveParametersImpl implements _WaveParameters {
  const _$WaveParametersImpl(
      {required this.significantWaveHeight,
      required this.peakPeriod,
      required this.meanDirection,
      this.directionalSpreading = 30.0,
      this.waterDepth = 10.0,
      this.energyDensity,
      this.steepness,
      this.isBreaking = false});

  factory _$WaveParametersImpl.fromJson(Map<String, dynamic> json) =>
      _$$WaveParametersImplFromJson(json);

  /// Significant wave height in meters
  @override
  final double significantWaveHeight;

  /// Peak wave period in seconds
  @override
  final double peakPeriod;

  /// Mean wave direction in degrees (0-360, where 0 = North)
  @override
  final double meanDirection;

  /// Directional spreading coefficient
  @override
  @JsonKey()
  final double directionalSpreading;

  /// Water depth at the location in meters (positive for depth below surface)
  @override
  @JsonKey()
  final double waterDepth;

  /// Wave energy density in J/m²
  @override
  final double? energyDensity;

  /// Wave steepness (H/L ratio)
  @override
  final double? steepness;

  /// Breaking wave indicator
  @override
  @JsonKey()
  final bool isBreaking;

  @override
  String toString() {
    return 'WaveParameters(significantWaveHeight: $significantWaveHeight, peakPeriod: $peakPeriod, meanDirection: $meanDirection, directionalSpreading: $directionalSpreading, waterDepth: $waterDepth, energyDensity: $energyDensity, steepness: $steepness, isBreaking: $isBreaking)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WaveParametersImpl &&
            (identical(other.significantWaveHeight, significantWaveHeight) ||
                other.significantWaveHeight == significantWaveHeight) &&
            (identical(other.peakPeriod, peakPeriod) ||
                other.peakPeriod == peakPeriod) &&
            (identical(other.meanDirection, meanDirection) ||
                other.meanDirection == meanDirection) &&
            (identical(other.directionalSpreading, directionalSpreading) ||
                other.directionalSpreading == directionalSpreading) &&
            (identical(other.waterDepth, waterDepth) ||
                other.waterDepth == waterDepth) &&
            (identical(other.energyDensity, energyDensity) ||
                other.energyDensity == energyDensity) &&
            (identical(other.steepness, steepness) ||
                other.steepness == steepness) &&
            (identical(other.isBreaking, isBreaking) ||
                other.isBreaking == isBreaking));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      significantWaveHeight,
      peakPeriod,
      meanDirection,
      directionalSpreading,
      waterDepth,
      energyDensity,
      steepness,
      isBreaking);

  /// Create a copy of WaveParameters
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WaveParametersImplCopyWith<_$WaveParametersImpl> get copyWith =>
      __$$WaveParametersImplCopyWithImpl<_$WaveParametersImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WaveParametersImplToJson(
      this,
    );
  }
}

abstract class _WaveParameters implements WaveParameters {
  const factory _WaveParameters(
      {required final double significantWaveHeight,
      required final double peakPeriod,
      required final double meanDirection,
      final double directionalSpreading,
      final double waterDepth,
      final double? energyDensity,
      final double? steepness,
      final bool isBreaking}) = _$WaveParametersImpl;

  factory _WaveParameters.fromJson(Map<String, dynamic> json) =
      _$WaveParametersImpl.fromJson;

  /// Significant wave height in meters
  @override
  double get significantWaveHeight;

  /// Peak wave period in seconds
  @override
  double get peakPeriod;

  /// Mean wave direction in degrees (0-360, where 0 = North)
  @override
  double get meanDirection;

  /// Directional spreading coefficient
  @override
  double get directionalSpreading;

  /// Water depth at the location in meters (positive for depth below surface)
  @override
  double get waterDepth;

  /// Wave energy density in J/m²
  @override
  double? get energyDensity;

  /// Wave steepness (H/L ratio)
  @override
  double? get steepness;

  /// Breaking wave indicator
  @override
  bool get isBreaking;

  /// Create a copy of WaveParameters
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WaveParametersImplCopyWith<_$WaveParametersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
