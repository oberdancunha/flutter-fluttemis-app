// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'locus_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LocusEventTearOff {
  const _$LocusEventTearOff();

  _GetLocus getLocus() {
    return const _GetLocus();
  }

  _ShowLocus showLocus({required String locusSearching}) {
    return _ShowLocus(
      locusSearching: locusSearching,
    );
  }

  _ShowLocusFeature showLocusFeature({required Feature locusFeature}) {
    return _ShowLocusFeature(
      locusFeature: locusFeature,
    );
  }
}

/// @nodoc
const $LocusEvent = _$LocusEventTearOff();

/// @nodoc
mixin _$LocusEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getLocus,
    required TResult Function(String locusSearching) showLocus,
    required TResult Function(Feature locusFeature) showLocusFeature,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getLocus,
    TResult Function(String locusSearching)? showLocus,
    TResult Function(Feature locusFeature)? showLocusFeature,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetLocus value) getLocus,
    required TResult Function(_ShowLocus value) showLocus,
    required TResult Function(_ShowLocusFeature value) showLocusFeature,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetLocus value)? getLocus,
    TResult Function(_ShowLocus value)? showLocus,
    TResult Function(_ShowLocusFeature value)? showLocusFeature,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocusEventCopyWith<$Res> {
  factory $LocusEventCopyWith(
          LocusEvent value, $Res Function(LocusEvent) then) =
      _$LocusEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$LocusEventCopyWithImpl<$Res> implements $LocusEventCopyWith<$Res> {
  _$LocusEventCopyWithImpl(this._value, this._then);

  final LocusEvent _value;
  // ignore: unused_field
  final $Res Function(LocusEvent) _then;
}

/// @nodoc
abstract class _$GetLocusCopyWith<$Res> {
  factory _$GetLocusCopyWith(_GetLocus value, $Res Function(_GetLocus) then) =
      __$GetLocusCopyWithImpl<$Res>;
}

/// @nodoc
class __$GetLocusCopyWithImpl<$Res> extends _$LocusEventCopyWithImpl<$Res>
    implements _$GetLocusCopyWith<$Res> {
  __$GetLocusCopyWithImpl(_GetLocus _value, $Res Function(_GetLocus) _then)
      : super(_value, (v) => _then(v as _GetLocus));

  @override
  _GetLocus get _value => super._value as _GetLocus;
}

/// @nodoc

class _$_GetLocus implements _GetLocus {
  const _$_GetLocus();

  @override
  String toString() {
    return 'LocusEvent.getLocus()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _GetLocus);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getLocus,
    required TResult Function(String locusSearching) showLocus,
    required TResult Function(Feature locusFeature) showLocusFeature,
  }) {
    return getLocus();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getLocus,
    TResult Function(String locusSearching)? showLocus,
    TResult Function(Feature locusFeature)? showLocusFeature,
    required TResult orElse(),
  }) {
    if (getLocus != null) {
      return getLocus();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetLocus value) getLocus,
    required TResult Function(_ShowLocus value) showLocus,
    required TResult Function(_ShowLocusFeature value) showLocusFeature,
  }) {
    return getLocus(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetLocus value)? getLocus,
    TResult Function(_ShowLocus value)? showLocus,
    TResult Function(_ShowLocusFeature value)? showLocusFeature,
    required TResult orElse(),
  }) {
    if (getLocus != null) {
      return getLocus(this);
    }
    return orElse();
  }
}

abstract class _GetLocus implements LocusEvent {
  const factory _GetLocus() = _$_GetLocus;
}

/// @nodoc
abstract class _$ShowLocusCopyWith<$Res> {
  factory _$ShowLocusCopyWith(
          _ShowLocus value, $Res Function(_ShowLocus) then) =
      __$ShowLocusCopyWithImpl<$Res>;
  $Res call({String locusSearching});
}

