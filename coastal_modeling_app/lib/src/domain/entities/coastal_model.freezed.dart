// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coastal_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CoastalModel _$CoastalModelFromJson(Map<String, dynamic> json) {
  return _CoastalModel.fromJson(json);
}

/// @nodoc
mixin _$CoastalModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  ModelType get modelType => throw _privateConstructorUsedError;
  ModelStatus get status => throw _privateConstructorUsedError;
  StudyArea get studyArea => throw _privateConstructorUsedError;
  ModelConfiguration get configuration => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;
  String? get projectId => throw _privateConstructorUsedError;
  String? get createdBy => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  /// Serializes this CoastalModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CoastalModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CoastalModelCopyWith<CoastalModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoastalModelCopyWith<$Res> {
  factory $CoastalModelCopyWith(
          CoastalModel value, $Res Function(CoastalModel) then) =
      _$CoastalModelCopyWithImpl<$Res, CoastalModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      DateTime createdAt,
      DateTime updatedAt,
      ModelType modelType,
      ModelStatus status,
      StudyArea studyArea,
      ModelConfiguration configuration,
      List<String>? tags,
      String? projectId,
      String? createdBy,
      Map<String, dynamic>? metadata});

  $StudyAreaCopyWith<$Res> get studyArea;
  $ModelConfigurationCopyWith<$Res> get configuration;
}

/// @nodoc
class _$CoastalModelCopyWithImpl<$Res, $Val extends CoastalModel>
    implements $CoastalModelCopyWith<$Res> {
  _$CoastalModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CoastalModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? modelType = null,
    Object? status = null,
    Object? studyArea = null,
    Object? configuration = null,
    Object? tags = freezed,
    Object? projectId = freezed,
    Object? createdBy = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      modelType: null == modelType
          ? _value.modelType
          : modelType // ignore: cast_nullable_to_non_nullable
              as ModelType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ModelStatus,
      studyArea: null == studyArea
          ? _value.studyArea
          : studyArea // ignore: cast_nullable_to_non_nullable
              as StudyArea,
      configuration: null == configuration
          ? _value.configuration
          : configuration // ignore: cast_nullable_to_non_nullable
              as ModelConfiguration,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }

  /// Create a copy of CoastalModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StudyAreaCopyWith<$Res> get studyArea {
    return $StudyAreaCopyWith<$Res>(_value.studyArea, (value) {
      return _then(_value.copyWith(studyArea: value) as $Val);
    });
  }

  /// Create a copy of CoastalModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ModelConfigurationCopyWith<$Res> get configuration {
    return $ModelConfigurationCopyWith<$Res>(_value.configuration, (value) {
      return _then(_value.copyWith(configuration: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CoastalModelImplCopyWith<$Res>
    implements $CoastalModelCopyWith<$Res> {
  factory _$$CoastalModelImplCopyWith(
          _$CoastalModelImpl value, $Res Function(_$CoastalModelImpl) then) =
      __$$CoastalModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      DateTime createdAt,
      DateTime updatedAt,
      ModelType modelType,
      ModelStatus status,
      StudyArea studyArea,
      ModelConfiguration configuration,
      List<String>? tags,
      String? projectId,
      String? createdBy,
      Map<String, dynamic>? metadata});

  @override
  $StudyAreaCopyWith<$Res> get studyArea;
  @override
  $ModelConfigurationCopyWith<$Res> get configuration;
}

/// @nodoc
class __$$CoastalModelImplCopyWithImpl<$Res>
    extends _$CoastalModelCopyWithImpl<$Res, _$CoastalModelImpl>
    implements _$$CoastalModelImplCopyWith<$Res> {
  __$$CoastalModelImplCopyWithImpl(
      _$CoastalModelImpl _value, $Res Function(_$CoastalModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CoastalModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? modelType = null,
    Object? status = null,
    Object? studyArea = null,
    Object? configuration = null,
    Object? tags = freezed,
    Object? projectId = freezed,
    Object? createdBy = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_$CoastalModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      modelType: null == modelType
          ? _value.modelType
          : modelType // ignore: cast_nullable_to_non_nullable
              as ModelType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ModelStatus,
      studyArea: null == studyArea
          ? _value.studyArea
          : studyArea // ignore: cast_nullable_to_non_nullable
              as StudyArea,
      configuration: null == configuration
          ? _value.configuration
          : configuration // ignore: cast_nullable_to_non_nullable
              as ModelConfiguration,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CoastalModelImpl implements _CoastalModel {
  const _$CoastalModelImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.createdAt,
      required this.updatedAt,
      required this.modelType,
      required this.status,
      required this.studyArea,
      required this.configuration,
      final List<String>? tags,
      this.projectId,
      this.createdBy,
      final Map<String, dynamic>? metadata})
      : _tags = tags,
        _metadata = metadata;

  factory _$CoastalModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoastalModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final ModelType modelType;
  @override
  final ModelStatus status;
  @override
  final StudyArea studyArea;
  @override
  final ModelConfiguration configuration;
  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? projectId;
  @override
  final String? createdBy;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'CoastalModel(id: $id, name: $name, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, modelType: $modelType, status: $status, studyArea: $studyArea, configuration: $configuration, tags: $tags, projectId: $projectId, createdBy: $createdBy, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoastalModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.modelType, modelType) ||
                other.modelType == modelType) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.studyArea, studyArea) ||
                other.studyArea == studyArea) &&
            (identical(other.configuration, configuration) ||
                other.configuration == configuration) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      createdAt,
      updatedAt,
      modelType,
      status,
      studyArea,
      configuration,
      const DeepCollectionEquality().hash(_tags),
      projectId,
      createdBy,
      const DeepCollectionEquality().hash(_metadata));

  /// Create a copy of CoastalModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoastalModelImplCopyWith<_$CoastalModelImpl> get copyWith =>
      __$$CoastalModelImplCopyWithImpl<_$CoastalModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoastalModelImplToJson(
      this,
    );
  }
}

abstract class _CoastalModel implements CoastalModel {
  const factory _CoastalModel(
      {required final String id,
      required final String name,
      required final String description,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final ModelType modelType,
      required final ModelStatus status,
      required final StudyArea studyArea,
      required final ModelConfiguration configuration,
      final List<String>? tags,
      final String? projectId,
      final String? createdBy,
      final Map<String, dynamic>? metadata}) = _$CoastalModelImpl;

  factory _CoastalModel.fromJson(Map<String, dynamic> json) =
      _$CoastalModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  ModelType get modelType;
  @override
  ModelStatus get status;
  @override
  StudyArea get studyArea;
  @override
  ModelConfiguration get configuration;
  @override
  List<String>? get tags;
  @override
  String? get projectId;
  @override
  String? get createdBy;
  @override
  Map<String, dynamic>? get metadata;

  /// Create a copy of CoastalModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoastalModelImplCopyWith<_$CoastalModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StudyArea _$StudyAreaFromJson(Map<String, dynamic> json) {
  return _StudyArea.fromJson(json);
}

