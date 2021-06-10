// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'locus_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LocusDtoTearOff {
  const _$LocusDtoTearOff();

  _LocusDto call(
      {required String name,
      required int length,
      required String type,
      required String organism,
      String? shape,
      String? releaseDate,
      String? sequence,
      List<FeatureDto>? features}) {
    return _LocusDto(
      name: name,
      length: length,
      type: type,
      organism: organism,
      shape: shape,
      releaseDate: releaseDate,
      sequence: sequence,
      features: features,
    );
  }
}

/// @nodoc
const $LocusDto = _$LocusDtoTearOff();

/// @nodoc
mixin _$LocusDto {
  String get name => throw _privateConstructorUsedError;
  int get length => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get organism => throw _privateConstructorUsedError;
  String? get shape => throw _privateConstructorUsedError;
  String? get releaseDate => throw _privateConstructorUsedError;
  String? get sequence => throw _privateConstructorUsedError;
  List<FeatureDto>? get features => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocusDtoCopyWith<LocusDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocusDtoCopyWith<$Res> {
  factory $LocusDtoCopyWith(LocusDto value, $Res Function(LocusDto) then) =
      _$LocusDtoCopyWithImpl<$Res>;
  $Res call(
      {String name,
      int length,
      String type,
      String organism,
      String? shape,
      String? releaseDate,
      String? sequence,
      List<FeatureDto>? features});
}

/// @nodoc
class _$LocusDtoCopyWithImpl<$Res> implements $LocusDtoCopyWith<$Res> {
  _$LocusDtoCopyWithImpl(this._value, this._then);

  final LocusDto _value;
  // ignore: unused_field
  final $Res Function(LocusDto) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? length = freezed,
    Object? type = freezed,
    Object? organism = freezed,
    Object? shape = freezed,
    Object? releaseDate = freezed,
    Object? sequence = freezed,
    Object? features = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      length: length == freezed
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      organism: organism == freezed
          ? _value.organism
          : organism // ignore: cast_nullable_to_non_nullable
              as String,
      shape: shape == freezed
          ? _value.shape
          : shape // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseDate: releaseDate == freezed
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String?,
      sequence: sequence == freezed
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as String?,
      features: features == freezed
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<FeatureDto>?,
    ));
  }
}

/// @nodoc
abstract class _$LocusDtoCopyWith<$Res> implements $LocusDtoCopyWith<$Res> {
  factory _$LocusDtoCopyWith(_LocusDto value, $Res Function(_LocusDto) then) =
      __$LocusDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      int length,
      String type,
      String organism,
      String? shape,
      String? releaseDate,
      String? sequence,
      List<FeatureDto>? features});
}

/// @nodoc
class __$LocusDtoCopyWithImpl<$Res> extends _$LocusDtoCopyWithImpl<$Res>
    implements _$LocusDtoCopyWith<$Res> {
  __$LocusDtoCopyWithImpl(_LocusDto _value, $Res Function(_LocusDto) _then)
      : super(_value, (v) => _then(v as _LocusDto));

  @override
  _LocusDto get _value => super._value as _LocusDto;

  @override
  $Res call({
    Object? name = freezed,
    Object? length = freezed,
    Object? type = freezed,
    Object? organism = freezed,
    Object? shape = freezed,
    Object? releaseDate = freezed,
    Object? sequence = freezed,
    Object? features = freezed,
  }) {
    return _then(_LocusDto(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      length: length == freezed
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      organism: organism == freezed
          ? _value.organism
          : organism // ignore: cast_nullable_to_non_nullable
              as String,
      shape: shape == freezed
          ? _value.shape
          : shape // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseDate: releaseDate == freezed
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String?,
      sequence: sequence == freezed
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as String?,
      features: features == freezed
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<FeatureDto>?,
    ));
  }
}

/// @nodoc

class _$_LocusDto extends _LocusDto {
  const _$_LocusDto(
      {required this.name,
      required this.length,
      required this.type,
      required this.organism,
      this.shape,
      this.releaseDate,
      this.sequence,
      this.features})
      : super._();

  @override
  final String name;
  @override
  final int length;
  @override
  final String type;
  @override
  final String organism;
  @override
  final String? shape;
  @override
  final String? releaseDate;
  @override
  final String? sequence;
  @override
  final List<FeatureDto>? features;

  @override
  String toString() {
    return 'LocusDto(name: $name, length: $length, type: $type, organism: $organism, shape: $shape, releaseDate: $releaseDate, sequence: $sequence, features: $features)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LocusDto &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.length, length) ||
                const DeepCollectionEquality().equals(other.length, length)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.organism, organism) ||
                const DeepCollectionEquality()
                    .equals(other.organism, organism)) &&
            (identical(other.shape, shape) ||
                const DeepCollectionEquality().equals(other.shape, shape)) &&
            (identical(other.releaseDate, releaseDate) ||
                const DeepCollectionEquality()
                    .equals(other.releaseDate, releaseDate)) &&
            (identical(other.sequence, sequence) ||
                const DeepCollectionEquality()
                    .equals(other.sequence, sequence)) &&
            (identical(other.features, features) ||
                const DeepCollectionEquality()
                    .equals(other.features, features)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(length) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(organism) ^
      const DeepCollectionEquality().hash(shape) ^
      const DeepCollectionEquality().hash(releaseDate) ^
      const DeepCollectionEquality().hash(sequence) ^
      const DeepCollectionEquality().hash(features);

  @JsonKey(ignore: true)
  @override
  _$LocusDtoCopyWith<_LocusDto> get copyWith =>
      __$LocusDtoCopyWithImpl<_LocusDto>(this, _$identity);
}

abstract class _LocusDto extends LocusDto {
  const factory _LocusDto(
      {required String name,
      required int length,
      required String type,
      required String organism,
      String? shape,
      String? releaseDate,
      String? sequence,
      List<FeatureDto>? features}) = _$_LocusDto;
  const _LocusDto._() : super._();

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  int get length => throw _privateConstructorUsedError;
  @override
  String get type => throw _privateConstructorUsedError;
  @override
  String get organism => throw _privateConstructorUsedError;
  @override
  String? get shape => throw _privateConstructorUsedError;
  @override
  String? get releaseDate => throw _privateConstructorUsedError;
  @override
  String? get sequence => throw _privateConstructorUsedError;
  @override
  List<FeatureDto>? get features => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LocusDtoCopyWith<_LocusDto> get copyWith =>
      throw _privateConstructorUsedError;
}