/// @nodoc
class __$ShowLocusCopyWithImpl<$Res> extends _$LocusEventCopyWithImpl<$Res>
    implements _$ShowLocusCopyWith<$Res> {
  __$ShowLocusCopyWithImpl(_ShowLocus _value, $Res Function(_ShowLocus) _then)
      : super(_value, (v) => _then(v as _ShowLocus));

  @override
  _ShowLocus get _value => super._value as _ShowLocus;

  @override
  $Res call({
    Object? locusSearching = freezed,
  }) {
    return _then(_ShowLocus(
      locusSearching: locusSearching == freezed
          ? _value.locusSearching
          : locusSearching // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ShowLocus implements _ShowLocus {
  const _$_ShowLocus({required this.locusSearching});

  @override
  final String locusSearching;

  @override
  String toString() {
    return 'LocusEvent.showLocus(locusSearching: $locusSearching)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ShowLocus &&
            (identical(other.locusSearching, locusSearching) ||
                const DeepCollectionEquality()
                    .equals(other.locusSearching, locusSearching)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(locusSearching);

  @JsonKey(ignore: true)
  @override
  _$ShowLocusCopyWith<_ShowLocus> get copyWith =>
      __$ShowLocusCopyWithImpl<_ShowLocus>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getLocus,
    required TResult Function(String locusSearching) showLocus,
    required TResult Function(Feature locusFeature) showLocusFeature,
  }) {
    return showLocus(locusSearching);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getLocus,
    TResult Function(String locusSearching)? showLocus,
    TResult Function(Feature locusFeature)? showLocusFeature,
    required TResult orElse(),
  }) {
    if (showLocus != null) {
      return showLocus(locusSearching);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetLocus value) getLocus,
    required TResult Function(_ShowLocus value) showLocus,
    required TResult Function(_ShowLocusFeature value) showLocusFeature,
  }) {
    return showLocus(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetLocus value)? getLocus,
    TResult Function(_ShowLocus value)? showLocus,
    TResult Function(_ShowLocusFeature value)? showLocusFeature,
    required TResult orElse(),
  }) {
    if (showLocus != null) {
      return showLocus(this);
    }
    return orElse();
  }
}

abstract class _ShowLocus implements LocusEvent {
  const factory _ShowLocus({required String locusSearching}) = _$_ShowLocus;

  String get locusSearching => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$ShowLocusCopyWith<_ShowLocus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ShowLocusFeatureCopyWith<$Res> {
  factory _$ShowLocusFeatureCopyWith(
          _ShowLocusFeature value, $Res Function(_ShowLocusFeature) then) =
      __$ShowLocusFeatureCopyWithImpl<$Res>;
  $Res call({Feature locusFeature});

  $FeatureCopyWith<$Res> get locusFeature;
}

/// @nodoc
class __$ShowLocusFeatureCopyWithImpl<$Res>
    extends _$LocusEventCopyWithImpl<$Res>
    implements _$ShowLocusFeatureCopyWith<$Res> {
  __$ShowLocusFeatureCopyWithImpl(
      _ShowLocusFeature _value, $Res Function(_ShowLocusFeature) _then)
      : super(_value, (v) => _then(v as _ShowLocusFeature));

  @override
  _ShowLocusFeature get _value => super._value as _ShowLocusFeature;

  @override
  $Res call({
    Object? locusFeature = freezed,
  }) {
    return _then(_ShowLocusFeature(
      locusFeature: locusFeature == freezed
          ? _value.locusFeature
          : locusFeature // ignore: cast_nullable_to_non_nullable
              as Feature,
    ));
  }

  @override
  $FeatureCopyWith<$Res> get locusFeature {
    return $FeatureCopyWith<$Res>(_value.locusFeature, (value) {
      return _then(_value.copyWith(locusFeature: value));
    });
  }
}

/// @nodoc

class _$_ShowLocusFeature implements _ShowLocusFeature {
  const _$_ShowLocusFeature({required this.locusFeature});

  @override
  final Feature locusFeature;

  @override
  String toString() {
    return 'LocusEvent.showLocusFeature(locusFeature: $locusFeature)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ShowLocusFeature &&
            (identical(other.locusFeature, locusFeature) ||
                const DeepCollectionEquality()
                    .equals(other.locusFeature, locusFeature)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(locusFeature);

  @JsonKey(ignore: true)
  @override
  _$ShowLocusFeatureCopyWith<_ShowLocusFeature> get copyWith =>
      __$ShowLocusFeatureCopyWithImpl<_ShowLocusFeature>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getLocus,
    required TResult Function(String locusSearching) showLocus,
    required TResult Function(Feature locusFeature) showLocusFeature,
  }) {
    return showLocusFeature(locusFeature);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getLocus,
    TResult Function(String locusSearching)? showLocus,
    TResult Function(Feature locusFeature)? showLocusFeature,
    required TResult orElse(),
  }) {
    if (showLocusFeature != null) {
      return showLocusFeature(locusFeature);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetLocus value) getLocus,
    required TResult Function(_ShowLocus value) showLocus,
    required TResult Function(_ShowLocusFeature value) showLocusFeature,
  }) {
    return showLocusFeature(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetLocus value)? getLocus,
    TResult Function(_ShowLocus value)? showLocus,
    TResult Function(_ShowLocusFeature value)? showLocusFeature,
    required TResult orElse(),
  }) {
    if (showLocusFeature != null) {
      return showLocusFeature(this);
    }
    return orElse();
  }
}