/// @nodoc
mixin _$StudyArea {
  String get name => throw _privateConstructorUsedError;
  BoundingBox get boundingBox => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get coordinateSystem => throw _privateConstructorUsedError;
  double? get characteristicDepth => throw _privateConstructorUsedError;
  String? get region => throw _privateConstructorUsedError;

  /// Serializes this StudyArea to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StudyArea
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StudyAreaCopyWith<StudyArea> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudyAreaCopyWith<$Res> {
  factory $StudyAreaCopyWith(StudyArea value, $Res Function(StudyArea) then) =
      _$StudyAreaCopyWithImpl<$Res, StudyArea>;
  @useResult
  $Res call(
      {String name,
      BoundingBox boundingBox,
      String description,
      String coordinateSystem,
      double? characteristicDepth,
      String? region});

  $BoundingBoxCopyWith<$Res> get boundingBox;
}

/// @nodoc
class _$StudyAreaCopyWithImpl<$Res, $Val extends StudyArea>
    implements $StudyAreaCopyWith<$Res> {
  _$StudyAreaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StudyArea
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? boundingBox = null,
    Object? description = null,
    Object? coordinateSystem = null,
    Object? characteristicDepth = freezed,
    Object? region = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      boundingBox: null == boundingBox
          ? _value.boundingBox
          : boundingBox // ignore: cast_nullable_to_non_nullable
              as BoundingBox,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      coordinateSystem: null == coordinateSystem
          ? _value.coordinateSystem
          : coordinateSystem // ignore: cast_nullable_to_non_nullable
              as String,
      characteristicDepth: freezed == characteristicDepth
          ? _value.characteristicDepth
          : characteristicDepth // ignore: cast_nullable_to_non_nullable
              as double?,
      region: freezed == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of StudyArea
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BoundingBoxCopyWith<$Res> get boundingBox {
    return $BoundingBoxCopyWith<$Res>(_value.boundingBox, (value) {
      return _then(_value.copyWith(boundingBox: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StudyAreaImplCopyWith<$Res>
    implements $StudyAreaCopyWith<$Res> {
  factory _$$StudyAreaImplCopyWith(
          _$StudyAreaImpl value, $Res Function(_$StudyAreaImpl) then) =
      __$$StudyAreaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      BoundingBox boundingBox,
      String description,
      String coordinateSystem,
      double? characteristicDepth,
      String? region});

  @override
  $BoundingBoxCopyWith<$Res> get boundingBox;
}

/// @nodoc
class __$$StudyAreaImplCopyWithImpl<$Res>
    extends _$StudyAreaCopyWithImpl<$Res, _$StudyAreaImpl>
    implements _$$StudyAreaImplCopyWith<$Res> {
  __$$StudyAreaImplCopyWithImpl(
      _$StudyAreaImpl _value, $Res Function(_$StudyAreaImpl) _then)
      : super(_value, _then);

  /// Create a copy of StudyArea
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? boundingBox = null,
    Object? description = null,
    Object? coordinateSystem = null,
    Object? characteristicDepth = freezed,
    Object? region = freezed,
  }) {
    return _then(_$StudyAreaImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      boundingBox: null == boundingBox
          ? _value.boundingBox
          : boundingBox // ignore: cast_nullable_to_non_nullable
              as BoundingBox,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      coordinateSystem: null == coordinateSystem
          ? _value.coordinateSystem
          : coordinateSystem // ignore: cast_nullable_to_non_nullable
              as String,
      characteristicDepth: freezed == characteristicDepth
          ? _value.characteristicDepth
          : characteristicDepth // ignore: cast_nullable_to_non_nullable
              as double?,
      region: freezed == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StudyAreaImpl implements _StudyArea {
  const _$StudyAreaImpl(
      {required this.name,
      required this.boundingBox,
      required this.description,
      this.coordinateSystem = 'EPSG:4326',
      this.characteristicDepth,
      this.region});

  factory _$StudyAreaImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudyAreaImplFromJson(json);

  @override
  final String name;
  @override
  final BoundingBox boundingBox;
  @override
  final String description;
  @override
  @JsonKey()
  final String coordinateSystem;
  @override
  final double? characteristicDepth;
  @override
  final String? region;

  @override
  String toString() {
    return 'StudyArea(name: $name, boundingBox: $boundingBox, description: $description, coordinateSystem: $coordinateSystem, characteristicDepth: $characteristicDepth, region: $region)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudyAreaImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.boundingBox, boundingBox) ||
                other.boundingBox == boundingBox) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.coordinateSystem, coordinateSystem) ||
                other.coordinateSystem == coordinateSystem) &&
            (identical(other.characteristicDepth, characteristicDepth) ||
                other.characteristicDepth == characteristicDepth) &&
            (identical(other.region, region) || other.region == region));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, boundingBox, description,
      coordinateSystem, characteristicDepth, region);

  /// Create a copy of StudyArea
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudyAreaImplCopyWith<_$StudyAreaImpl> get copyWith =>
      __$$StudyAreaImplCopyWithImpl<_$StudyAreaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudyAreaImplToJson(
      this,
    );
  }
}

abstract class _StudyArea implements StudyArea {
  const factory _StudyArea(
      {required final String name,
      required final BoundingBox boundingBox,
      required final String description,
      final String coordinateSystem,
      final double? characteristicDepth,
      final String? region}) = _$StudyAreaImpl;

  factory _StudyArea.fromJson(Map<String, dynamic> json) =
      _$StudyAreaImpl.fromJson;

  @override
  String get name;
  @override
  BoundingBox get boundingBox;
  @override
  String get description;
  @override
  String get coordinateSystem;
  @override
  double? get characteristicDepth;
  @override
  String? get region;

  /// Create a copy of StudyArea
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudyAreaImplCopyWith<_$StudyAreaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BoundingBox _$BoundingBoxFromJson(Map<String, dynamic> json) {
  return _BoundingBox.fromJson(json);
}

/// @nodoc
mixin _$BoundingBox {
  Coordinates get southWest => throw _privateConstructorUsedError;
  Coordinates get northEast => throw _privateConstructorUsedError;

  /// Serializes this BoundingBox to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BoundingBox
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BoundingBoxCopyWith<BoundingBox> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoundingBoxCopyWith<$Res> {
  factory $BoundingBoxCopyWith(
          BoundingBox value, $Res Function(BoundingBox) then) =
      _$BoundingBoxCopyWithImpl<$Res, BoundingBox>;
  @useResult
  $Res call({Coordinates southWest, Coordinates northEast});

  $CoordinatesCopyWith<$Res> get southWest;
  $CoordinatesCopyWith<$Res> get northEast;
}

/// @nodoc
class _$BoundingBoxCopyWithImpl<$Res, $Val extends BoundingBox>
    implements $BoundingBoxCopyWith<$Res> {
  _$BoundingBoxCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BoundingBox
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? southWest = null,
    Object? northEast = null,
  }) {
    return _then(_value.copyWith(
      southWest: null == southWest
          ? _value.southWest
          : southWest // ignore: cast_nullable_to_non_nullable
              as Coordinates,
      northEast: null == northEast
          ? _value.northEast
          : northEast // ignore: cast_nullable_to_non_nullable
              as Coordinates,
    ) as $Val);
  }

  /// Create a copy of BoundingBox
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CoordinatesCopyWith<$Res> get southWest {
    return $CoordinatesCopyWith<$Res>(_value.southWest, (value) {
      return _then(_value.copyWith(southWest: value) as $Val);
    });
  }

  /// Create a copy of BoundingBox
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CoordinatesCopyWith<$Res> get northEast {
    return $CoordinatesCopyWith<$Res>(_value.northEast, (value) {
      return _then(_value.copyWith(northEast: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BoundingBoxImplCopyWith<$Res>
    implements $BoundingBoxCopyWith<$Res> {
  factory _$$BoundingBoxImplCopyWith(
          _$BoundingBoxImpl value, $Res Function(_$BoundingBoxImpl) then) =
      __$$BoundingBoxImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Coordinates southWest, Coordinates northEast});

  @override
  $CoordinatesCopyWith<$Res> get southWest;
  @override
  $CoordinatesCopyWith<$Res> get northEast;
}

/// @nodoc
class __$$BoundingBoxImplCopyWithImpl<$Res>
    extends _$BoundingBoxCopyWithImpl<$Res, _$BoundingBoxImpl>
    implements _$$BoundingBoxImplCopyWith<$Res> {
  __$$BoundingBoxImplCopyWithImpl(
      _$BoundingBoxImpl _value, $Res Function(_$BoundingBoxImpl) _then)
      : super(_value, _then);

  /// Create a copy of BoundingBox
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? southWest = null,
    Object? northEast = null,
  }) {
    return _then(_$BoundingBoxImpl(
      southWest: null == southWest
          ? _value.southWest
          : southWest // ignore: cast_nullable_to_non_nullable
              as Coordinates,
      northEast: null == northEast
          ? _value.northEast
          : northEast // ignore: cast_nullable_to_non_nullable
              as Coordinates,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BoundingBoxImpl implements _BoundingBox {
  const _$BoundingBoxImpl({required this.southWest, required this.northEast});

  factory _$BoundingBoxImpl.fromJson(Map<String, dynamic> json) =>
      _$$BoundingBoxImplFromJson(json);

  @override
  final Coordinates southWest;
  @override
  final Coordinates northEast;

  @override
  String toString() {
    return 'BoundingBox(southWest: $southWest, northEast: $northEast)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoundingBoxImpl &&
            (identical(other.southWest, southWest) ||
                other.southWest == southWest) &&
            (identical(other.northEast, northEast) ||
                other.northEast == northEast));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, southWest, northEast);

  /// Create a copy of BoundingBox
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BoundingBoxImplCopyWith<_$BoundingBoxImpl> get copyWith =>
      __$$BoundingBoxImplCopyWithImpl<_$BoundingBoxImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BoundingBoxImplToJson(
      this,
    );
  }
}

abstract class _BoundingBox implements BoundingBox {
  const factory _BoundingBox(
      {required final Coordinates southWest,
      required final Coordinates northEast}) = _$BoundingBoxImpl;

  factory _BoundingBox.fromJson(Map<String, dynamic> json) =
      _$BoundingBoxImpl.fromJson;

  @override
  Coordinates get southWest;
  @override
  Coordinates get northEast;

  /// Create a copy of BoundingBox
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BoundingBoxImplCopyWith<_$BoundingBoxImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ModelConfiguration _$ModelConfigurationFromJson(Map<String, dynamic> json) {
  return _ModelConfiguration.fromJson(json);
}

/// @nodoc
mixin _$ModelConfiguration {
  WaveParameters get initialConditions => throw _privateConstructorUsedError;
  GridConfiguration get gridConfig => throw _privateConstructorUsedError;
  TimeConfiguration get timeConfig => throw _privateConstructorUsedError;
  PhysicsConfiguration? get physicsConfig => throw _privateConstructorUsedError;
  BoundaryConditions? get boundaryConditions =>
      throw _privateConstructorUsedError;
  OutputConfiguration? get outputConfig => throw _privateConstructorUsedError;

  /// Serializes this ModelConfiguration to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ModelConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ModelConfigurationCopyWith<ModelConfiguration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModelConfigurationCopyWith<$Res> {
  factory $ModelConfigurationCopyWith(
          ModelConfiguration value, $Res Function(ModelConfiguration) then) =
      _$ModelConfigurationCopyWithImpl<$Res, ModelConfiguration>;
  @useResult
  $Res call(
      {WaveParameters initialConditions,
      GridConfiguration gridConfig,
      TimeConfiguration timeConfig,
      PhysicsConfiguration? physicsConfig,
      BoundaryConditions? boundaryConditions,
      OutputConfiguration? outputConfig});

  $WaveParametersCopyWith<$Res> get initialConditions;
  $GridConfigurationCopyWith<$Res> get gridConfig;
  $TimeConfigurationCopyWith<$Res> get timeConfig;
  $PhysicsConfigurationCopyWith<$Res>? get physicsConfig;
  $BoundaryConditionsCopyWith<$Res>? get boundaryConditions;
  $OutputConfigurationCopyWith<$Res>? get outputConfig;
}

/// @nodoc
class _$ModelConfigurationCopyWithImpl<$Res, $Val extends ModelConfiguration>
    implements $ModelConfigurationCopyWith<$Res> {
  _$ModelConfigurationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ModelConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialConditions = null,
    Object? gridConfig = null,
    Object? timeConfig = null,
    Object? physicsConfig = freezed,
    Object? boundaryConditions = freezed,
    Object? outputConfig = freezed,
  }) {
    return _then(_value.copyWith(
      initialConditions: null == initialConditions
          ? _value.initialConditions
          : initialConditions // ignore: cast_nullable_to_non_nullable
              as WaveParameters,
      gridConfig: null == gridConfig
          ? _value.gridConfig
          : gridConfig // ignore: cast_nullable_to_non_nullable
              as GridConfiguration,
      timeConfig: null == timeConfig
          ? _value.timeConfig
          : timeConfig // ignore: cast_nullable_to_non_nullable
              as TimeConfiguration,
      physicsConfig: freezed == physicsConfig
          ? _value.physicsConfig
          : physicsConfig // ignore: cast_nullable_to_non_nullable
              as PhysicsConfiguration?,
      boundaryConditions: freezed == boundaryConditions
          ? _value.boundaryConditions
          : boundaryConditions // ignore: cast_nullable_to_non_nullable
              as BoundaryConditions?,
      outputConfig: freezed == outputConfig
          ? _value.outputConfig
          : outputConfig // ignore: cast_nullable_to_non_nullable
              as OutputConfiguration?,
    ) as $Val);
  }

  /// Create a copy of ModelConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WaveParametersCopyWith<$Res> get initialConditions {
    return $WaveParametersCopyWith<$Res>(_value.initialConditions, (value) {
      return _then(_value.copyWith(initialConditions: value) as $Val);
    });
  }

  /// Create a copy of ModelConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GridConfigurationCopyWith<$Res> get gridConfig {
    return $GridConfigurationCopyWith<$Res>(_value.gridConfig, (value) {
      return _then(_value.copyWith(gridConfig: value) as $Val);
    });
  }

  /// Create a copy of ModelConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TimeConfigurationCopyWith<$Res> get timeConfig {
    return $TimeConfigurationCopyWith<$Res>(_value.timeConfig, (value) {
      return _then(_value.copyWith(timeConfig: value) as $Val);
    });
  }

  /// Create a copy of ModelConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PhysicsConfigurationCopyWith<$Res>? get physicsConfig {
    if (_value.physicsConfig == null) {
      return null;
    }

    return $PhysicsConfigurationCopyWith<$Res>(_value.physicsConfig!, (value) {
      return _then(_value.copyWith(physicsConfig: value) as $Val);
    });
  }

  /// Create a copy of ModelConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BoundaryConditionsCopyWith<$Res>? get boundaryConditions {
    if (_value.boundaryConditions == null) {
      return null;
    }

    return $BoundaryConditionsCopyWith<$Res>(_value.boundaryConditions!,
        (value) {
      return _then(_value.copyWith(boundaryConditions: value) as $Val);
    });
  }

  /// Create a copy of ModelConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OutputConfigurationCopyWith<$Res>? get outputConfig {
    if (_value.outputConfig == null) {
      return null;
    }

    return $OutputConfigurationCopyWith<$Res>(_value.outputConfig!, (value) {
      return _then(_value.copyWith(outputConfig: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ModelConfigurationImplCopyWith<$Res>
    implements $ModelConfigurationCopyWith<$Res> {
  factory _$$ModelConfigurationImplCopyWith(_$ModelConfigurationImpl value,
          $Res Function(_$ModelConfigurationImpl) then) =
      __$$ModelConfigurationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {WaveParameters initialConditions,
      GridConfiguration gridConfig,
      TimeConfiguration timeConfig,
      PhysicsConfiguration? physicsConfig,
      BoundaryConditions? boundaryConditions,
      OutputConfiguration? outputConfig});

  @override
  $WaveParametersCopyWith<$Res> get initialConditions;
  @override
  $GridConfigurationCopyWith<$Res> get gridConfig;
  @override
  $TimeConfigurationCopyWith<$Res> get timeConfig;
  @override
  $PhysicsConfigurationCopyWith<$Res>? get physicsConfig;
  @override
  $BoundaryConditionsCopyWith<$Res>? get boundaryConditions;
  @override
  $OutputConfigurationCopyWith<$Res>? get outputConfig;
}

/// @nodoc
class __$$ModelConfigurationImplCopyWithImpl<$Res>
    extends _$ModelConfigurationCopyWithImpl<$Res, _$ModelConfigurationImpl>
    implements _$$ModelConfigurationImplCopyWith<$Res> {
  __$$ModelConfigurationImplCopyWithImpl(_$ModelConfigurationImpl _value,
      $Res Function(_$ModelConfigurationImpl) _then)
      : super(_value, _then);

  /// Create a copy of ModelConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialConditions = null,
    Object? gridConfig = null,
    Object? timeConfig = null,
    Object? physicsConfig = freezed,
    Object? boundaryConditions = freezed,
    Object? outputConfig = freezed,
  }) {
    return _then(_$ModelConfigurationImpl(
      initialConditions: null == initialConditions
          ? _value.initialConditions
          : initialConditions // ignore: cast_nullable_to_non_nullable
              as WaveParameters,
      gridConfig: null == gridConfig
          ? _value.gridConfig
          : gridConfig // ignore: cast_nullable_to_non_nullable
              as GridConfiguration,
      timeConfig: null == timeConfig
          ? _value.timeConfig
          : timeConfig // ignore: cast_nullable_to_non_nullable
              as TimeConfiguration,
      physicsConfig: freezed == physicsConfig
          ? _value.physicsConfig
          : physicsConfig // ignore: cast_nullable_to_non_nullable
              as PhysicsConfiguration?,
      boundaryConditions: freezed == boundaryConditions
          ? _value.boundaryConditions
          : boundaryConditions // ignore: cast_nullable_to_non_nullable
              as BoundaryConditions?,
      outputConfig: freezed == outputConfig
          ? _value.outputConfig
          : outputConfig // ignore: cast_nullable_to_non_nullable
              as OutputConfiguration?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ModelConfigurationImpl implements _ModelConfiguration {
  const _$ModelConfigurationImpl(
      {required this.initialConditions,
      required this.gridConfig,
      required this.timeConfig,
      this.physicsConfig,
      this.boundaryConditions,
      this.outputConfig});

  factory _$ModelConfigurationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ModelConfigurationImplFromJson(json);

  @override
  final WaveParameters initialConditions;
  @override
  final GridConfiguration gridConfig;
  @override
  final TimeConfiguration timeConfig;
  @override
  final PhysicsConfiguration? physicsConfig;
  @override
  final BoundaryConditions? boundaryConditions;
  @override
  final OutputConfiguration? outputConfig;

  @override
  String toString() {
    return 'ModelConfiguration(initialConditions: $initialConditions, gridConfig: $gridConfig, timeConfig: $timeConfig, physicsConfig: $physicsConfig, boundaryConditions: $boundaryConditions, outputConfig: $outputConfig)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModelConfigurationImpl &&
            (identical(other.initialConditions, initialConditions) ||
                other.initialConditions == initialConditions) &&
            (identical(other.gridConfig, gridConfig) ||
                other.gridConfig == gridConfig) &&
            (identical(other.timeConfig, timeConfig) ||
                other.timeConfig == timeConfig) &&
            (identical(other.physicsConfig, physicsConfig) ||
                other.physicsConfig == physicsConfig) &&
            (identical(other.boundaryConditions, boundaryConditions) ||
                other.boundaryConditions == boundaryConditions) &&
            (identical(other.outputConfig, outputConfig) ||
                other.outputConfig == outputConfig));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, initialConditions, gridConfig,
      timeConfig, physicsConfig, boundaryConditions, outputConfig);

  /// Create a copy of ModelConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ModelConfigurationImplCopyWith<_$ModelConfigurationImpl> get copyWith =>
      __$$ModelConfigurationImplCopyWithImpl<_$ModelConfigurationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ModelConfigurationImplToJson(
      this,
    );
  }
}

abstract class _ModelConfiguration implements ModelConfiguration {
  const factory _ModelConfiguration(
      {required final WaveParameters initialConditions,
      required final GridConfiguration gridConfig,
      required final TimeConfiguration timeConfig,
      final PhysicsConfiguration? physicsConfig,
      final BoundaryConditions? boundaryConditions,
      final OutputConfiguration? outputConfig}) = _$ModelConfigurationImpl;

  factory _ModelConfiguration.fromJson(Map<String, dynamic> json) =
      _$ModelConfigurationImpl.fromJson;

  @override
  WaveParameters get initialConditions;
  @override
  GridConfiguration get gridConfig;
  @override
  TimeConfiguration get timeConfig;
  @override
  PhysicsConfiguration? get physicsConfig;
  @override
  BoundaryConditions? get boundaryConditions;
  @override
  OutputConfiguration? get outputConfig;

  /// Create a copy of ModelConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ModelConfigurationImplCopyWith<_$ModelConfigurationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GridConfiguration _$GridConfigurationFromJson(Map<String, dynamic> json) {
  return _GridConfiguration.fromJson(json);
}

/// @nodoc
mixin _$GridConfiguration {
  int get numberOfGridPointsX => throw _privateConstructorUsedError;
  int get numberOfGridPointsY => throw _privateConstructorUsedError;
  double get gridSpacingX => throw _privateConstructorUsedError;
  double get gridSpacingY => throw _privateConstructorUsedError;
  GridType get gridType => throw _privateConstructorUsedError;
  String? get bathymetryFile => throw _privateConstructorUsedError;

  /// Serializes this GridConfiguration to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GridConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GridConfigurationCopyWith<GridConfiguration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GridConfigurationCopyWith<$Res> {
  factory $GridConfigurationCopyWith(
          GridConfiguration value, $Res Function(GridConfiguration) then) =
      _$GridConfigurationCopyWithImpl<$Res, GridConfiguration>;
  @useResult
  $Res call(
      {int numberOfGridPointsX,
      int numberOfGridPointsY,
      double gridSpacingX,
      double gridSpacingY,
      GridType gridType,
      String? bathymetryFile});
}

/// @nodoc
class _$GridConfigurationCopyWithImpl<$Res, $Val extends GridConfiguration>
    implements $GridConfigurationCopyWith<$Res> {
  _$GridConfigurationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GridConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numberOfGridPointsX = null,
    Object? numberOfGridPointsY = null,
    Object? gridSpacingX = null,
    Object? gridSpacingY = null,
    Object? gridType = null,
    Object? bathymetryFile = freezed,
  }) {
    return _then(_value.copyWith(
      numberOfGridPointsX: null == numberOfGridPointsX
          ? _value.numberOfGridPointsX
          : numberOfGridPointsX // ignore: cast_nullable_to_non_nullable
              as int,
      numberOfGridPointsY: null == numberOfGridPointsY
          ? _value.numberOfGridPointsY
          : numberOfGridPointsY // ignore: cast_nullable_to_non_nullable
              as int,
      gridSpacingX: null == gridSpacingX
          ? _value.gridSpacingX
          : gridSpacingX // ignore: cast_nullable_to_non_nullable
              as double,
      gridSpacingY: null == gridSpacingY
          ? _value.gridSpacingY
          : gridSpacingY // ignore: cast_nullable_to_non_nullable
              as double,
      gridType: null == gridType
          ? _value.gridType
          : gridType // ignore: cast_nullable_to_non_nullable
              as GridType,
      bathymetryFile: freezed == bathymetryFile
          ? _value.bathymetryFile
          : bathymetryFile // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GridConfigurationImplCopyWith<$Res>
    implements $GridConfigurationCopyWith<$Res> {
  factory _$$GridConfigurationImplCopyWith(_$GridConfigurationImpl value,
          $Res Function(_$GridConfigurationImpl) then) =
      __$$GridConfigurationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int numberOfGridPointsX,
      int numberOfGridPointsY,
      double gridSpacingX,
      double gridSpacingY,
      GridType gridType,
      String? bathymetryFile});
}

/// @nodoc
class __$$GridConfigurationImplCopyWithImpl<$Res>
    extends _$GridConfigurationCopyWithImpl<$Res, _$GridConfigurationImpl>
    implements _$$GridConfigurationImplCopyWith<$Res> {
  __$$GridConfigurationImplCopyWithImpl(_$GridConfigurationImpl _value,
      $Res Function(_$GridConfigurationImpl) _then)
      : super(_value, _then);

  /// Create a copy of GridConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numberOfGridPointsX = null,
    Object? numberOfGridPointsY = null,
    Object? gridSpacingX = null,
    Object? gridSpacingY = null,
    Object? gridType = null,
    Object? bathymetryFile = freezed,
  }) {
    return _then(_$GridConfigurationImpl(
      numberOfGridPointsX: null == numberOfGridPointsX
          ? _value.numberOfGridPointsX
          : numberOfGridPointsX // ignore: cast_nullable_to_non_nullable
              as int,
      numberOfGridPointsY: null == numberOfGridPointsY
          ? _value.numberOfGridPointsY
          : numberOfGridPointsY // ignore: cast_nullable_to_non_nullable
              as int,
      gridSpacingX: null == gridSpacingX
          ? _value.gridSpacingX
          : gridSpacingX // ignore: cast_nullable_to_non_nullable
              as double,
      gridSpacingY: null == gridSpacingY
          ? _value.gridSpacingY
          : gridSpacingY // ignore: cast_nullable_to_non_nullable
              as double,
      gridType: null == gridType
          ? _value.gridType
          : gridType // ignore: cast_nullable_to_non_nullable
              as GridType,
      bathymetryFile: freezed == bathymetryFile
          ? _value.bathymetryFile
          : bathymetryFile // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GridConfigurationImpl implements _GridConfiguration {
  const _$GridConfigurationImpl(
      {required this.numberOfGridPointsX,
      required this.numberOfGridPointsY,
      required this.gridSpacingX,
      required this.gridSpacingY,
      this.gridType = GridType.cartesian,
      this.bathymetryFile});

  factory _$GridConfigurationImpl.fromJson(Map<String, dynamic> json) =>
      _$$GridConfigurationImplFromJson(json);

  @override
  final int numberOfGridPointsX;
  @override
  final int numberOfGridPointsY;
  @override
  final double gridSpacingX;
  @override
  final double gridSpacingY;
  @override
  @JsonKey()
  final GridType gridType;
  @override
  final String? bathymetryFile;

  @override
  String toString() {
    return 'GridConfiguration(numberOfGridPointsX: $numberOfGridPointsX, numberOfGridPointsY: $numberOfGridPointsY, gridSpacingX: $gridSpacingX, gridSpacingY: $gridSpacingY, gridType: $gridType, bathymetryFile: $bathymetryFile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GridConfigurationImpl &&
            (identical(other.numberOfGridPointsX, numberOfGridPointsX) ||
                other.numberOfGridPointsX == numberOfGridPointsX) &&
            (identical(other.numberOfGridPointsY, numberOfGridPointsY) ||
                other.numberOfGridPointsY == numberOfGridPointsY) &&
            (identical(other.gridSpacingX, gridSpacingX) ||
                other.gridSpacingX == gridSpacingX) &&
            (identical(other.gridSpacingY, gridSpacingY) ||
                other.gridSpacingY == gridSpacingY) &&
            (identical(other.gridType, gridType) ||
                other.gridType == gridType) &&
            (identical(other.bathymetryFile, bathymetryFile) ||
                other.bathymetryFile == bathymetryFile));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      numberOfGridPointsX,
      numberOfGridPointsY,
      gridSpacingX,
      gridSpacingY,
      gridType,
      bathymetryFile);

  /// Create a copy of GridConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GridConfigurationImplCopyWith<_$GridConfigurationImpl> get copyWith =>
      __$$GridConfigurationImplCopyWithImpl<_$GridConfigurationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GridConfigurationImplToJson(
      this,
    );
  }
}

abstract class _GridConfiguration implements GridConfiguration {
  const factory _GridConfiguration(
      {required final int numberOfGridPointsX,
      required final int numberOfGridPointsY,
      required final double gridSpacingX,
      required final double gridSpacingY,
      final GridType gridType,
      final String? bathymetryFile}) = _$GridConfigurationImpl;

  factory _GridConfiguration.fromJson(Map<String, dynamic> json) =
      _$GridConfigurationImpl.fromJson;

  @override
  int get numberOfGridPointsX;
  @override
  int get numberOfGridPointsY;
  @override
  double get gridSpacingX;
  @override
  double get gridSpacingY;
  @override
  GridType get gridType;
  @override
  String? get bathymetryFile;

  /// Create a copy of GridConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GridConfigurationImplCopyWith<_$GridConfigurationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TimeConfiguration _$TimeConfigurationFromJson(Map<String, dynamic> json) {
  return _TimeConfiguration.fromJson(json);
}

/// @nodoc
mixin _$TimeConfiguration {
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;
  Duration get timeStep => throw _privateConstructorUsedError;
  Duration? get outputInterval => throw _privateConstructorUsedError;

  /// Serializes this TimeConfiguration to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TimeConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimeConfigurationCopyWith<TimeConfiguration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeConfigurationCopyWith<$Res> {
  factory $TimeConfigurationCopyWith(
          TimeConfiguration value, $Res Function(TimeConfiguration) then) =
      _$TimeConfigurationCopyWithImpl<$Res, TimeConfiguration>;
  @useResult
  $Res call(
      {DateTime startTime,
      DateTime endTime,
      Duration timeStep,
      Duration? outputInterval});
}

/// @nodoc
class _$TimeConfigurationCopyWithImpl<$Res, $Val extends TimeConfiguration>
    implements $TimeConfigurationCopyWith<$Res> {
  _$TimeConfigurationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimeConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = null,
    Object? endTime = null,
    Object? timeStep = null,
    Object? outputInterval = freezed,
  }) {
    return _then(_value.copyWith(
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      timeStep: null == timeStep
          ? _value.timeStep
          : timeStep // ignore: cast_nullable_to_non_nullable
              as Duration,
      outputInterval: freezed == outputInterval
          ? _value.outputInterval
          : outputInterval // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimeConfigurationImplCopyWith<$Res>
    implements $TimeConfigurationCopyWith<$Res> {
  factory _$$TimeConfigurationImplCopyWith(_$TimeConfigurationImpl value,
          $Res Function(_$TimeConfigurationImpl) then) =
      __$$TimeConfigurationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime startTime,
      DateTime endTime,
      Duration timeStep,
      Duration? outputInterval});
}

/// @nodoc
class __$$TimeConfigurationImplCopyWithImpl<$Res>
    extends _$TimeConfigurationCopyWithImpl<$Res, _$TimeConfigurationImpl>
    implements _$$TimeConfigurationImplCopyWith<$Res> {
  __$$TimeConfigurationImplCopyWithImpl(_$TimeConfigurationImpl _value,
      $Res Function(_$TimeConfigurationImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimeConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = null,
    Object? endTime = null,
    Object? timeStep = null,
    Object? outputInterval = freezed,
  }) {
    return _then(_$TimeConfigurationImpl(
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      timeStep: null == timeStep
          ? _value.timeStep
          : timeStep // ignore: cast_nullable_to_non_nullable
              as Duration,
      outputInterval: freezed == outputInterval
          ? _value.outputInterval
          : outputInterval // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimeConfigurationImpl implements _TimeConfiguration {
  const _$TimeConfigurationImpl(
      {required this.startTime,
      required this.endTime,
      required this.timeStep,
      this.outputInterval});

  factory _$TimeConfigurationImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimeConfigurationImplFromJson(json);

  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  final Duration timeStep;
  @override
  final Duration? outputInterval;

  @override
  String toString() {
    return 'TimeConfiguration(startTime: $startTime, endTime: $endTime, timeStep: $timeStep, outputInterval: $outputInterval)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeConfigurationImpl &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.timeStep, timeStep) ||
                other.timeStep == timeStep) &&
            (identical(other.outputInterval, outputInterval) ||
                other.outputInterval == outputInterval));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, startTime, endTime, timeStep, outputInterval);

  /// Create a copy of TimeConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeConfigurationImplCopyWith<_$TimeConfigurationImpl> get copyWith =>
      __$$TimeConfigurationImplCopyWithImpl<_$TimeConfigurationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimeConfigurationImplToJson(
      this,
    );
  }
}

abstract class _TimeConfiguration implements TimeConfiguration {
  const factory _TimeConfiguration(
      {required final DateTime startTime,
      required final DateTime endTime,
      required final Duration timeStep,
      final Duration? outputInterval}) = _$TimeConfigurationImpl;

  factory _TimeConfiguration.fromJson(Map<String, dynamic> json) =
      _$TimeConfigurationImpl.fromJson;

  @override
  DateTime get startTime;
  @override
  DateTime get endTime;
  @override
  Duration get timeStep;
  @override
  Duration? get outputInterval;

  /// Create a copy of TimeConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimeConfigurationImplCopyWith<_$TimeConfigurationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PhysicsConfiguration _$PhysicsConfigurationFromJson(Map<String, dynamic> json) {
  return _PhysicsConfiguration.fromJson(json);
}

/// @nodoc
mixin _$PhysicsConfiguration {
  bool get includeWaveRefraction => throw _privateConstructorUsedError;
  bool get includeWaveDiffraction => throw _privateConstructorUsedError;
  bool get includeWaveBreaking => throw _privateConstructorUsedError;
  bool get includeWindGeneration => throw _privateConstructorUsedError;
  bool get includeSedimentTransport => throw _privateConstructorUsedError;
  double get bottomFriction => throw _privateConstructorUsedError;
  double get windDragCoefficient => throw _privateConstructorUsedError;

  /// Serializes this PhysicsConfiguration to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PhysicsConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PhysicsConfigurationCopyWith<PhysicsConfiguration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhysicsConfigurationCopyWith<$Res> {
  factory $PhysicsConfigurationCopyWith(PhysicsConfiguration value,
          $Res Function(PhysicsConfiguration) then) =
      _$PhysicsConfigurationCopyWithImpl<$Res, PhysicsConfiguration>;
  @useResult
  $Res call(
      {bool includeWaveRefraction,
      bool includeWaveDiffraction,
      bool includeWaveBreaking,
      bool includeWindGeneration,
      bool includeSedimentTransport,
      double bottomFriction,
      double windDragCoefficient});
}

/// @nodoc
class _$PhysicsConfigurationCopyWithImpl<$Res,
        $Val extends PhysicsConfiguration>
    implements $PhysicsConfigurationCopyWith<$Res> {
  _$PhysicsConfigurationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PhysicsConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? includeWaveRefraction = null,
    Object? includeWaveDiffraction = null,
    Object? includeWaveBreaking = null,
    Object? includeWindGeneration = null,
    Object? includeSedimentTransport = null,
    Object? bottomFriction = null,
    Object? windDragCoefficient = null,
  }) {
    return _then(_value.copyWith(
      includeWaveRefraction: null == includeWaveRefraction
          ? _value.includeWaveRefraction
          : includeWaveRefraction // ignore: cast_nullable_to_non_nullable
              as bool,
      includeWaveDiffraction: null == includeWaveDiffraction
          ? _value.includeWaveDiffraction
          : includeWaveDiffraction // ignore: cast_nullable_to_non_nullable
              as bool,
      includeWaveBreaking: null == includeWaveBreaking
          ? _value.includeWaveBreaking
          : includeWaveBreaking // ignore: cast_nullable_to_non_nullable
              as bool,
      includeWindGeneration: null == includeWindGeneration
          ? _value.includeWindGeneration
          : includeWindGeneration // ignore: cast_nullable_to_non_nullable
              as bool,
      includeSedimentTransport: null == includeSedimentTransport
          ? _value.includeSedimentTransport
          : includeSedimentTransport // ignore: cast_nullable_to_non_nullable
              as bool,
      bottomFriction: null == bottomFriction
          ? _value.bottomFriction
          : bottomFriction // ignore: cast_nullable_to_non_nullable
              as double,
      windDragCoefficient: null == windDragCoefficient
          ? _value.windDragCoefficient
          : windDragCoefficient // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhysicsConfigurationImplCopyWith<$Res>
    implements $PhysicsConfigurationCopyWith<$Res> {
  factory _$$PhysicsConfigurationImplCopyWith(_$PhysicsConfigurationImpl value,
          $Res Function(_$PhysicsConfigurationImpl) then) =
      __$$PhysicsConfigurationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool includeWaveRefraction,
      bool includeWaveDiffraction,
      bool includeWaveBreaking,
      bool includeWindGeneration,
      bool includeSedimentTransport,
      double bottomFriction,
      double windDragCoefficient});
}

/// @nodoc
class __$$PhysicsConfigurationImplCopyWithImpl<$Res>
    extends _$PhysicsConfigurationCopyWithImpl<$Res, _$PhysicsConfigurationImpl>
    implements _$$PhysicsConfigurationImplCopyWith<$Res> {
  __$$PhysicsConfigurationImplCopyWithImpl(_$PhysicsConfigurationImpl _value,
      $Res Function(_$PhysicsConfigurationImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhysicsConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? includeWaveRefraction = null,
    Object? includeWaveDiffraction = null,
    Object? includeWaveBreaking = null,
    Object? includeWindGeneration = null,
    Object? includeSedimentTransport = null,
    Object? bottomFriction = null,
    Object? windDragCoefficient = null,
  }) {
    return _then(_$PhysicsConfigurationImpl(
      includeWaveRefraction: null == includeWaveRefraction
          ? _value.includeWaveRefraction
          : includeWaveRefraction // ignore: cast_nullable_to_non_nullable
              as bool,
      includeWaveDiffraction: null == includeWaveDiffraction
          ? _value.includeWaveDiffraction
          : includeWaveDiffraction // ignore: cast_nullable_to_non_nullable
              as bool,
      includeWaveBreaking: null == includeWaveBreaking
          ? _value.includeWaveBreaking
          : includeWaveBreaking // ignore: cast_nullable_to_non_nullable
              as bool,
      includeWindGeneration: null == includeWindGeneration
          ? _value.includeWindGeneration
          : includeWindGeneration // ignore: cast_nullable_to_non_nullable
              as bool,
      includeSedimentTransport: null == includeSedimentTransport
          ? _value.includeSedimentTransport
          : includeSedimentTransport // ignore: cast_nullable_to_non_nullable
              as bool,
      bottomFriction: null == bottomFriction
          ? _value.bottomFriction
          : bottomFriction // ignore: cast_nullable_to_non_nullable
              as double,
      windDragCoefficient: null == windDragCoefficient
          ? _value.windDragCoefficient
          : windDragCoefficient // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PhysicsConfigurationImpl implements _PhysicsConfiguration {
  const _$PhysicsConfigurationImpl(
      {this.includeWaveRefraction = true,
      this.includeWaveDiffraction = true,
      this.includeWaveBreaking = true,
      this.includeWindGeneration = false,
      this.includeSedimentTransport = false,
      this.bottomFriction = 0.04,
      this.windDragCoefficient = 1.0});

  factory _$PhysicsConfigurationImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhysicsConfigurationImplFromJson(json);

  @override
  @JsonKey()
  final bool includeWaveRefraction;
  @override
  @JsonKey()
  final bool includeWaveDiffraction;
  @override
  @JsonKey()
  final bool includeWaveBreaking;
  @override
  @JsonKey()
  final bool includeWindGeneration;
  @override
  @JsonKey()
  final bool includeSedimentTransport;
  @override
  @JsonKey()
  final double bottomFriction;
  @override
  @JsonKey()
  final double windDragCoefficient;

  @override
  String toString() {
    return 'PhysicsConfiguration(includeWaveRefraction: $includeWaveRefraction, includeWaveDiffraction: $includeWaveDiffraction, includeWaveBreaking: $includeWaveBreaking, includeWindGeneration: $includeWindGeneration, includeSedimentTransport: $includeSedimentTransport, bottomFriction: $bottomFriction, windDragCoefficient: $windDragCoefficient)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhysicsConfigurationImpl &&
            (identical(other.includeWaveRefraction, includeWaveRefraction) ||
                other.includeWaveRefraction == includeWaveRefraction) &&
            (identical(other.includeWaveDiffraction, includeWaveDiffraction) ||
                other.includeWaveDiffraction == includeWaveDiffraction) &&
            (identical(other.includeWaveBreaking, includeWaveBreaking) ||
                other.includeWaveBreaking == includeWaveBreaking) &&
            (identical(other.includeWindGeneration, includeWindGeneration) ||
                other.includeWindGeneration == includeWindGeneration) &&
            (identical(
                    other.includeSedimentTransport, includeSedimentTransport) ||
                other.includeSedimentTransport == includeSedimentTransport) &&
            (identical(other.bottomFriction, bottomFriction) ||
                other.bottomFriction == bottomFriction) &&
            (identical(other.windDragCoefficient, windDragCoefficient) ||
                other.windDragCoefficient == windDragCoefficient));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      includeWaveRefraction,
      includeWaveDiffraction,
      includeWaveBreaking,
      includeWindGeneration,
      includeSedimentTransport,
      bottomFriction,
      windDragCoefficient);

  /// Create a copy of PhysicsConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhysicsConfigurationImplCopyWith<_$PhysicsConfigurationImpl>
      get copyWith =>
          __$$PhysicsConfigurationImplCopyWithImpl<_$PhysicsConfigurationImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PhysicsConfigurationImplToJson(
      this,
    );
  }
}

abstract class _PhysicsConfiguration implements PhysicsConfiguration {
  const factory _PhysicsConfiguration(
      {final bool includeWaveRefraction,
      final bool includeWaveDiffraction,
      final bool includeWaveBreaking,
      final bool includeWindGeneration,
      final bool includeSedimentTransport,
      final double bottomFriction,
      final double windDragCoefficient}) = _$PhysicsConfigurationImpl;

  factory _PhysicsConfiguration.fromJson(Map<String, dynamic> json) =
      _$PhysicsConfigurationImpl.fromJson;

  @override
  bool get includeWaveRefraction;
  @override
  bool get includeWaveDiffraction;
  @override
  bool get includeWaveBreaking;
  @override
  bool get includeWindGeneration;
  @override
  bool get includeSedimentTransport;
  @override
  double get bottomFriction;
  @override
  double get windDragCoefficient;

  /// Create a copy of PhysicsConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhysicsConfigurationImplCopyWith<_$PhysicsConfigurationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

BoundaryConditions _$BoundaryConditionsFromJson(Map<String, dynamic> json) {
  return _BoundaryConditions.fromJson(json);
}

/// @nodoc
mixin _$BoundaryConditions {
  BoundaryType get westBoundary => throw _privateConstructorUsedError;
  BoundaryType get eastBoundary => throw _privateConstructorUsedError;
  BoundaryType get northBoundary => throw _privateConstructorUsedError;
  BoundaryType get southBoundary => throw _privateConstructorUsedError;
  WaveParameters? get deepWaterWaves => throw _privateConstructorUsedError;
  String? get boundaryDataFile => throw _privateConstructorUsedError;

  /// Serializes this BoundaryConditions to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BoundaryConditions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BoundaryConditionsCopyWith<BoundaryConditions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoundaryConditionsCopyWith<$Res> {
  factory $BoundaryConditionsCopyWith(
          BoundaryConditions value, $Res Function(BoundaryConditions) then) =
      _$BoundaryConditionsCopyWithImpl<$Res, BoundaryConditions>;
  @useResult
  $Res call(
      {BoundaryType westBoundary,
      BoundaryType eastBoundary,
      BoundaryType northBoundary,
      BoundaryType southBoundary,
      WaveParameters? deepWaterWaves,
      String? boundaryDataFile});

  $WaveParametersCopyWith<$Res>? get deepWaterWaves;
}

/// @nodoc
class _$BoundaryConditionsCopyWithImpl<$Res, $Val extends BoundaryConditions>
    implements $BoundaryConditionsCopyWith<$Res> {
  _$BoundaryConditionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BoundaryConditions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? westBoundary = null,
    Object? eastBoundary = null,
    Object? northBoundary = null,
    Object? southBoundary = null,
    Object? deepWaterWaves = freezed,
    Object? boundaryDataFile = freezed,
  }) {
    return _then(_value.copyWith(
      westBoundary: null == westBoundary
          ? _value.westBoundary
          : westBoundary // ignore: cast_nullable_to_non_nullable
              as BoundaryType,
      eastBoundary: null == eastBoundary
          ? _value.eastBoundary
          : eastBoundary // ignore: cast_nullable_to_non_nullable
              as BoundaryType,
      northBoundary: null == northBoundary
          ? _value.northBoundary
          : northBoundary // ignore: cast_nullable_to_non_nullable
              as BoundaryType,
      southBoundary: null == southBoundary
          ? _value.southBoundary
          : southBoundary // ignore: cast_nullable_to_non_nullable
              as BoundaryType,
      deepWaterWaves: freezed == deepWaterWaves
          ? _value.deepWaterWaves
          : deepWaterWaves // ignore: cast_nullable_to_non_nullable
              as WaveParameters?,
      boundaryDataFile: freezed == boundaryDataFile
          ? _value.boundaryDataFile
          : boundaryDataFile // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of BoundaryConditions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WaveParametersCopyWith<$Res>? get deepWaterWaves {
    if (_value.deepWaterWaves == null) {
      return null;
    }

    return $WaveParametersCopyWith<$Res>(_value.deepWaterWaves!, (value) {
      return _then(_value.copyWith(deepWaterWaves: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BoundaryConditionsImplCopyWith<$Res>
    implements $BoundaryConditionsCopyWith<$Res> {
  factory _$$BoundaryConditionsImplCopyWith(_$BoundaryConditionsImpl value,
          $Res Function(_$BoundaryConditionsImpl) then) =
      __$$BoundaryConditionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BoundaryType westBoundary,
      BoundaryType eastBoundary,
      BoundaryType northBoundary,
      BoundaryType southBoundary,
      WaveParameters? deepWaterWaves,
      String? boundaryDataFile});

  @override
  $WaveParametersCopyWith<$Res>? get deepWaterWaves;
}

/// @nodoc
class __$$BoundaryConditionsImplCopyWithImpl<$Res>
    extends _$BoundaryConditionsCopyWithImpl<$Res, _$BoundaryConditionsImpl>
    implements _$$BoundaryConditionsImplCopyWith<$Res> {
  __$$BoundaryConditionsImplCopyWithImpl(_$BoundaryConditionsImpl _value,
      $Res Function(_$BoundaryConditionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of BoundaryConditions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? westBoundary = null,
    Object? eastBoundary = null,
    Object? northBoundary = null,
    Object? southBoundary = null,
    Object? deepWaterWaves = freezed,
    Object? boundaryDataFile = freezed,
  }) {
    return _then(_$BoundaryConditionsImpl(
      westBoundary: null == westBoundary
          ? _value.westBoundary
          : westBoundary // ignore: cast_nullable_to_non_nullable
              as BoundaryType,
      eastBoundary: null == eastBoundary
          ? _value.eastBoundary
          : eastBoundary // ignore: cast_nullable_to_non_nullable
              as BoundaryType,
      northBoundary: null == northBoundary
          ? _value.northBoundary
          : northBoundary // ignore: cast_nullable_to_non_nullable
              as BoundaryType,
      southBoundary: null == southBoundary
          ? _value.southBoundary
          : southBoundary // ignore: cast_nullable_to_non_nullable
              as BoundaryType,
      deepWaterWaves: freezed == deepWaterWaves
          ? _value.deepWaterWaves
          : deepWaterWaves // ignore: cast_nullable_to_non_nullable
              as WaveParameters?,
      boundaryDataFile: freezed == boundaryDataFile
          ? _value.boundaryDataFile
          : boundaryDataFile // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BoundaryConditionsImpl implements _BoundaryConditions {
  const _$BoundaryConditionsImpl(
      {required this.westBoundary,
      required this.eastBoundary,
      required this.northBoundary,
      required this.southBoundary,
      this.deepWaterWaves,
      this.boundaryDataFile});

  factory _$BoundaryConditionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$BoundaryConditionsImplFromJson(json);

  @override
  final BoundaryType westBoundary;
  @override
  final BoundaryType eastBoundary;
  @override
  final BoundaryType northBoundary;
  @override
  final BoundaryType southBoundary;
  @override
  final WaveParameters? deepWaterWaves;
  @override
  final String? boundaryDataFile;

  @override
  String toString() {
    return 'BoundaryConditions(westBoundary: $westBoundary, eastBoundary: $eastBoundary, northBoundary: $northBoundary, southBoundary: $southBoundary, deepWaterWaves: $deepWaterWaves, boundaryDataFile: $boundaryDataFile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoundaryConditionsImpl &&
            (identical(other.westBoundary, westBoundary) ||
                other.westBoundary == westBoundary) &&
            (identical(other.eastBoundary, eastBoundary) ||
                other.eastBoundary == eastBoundary) &&
            (identical(other.northBoundary, northBoundary) ||
                other.northBoundary == northBoundary) &&
            (identical(other.southBoundary, southBoundary) ||
                other.southBoundary == southBoundary) &&
            (identical(other.deepWaterWaves, deepWaterWaves) ||
                other.deepWaterWaves == deepWaterWaves) &&
            (identical(other.boundaryDataFile, boundaryDataFile) ||
                other.boundaryDataFile == boundaryDataFile));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, westBoundary, eastBoundary,
      northBoundary, southBoundary, deepWaterWaves, boundaryDataFile);

  /// Create a copy of BoundaryConditions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BoundaryConditionsImplCopyWith<_$BoundaryConditionsImpl> get copyWith =>
      __$$BoundaryConditionsImplCopyWithImpl<_$BoundaryConditionsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BoundaryConditionsImplToJson(
      this,
    );
  }
}

abstract class _BoundaryConditions implements BoundaryConditions {
  const factory _BoundaryConditions(
      {required final BoundaryType westBoundary,
      required final BoundaryType eastBoundary,
      required final BoundaryType northBoundary,
      required final BoundaryType southBoundary,
      final WaveParameters? deepWaterWaves,
      final String? boundaryDataFile}) = _$BoundaryConditionsImpl;

  factory _BoundaryConditions.fromJson(Map<String, dynamic> json) =
      _$BoundaryConditionsImpl.fromJson;

  @override
  BoundaryType get westBoundary;
  @override
  BoundaryType get eastBoundary;
  @override
  BoundaryType get northBoundary;
  @override
  BoundaryType get southBoundary;
  @override
  WaveParameters? get deepWaterWaves;
  @override
  String? get boundaryDataFile;

  /// Create a copy of BoundaryConditions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BoundaryConditionsImplCopyWith<_$BoundaryConditionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OutputConfiguration _$OutputConfigurationFromJson(Map<String, dynamic> json) {
  return _OutputConfiguration.fromJson(json);
}

/// @nodoc
mixin _$OutputConfiguration {
  List<String> get outputVariables => throw _privateConstructorUsedError;
  OutputFormat get outputFormat => throw _privateConstructorUsedError;
  String get outputDirectory => throw _privateConstructorUsedError;
  bool get saveWaveFields => throw _privateConstructorUsedError;
  bool get saveTimeseriesAtPoints => throw _privateConstructorUsedError;
  List<Coordinates>? get outputPoints => throw _privateConstructorUsedError;

  /// Serializes this OutputConfiguration to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OutputConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OutputConfigurationCopyWith<OutputConfiguration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutputConfigurationCopyWith<$Res> {
  factory $OutputConfigurationCopyWith(
          OutputConfiguration value, $Res Function(OutputConfiguration) then) =
      _$OutputConfigurationCopyWithImpl<$Res, OutputConfiguration>;
  @useResult
  $Res call(
      {List<String> outputVariables,
      OutputFormat outputFormat,
      String outputDirectory,
      bool saveWaveFields,
      bool saveTimeseriesAtPoints,
      List<Coordinates>? outputPoints});
}

/// @nodoc
class _$OutputConfigurationCopyWithImpl<$Res, $Val extends OutputConfiguration>
    implements $OutputConfigurationCopyWith<$Res> {
  _$OutputConfigurationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OutputConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? outputVariables = null,
    Object? outputFormat = null,
    Object? outputDirectory = null,
    Object? saveWaveFields = null,
    Object? saveTimeseriesAtPoints = null,
    Object? outputPoints = freezed,
  }) {
    return _then(_value.copyWith(
      outputVariables: null == outputVariables
          ? _value.outputVariables
          : outputVariables // ignore: cast_nullable_to_non_nullable
              as List<String>,
      outputFormat: null == outputFormat
          ? _value.outputFormat
          : outputFormat // ignore: cast_nullable_to_non_nullable
              as OutputFormat,
      outputDirectory: null == outputDirectory
          ? _value.outputDirectory
          : outputDirectory // ignore: cast_nullable_to_non_nullable
              as String,
      saveWaveFields: null == saveWaveFields
          ? _value.saveWaveFields
          : saveWaveFields // ignore: cast_nullable_to_non_nullable
              as bool,
      saveTimeseriesAtPoints: null == saveTimeseriesAtPoints
          ? _value.saveTimeseriesAtPoints
          : saveTimeseriesAtPoints // ignore: cast_nullable_to_non_nullable
              as bool,
      outputPoints: freezed == outputPoints
          ? _value.outputPoints
          : outputPoints // ignore: cast_nullable_to_non_nullable
              as List<Coordinates>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OutputConfigurationImplCopyWith<$Res>
    implements $OutputConfigurationCopyWith<$Res> {
  factory _$$OutputConfigurationImplCopyWith(_$OutputConfigurationImpl value,
          $Res Function(_$OutputConfigurationImpl) then) =
      __$$OutputConfigurationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> outputVariables,
      OutputFormat outputFormat,
      String outputDirectory,
      bool saveWaveFields,
      bool saveTimeseriesAtPoints,
      List<Coordinates>? outputPoints});
}

/// @nodoc
class __$$OutputConfigurationImplCopyWithImpl<$Res>
    extends _$OutputConfigurationCopyWithImpl<$Res, _$OutputConfigurationImpl>
    implements _$$OutputConfigurationImplCopyWith<$Res> {
  __$$OutputConfigurationImplCopyWithImpl(_$OutputConfigurationImpl _value,
      $Res Function(_$OutputConfigurationImpl) _then)
      : super(_value, _then);

  /// Create a copy of OutputConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? outputVariables = null,
    Object? outputFormat = null,
    Object? outputDirectory = null,
    Object? saveWaveFields = null,
    Object? saveTimeseriesAtPoints = null,
    Object? outputPoints = freezed,
  }) {
    return _then(_$OutputConfigurationImpl(
      outputVariables: null == outputVariables
          ? _value._outputVariables
          : outputVariables // ignore: cast_nullable_to_non_nullable
              as List<String>,
      outputFormat: null == outputFormat
          ? _value.outputFormat
          : outputFormat // ignore: cast_nullable_to_non_nullable
              as OutputFormat,
      outputDirectory: null == outputDirectory
          ? _value.outputDirectory
          : outputDirectory // ignore: cast_nullable_to_non_nullable
              as String,
      saveWaveFields: null == saveWaveFields
          ? _value.saveWaveFields
          : saveWaveFields // ignore: cast_nullable_to_non_nullable
              as bool,
      saveTimeseriesAtPoints: null == saveTimeseriesAtPoints
          ? _value.saveTimeseriesAtPoints
          : saveTimeseriesAtPoints // ignore: cast_nullable_to_non_nullable
              as bool,
      outputPoints: freezed == outputPoints
          ? _value._outputPoints
          : outputPoints // ignore: cast_nullable_to_non_nullable
              as List<Coordinates>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OutputConfigurationImpl implements _OutputConfiguration {
  const _$OutputConfigurationImpl(
      {final List<String> outputVariables = const [
        'wave_height',
        'wave_direction'
      ],
      this.outputFormat = OutputFormat.netcdf,
      this.outputDirectory = 'model_output',
      this.saveWaveFields = true,
      this.saveTimeseriesAtPoints = true,
      final List<Coordinates>? outputPoints})
      : _outputVariables = outputVariables,
        _outputPoints = outputPoints;

  factory _$OutputConfigurationImpl.fromJson(Map<String, dynamic> json) =>
      _$$OutputConfigurationImplFromJson(json);

  final List<String> _outputVariables;
  @override
  @JsonKey()
  List<String> get outputVariables {
    if (_outputVariables is EqualUnmodifiableListView) return _outputVariables;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_outputVariables);
  }

  @override
  @JsonKey()
  final OutputFormat outputFormat;
  @override
  @JsonKey()
  final String outputDirectory;
  @override
  @JsonKey()
  final bool saveWaveFields;
  @override
  @JsonKey()
  final bool saveTimeseriesAtPoints;
  final List<Coordinates>? _outputPoints;
  @override
  List<Coordinates>? get outputPoints {
    final value = _outputPoints;
    if (value == null) return null;
    if (_outputPoints is EqualUnmodifiableListView) return _outputPoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'OutputConfiguration(outputVariables: $outputVariables, outputFormat: $outputFormat, outputDirectory: $outputDirectory, saveWaveFields: $saveWaveFields, saveTimeseriesAtPoints: $saveTimeseriesAtPoints, outputPoints: $outputPoints)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OutputConfigurationImpl &&
            const DeepCollectionEquality()
                .equals(other._outputVariables, _outputVariables) &&
            (identical(other.outputFormat, outputFormat) ||
                other.outputFormat == outputFormat) &&
            (identical(other.outputDirectory, outputDirectory) ||
                other.outputDirectory == outputDirectory) &&
            (identical(other.saveWaveFields, saveWaveFields) ||
                other.saveWaveFields == saveWaveFields) &&
            (identical(other.saveTimeseriesAtPoints, saveTimeseriesAtPoints) ||
                other.saveTimeseriesAtPoints == saveTimeseriesAtPoints) &&
            const DeepCollectionEquality()
                .equals(other._outputPoints, _outputPoints));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_outputVariables),
      outputFormat,
      outputDirectory,
      saveWaveFields,
      saveTimeseriesAtPoints,
      const DeepCollectionEquality().hash(_outputPoints));

  /// Create a copy of OutputConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OutputConfigurationImplCopyWith<_$OutputConfigurationImpl> get copyWith =>
      __$$OutputConfigurationImplCopyWithImpl<_$OutputConfigurationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OutputConfigurationImplToJson(
      this,
    );
  }
}

abstract class _OutputConfiguration implements OutputConfiguration {
  const factory _OutputConfiguration(
      {final List<String> outputVariables,
      final OutputFormat outputFormat,
      final String outputDirectory,
      final bool saveWaveFields,
      final bool saveTimeseriesAtPoints,
      final List<Coordinates>? outputPoints}) = _$OutputConfigurationImpl;

  factory _OutputConfiguration.fromJson(Map<String, dynamic> json) =
      _$OutputConfigurationImpl.fromJson;

  @override
  List<String> get outputVariables;
  @override
  OutputFormat get outputFormat;
  @override
  String get outputDirectory;
  @override
  bool get saveWaveFields;
  @override
  bool get saveTimeseriesAtPoints;
  @override
  List<Coordinates>? get outputPoints;

  /// Create a copy of OutputConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OutputConfigurationImplCopyWith<_$OutputConfigurationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
