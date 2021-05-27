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

  _Get getLocus() {
    return const _Get();
  }
}

/// @nodoc
const $LocusEvent = _$LocusEventTearOff();

/// @nodoc
mixin _$LocusEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getLocus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getLocus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Get value) getLocus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Get value)? getLocus,
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
abstract class _$GetCopyWith<$Res> {
  factory _$GetCopyWith(_Get value, $Res Function(_Get) then) =
      __$GetCopyWithImpl<$Res>;
}

/// @nodoc
class __$GetCopyWithImpl<$Res> extends _$LocusEventCopyWithImpl<$Res>
    implements _$GetCopyWith<$Res> {
  __$GetCopyWithImpl(_Get _value, $Res Function(_Get) _then)
      : super(_value, (v) => _then(v as _Get));

  @override
  _Get get _value => super._value as _Get;
}

/// @nodoc

class _$_Get implements _Get {
  const _$_Get();

  @override
  String toString() {
    return 'LocusEvent.getLocus()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Get);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getLocus,
  }) {
    return getLocus();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getLocus,
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
    required TResult Function(_Get value) getLocus,
  }) {
    return getLocus(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Get value)? getLocus,
    required TResult orElse(),
  }) {
    if (getLocus != null) {
      return getLocus(this);
    }
    return orElse();
  }
}

abstract class _Get implements LocusEvent {
  const factory _Get() = _$_Get;
}

/// @nodoc
class _$LocusStateTearOff {
  const _$LocusStateTearOff();

  _LocusState call(
      {required Option<Either<Failure, KtList<Locus>>> locusFailureOrSuccess,
      required bool isSearching}) {
    return _LocusState(
      locusFailureOrSuccess: locusFailureOrSuccess,
      isSearching: isSearching,
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
      bool isSearching});
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
    ));
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
      bool isSearching});
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
    ));
  }
}

/// @nodoc

class _$_LocusState implements _LocusState {
  const _$_LocusState(
      {required this.locusFailureOrSuccess, required this.isSearching});

  @override
  final Option<Either<Failure, KtList<Locus>>> locusFailureOrSuccess;
  @override
  final bool isSearching;

  @override
  String toString() {
    return 'LocusState(locusFailureOrSuccess: $locusFailureOrSuccess, isSearching: $isSearching)';
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
                    .equals(other.isSearching, isSearching)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(locusFailureOrSuccess) ^
      const DeepCollectionEquality().hash(isSearching);

  @JsonKey(ignore: true)
  @override
  _$LocusStateCopyWith<_LocusState> get copyWith =>
      __$LocusStateCopyWithImpl<_LocusState>(this, _$identity);
}

abstract class _LocusState implements LocusState {
  const factory _LocusState(
      {required Option<Either<Failure, KtList<Locus>>> locusFailureOrSuccess,
      required bool isSearching}) = _$_LocusState;

  @override
  Option<Either<Failure, KtList<Locus>>> get locusFailureOrSuccess =>
      throw _privateConstructorUsedError;
  @override
  bool get isSearching => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LocusStateCopyWith<_LocusState> get copyWith =>
      throw _privateConstructorUsedError;
}