abstract class _ShowLocusFeature implements LocusEvent {
  const factory _ShowLocusFeature({required Feature locusFeature}) =
      _$_ShowLocusFeature;

  Feature get locusFeature => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$ShowLocusFeatureCopyWith<_ShowLocusFeature> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$LocusStateTearOff {
  const _$LocusStateTearOff();

  _LocusState call(
      {required Option<Either<Failure, KtList<Locus>>> locusFailureOrSuccess,
      required bool isSearching,
      required KtList<Locus> locusList,
      required Locus locusShowed,
      Feature? locusFeatureShowed}) {
    return _LocusState(
      locusFailureOrSuccess: locusFailureOrSuccess,
      isSearching: isSearching,
      locusList: locusList,
      locusShowed: locusShowed,
      locusFeatureShowed: locusFeatureShowed,
    );
  }
}

/// @nodoc
const $LocusState = _$LocusStateTearOff();

/// @nodoc
mixin _$LocusState {
  Option<Either<Failure, KtList<Locus>>> get locusFailureOrSuccess =>
      throw _privateConstructorUsedError;
  bool get isSearching => throw _privateConstructorUsedError;
  KtList<Locus> get locusList => throw _privateConstructorUsedError;
  Locus get locusShowed => throw _privateConstructorUsedError;
  Feature? get locusFeatureShowed => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocusStateCopyWith<LocusState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocusStateCopyWith<$Res> {
  factory $LocusStateCopyWith(
          LocusState value, $Res Function(LocusState) then) =
      _$LocusStateCopyWithImpl<$Res>;
  $Res call(
      {Option<Either<Failure, KtList<Locus>>> locusFailureOrSuccess,
      bool isSearching,
      KtList<Locus> locusList,
      Locus locusShowed,
      Feature? locusFeatureShowed});

  $LocusCopyWith<$Res> get locusShowed;
  $FeatureCopyWith<$Res>? get locusFeatureShowed;
}

/// @nodoc
class _$LocusStateCopyWithImpl<$Res> implements $LocusStateCopyWith<$Res> {
  _$LocusStateCopyWithImpl(this._value, this._then);

  final LocusState _value;
  // ignore: unused_field
  final $Res Function(LocusState) _then;

  @override
  $Res call({
    Object? locusFailureOrSuccess = freezed,
    Object? isSearching = freezed,
    Object? locusList = freezed,
    Object? locusShowed = freezed,
    Object? locusFeatureShowed = freezed,
  }) {
    return _then(_value.copyWith(
      locusFailureOrSuccess: locusFailureOrSuccess == freezed
          ? _value.locusFailureOrSuccess
          : locusFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<Failure, KtList<Locus>>>,
      isSearching: isSearching == freezed
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      locusList: locusList == freezed
          ? _value.locusList
          : locusList // ignore: cast_nullable_to_non_nullable
              as KtList<Locus>,
      locusShowed: locusShowed == freezed
          ? _value.locusShowed
          : locusShowed // ignore: cast_nullable_to_non_nullable
              as Locus,
      locusFeatureShowed: locusFeatureShowed == freezed
          ? _value.locusFeatureShowed
          : locusFeatureShowed // ignore: cast_nullable_to_non_nullable
              as Feature?,
    ));
  }

  @override
  $LocusCopyWith<$Res> get locusShowed {
    return $LocusCopyWith<$Res>(_value.locusShowed, (value) {
      return _then(_value.copyWith(locusShowed: value));
    });
  }

  @override
  $FeatureCopyWith<$Res>? get locusFeatureShowed {
    if (_value.locusFeatureShowed == null) {
      return null;
    }

    return $FeatureCopyWith<$Res>(_value.locusFeatureShowed!, (value) {
      return _then(_value.copyWith(locusFeatureShowed: value));
    });
  }
}

/// @nodoc
abstract class _$LocusStateCopyWith<$Res> implements $LocusStateCopyWith<$Res> {
  factory _$LocusStateCopyWith(
          _LocusState value, $Res Function(_LocusState) then) =
      __$LocusStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Option<Either<Failure, KtList<Locus>>> locusFailureOrSuccess,
      bool isSearching,
      KtList<Locus> locusList,
      Locus locusShowed,
      Feature? locusFeatureShowed});

