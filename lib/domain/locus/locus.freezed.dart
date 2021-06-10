// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'locus.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LocusTearOff {
  const _$LocusTearOff();

  _Locus call(
      {required String name,
      required int length,
      required String type,
      required String organism,
      String? shape,
      String? releaseDate,
      String? sequence,
      KtList<Feature>? features}) {
    return _Locus(
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
const $Locus = _$LocusTearOff();

/// @nodoc
mixin _$Locus {
  String get name => throw _privateConstructorUsedError;
  int get length => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get organism => throw _privateConstructorUsedError;
  String? get shape => throw _privateConstructorUsedError;
  String? get releaseDate => throw _privateConstructorUsedError;
  String? get sequence => throw _privateConstructorUsedError;
  KtList<Feature>? get features => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocusCopyWith<Locus> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocusCopyWith<$Res> {
  factory $LocusCopyWith(Locus value, $Res Function(Locus) then) =
      _$LocusCopyWithImpl<$Res>;
  $Res call(
      {String name,
      int length,
      String type,
      String organism,
      String? shape,
      String? releaseDate,
      String? sequence,
      KtList<Feature>? features});
}

/// @nodoc
class _$LocusCopyWithImpl<$Res> implements $LocusCopyWith<$Res> {
  _$LocusCopyWithImpl(this._value, this._then);

  final Locus _value;
  // ignore: unused_field
  final $Res Function(Locus) _then;

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
              as KtList<Feature>?,
    ));
  }
}

/// @nodoc
abstract class _$LocusCopyWith<$Res> implements $LocusCopyWith<$Res> {
  factory _$LocusCopyWith(_Locus value, $Res Function(_Locus) then) =
      __$LocusCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      int length,
      String type,
      String organism,
      String? shape,
      String? releaseDate,
      String? sequence,
      KtList<Feature>? features});
}

/// @nodoc
class __$LocusCopyWithImpl<$Res> extends _$LocusCopyWithImpl<$Res>
    implements _$LocusCopyWith<$Res> {
  __$LocusCopyWithImpl(_Locus _value, $Res Function(_Locus) _then)
      : super(_value, (v) => _then(v as _Locus));

  @override
  _Locus get _value => super._value as _Locus;

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
    return _then(_Locus(
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
              as KtList<Feature>?,
    ));
  }
}

/// @nodoc

class _$_Locus extends _Locus {
  const _$_Locus(
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
  final KtList<Feature>? features;

  @override
  String toString() {
    return 'Locus(name: $name, length: $length, type: $type, organism: $organism, shape: $shape, releaseDate: $releaseDate, sequence: $sequence, features: $features)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Locus &&
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
  _$LocusCopyWith<_Locus> get copyWith =>
      __$LocusCopyWithImpl<_Locus>(this, _$identity);
}

abstract class _Locus extends Locus {
  const factory _Locus(
      {required String name,
      required int length,
      required String type,
      required String organism,
      String? shape,
      String? releaseDate,
      String? sequence,
      KtList<Feature>? features}) = _$_Locus;
  const _Locus._() : super._();

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
  KtList<Feature>? get features => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LocusCopyWith<_Locus> get copyWith => throw _privateConstructorUsedError;
}