  @override
  $LocusCopyWith<$Res> get locusShowed;
  @override
  $FeatureCopyWith<$Res>? get locusFeatureShowed;
}

/// @nodoc
class __$LocusStateCopyWithImpl<$Res> extends _$LocusStateCopyWithImpl<$Res>
    implements _$LocusStateCopyWith<$Res> {
  __$LocusStateCopyWithImpl(
      _LocusState _value, $Res Function(_LocusState) _then)
      : super(_value, (v) => _then(v as _LocusState));

  @override
  _LocusState get _value => super._value as _LocusState;

  @override
  $Res call({
    Object? locusFailureOrSuccess = freezed,
    Object? isSearching = freezed,
    Object? locusList = freezed,
    Object? locusShowed = freezed,
    Object? locusFeatureShowed = freezed,
  }) {
    return _then(_LocusState(
      locusFailureOrSuccess: locusFailureOrSuccess == freezed
          ? _value.locusFailureOrSuccess
          : locusFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<Failure, KtList<Locus>>>,
      isSearching: isSearching == freezed
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      locusList: locusList == freezed
          ? _value.locusList
          : locusList // ignore: cast_nullable_to_non_nullable
              as KtList<Locus>,
      locusShowed: locusShowed == freezed
          ? _value.locusShowed
          : locusShowed // ignore: cast_nullable_to_non_nullable
              as Locus,
      locusFeatureShowed: locusFeatureShowed == freezed
          ? _value.locusFeatureShowed
          : locusFeatureShowed // ignore: cast_nullable_to_non_nullable
              as Feature?,
    ));
  }
}

/// @nodoc

class _$_LocusState implements _LocusState {
  const _$_LocusState(
      {required this.locusFailureOrSuccess,
      required this.isSearching,
      required this.locusList,
      required this.locusShowed,
      this.locusFeatureShowed});

  @override
  final Option<Either<Failure, KtList<Locus>>> locusFailureOrSuccess;
  @override
  final bool isSearching;
  @override
  final KtList<Locus> locusList;
  @override
  final Locus locusShowed;
  @override
  final Feature? locusFeatureShowed;

  @override
  String toString() {
    return 'LocusState(locusFailureOrSuccess: $locusFailureOrSuccess, isSearching: $isSearching, locusList: $locusList, locusShowed: $locusShowed, locusFeatureShowed: $locusFeatureShowed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LocusState &&
            (identical(other.locusFailureOrSuccess, locusFailureOrSuccess) ||
                const DeepCollectionEquality().equals(
                    other.locusFailureOrSuccess, locusFailureOrSuccess)) &&
            (identical(other.isSearching, isSearching) ||
                const DeepCollectionEquality()
                    .equals(other.isSearching, isSearching)) &&
            (identical(other.locusList, locusList) ||
                const DeepCollectionEquality()
                    .equals(other.locusList, locusList)) &&
            (identical(other.locusShowed, locusShowed) ||
                const DeepCollectionEquality()
                    .equals(other.locusShowed, locusShowed)) &&
            (identical(other.locusFeatureShowed, locusFeatureShowed) ||
                const DeepCollectionEquality()
                    .equals(other.locusFeatureShowed, locusFeatureShowed)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(locusFailureOrSuccess) ^
      const DeepCollectionEquality().hash(isSearching) ^
      const DeepCollectionEquality().hash(locusList) ^
      const DeepCollectionEquality().hash(locusShowed) ^
      const DeepCollectionEquality().hash(locusFeatureShowed);

  @JsonKey(ignore: true)
  @override
  _$LocusStateCopyWith<_LocusState> get copyWith =>
      __$LocusStateCopyWithImpl<_LocusState>(this, _$identity);
}

abstract class _LocusState implements LocusState {
  const factory _LocusState(
      {required Option<Either<Failure, KtList<Locus>>> locusFailureOrSuccess,
      required bool isSearching,
      required KtList<Locus> locusList,
      required Locus locusShowed,
      Feature? locusFeatureShowed}) = _$_LocusState;

  @override
  Option<Either<Failure, KtList<Locus>>> get locusFailureOrSuccess =>
      throw _privateConstructorUsedError;
  @override
  bool get isSearching => throw _privateConstructorUsedError;
  @override
  KtList<Locus> get locusList => throw _privateConstructorUsedError;
  @override
  Locus get locusShowed => throw _privateConstructorUsedError;
  @override
  Feature? get locusFeatureShowed => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LocusStateCopyWith<_LocusState> get copyWith =>
      throw _privateConstructorUsedError;
}
