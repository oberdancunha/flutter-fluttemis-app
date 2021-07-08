// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FailureTearOff {
  const _$FailureTearOff();

  _FileNotFound fileNotFound(
      {required String fileName, required String fileType}) {
    return _FileNotFound(
      fileName: fileName,
      fileType: fileType,
    );
  }

  _FileParseError fileParseError(
      {required String fileName,
      required String fileType,
      required Object error}) {
    return _FileParseError(
      fileName: fileName,
      fileType: fileType,
      error: error,
    );
  }

  _FileEmpty fileEmpty({required String fileName, required String fileType}) {
    return _FileEmpty(
      fileName: fileName,
      fileType: fileType,
    );
  }

  _FileFormatIncorrect fileFormatIncorrect(
      {required String fileName, required String fileType}) {
    return _FileFormatIncorrect(
      fileName: fileName,
      fileType: fileType,
    );
  }
}

/// @nodoc
const $Failure = _$FailureTearOff();

/// @nodoc
mixin _$Failure {
  String get fileName => throw _privateConstructorUsedError;
  String get fileType => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String fileName, String fileType) fileNotFound,
    required TResult Function(String fileName, String fileType, Object error)
        fileParseError,
    required TResult Function(String fileName, String fileType) fileEmpty,
    required TResult Function(String fileName, String fileType)
        fileFormatIncorrect,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String fileName, String fileType)? fileNotFound,
    TResult Function(String fileName, String fileType, Object error)?
        fileParseError,
    TResult Function(String fileName, String fileType)? fileEmpty,
    TResult Function(String fileName, String fileType)? fileFormatIncorrect,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FileNotFound value) fileNotFound,
    required TResult Function(_FileParseError value) fileParseError,
    required TResult Function(_FileEmpty value) fileEmpty,
    required TResult Function(_FileFormatIncorrect value) fileFormatIncorrect,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FileNotFound value)? fileNotFound,
    TResult Function(_FileParseError value)? fileParseError,
    TResult Function(_FileEmpty value)? fileEmpty,
    TResult Function(_FileFormatIncorrect value)? fileFormatIncorrect,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FailureCopyWith<Failure> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res>;
  $Res call({String fileName, String fileType});
}

/// @nodoc
class _$FailureCopyWithImpl<$Res> implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  final Failure _value;
  // ignore: unused_field
  final $Res Function(Failure) _then;

  @override
  $Res call({
    Object? fileName = freezed,
    Object? fileType = freezed,
  }) {
    return _then(_value.copyWith(
      fileName: fileName == freezed
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      fileType: fileType == freezed
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$FileNotFoundCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$FileNotFoundCopyWith(
          _FileNotFound value, $Res Function(_FileNotFound) then) =
      __$FileNotFoundCopyWithImpl<$Res>;
  @override
  $Res call({String fileName, String fileType});
}

/// @nodoc
class __$FileNotFoundCopyWithImpl<$Res> extends _$FailureCopyWithImpl<$Res>
    implements _$FileNotFoundCopyWith<$Res> {
  __$FileNotFoundCopyWithImpl(
      _FileNotFound _value, $Res Function(_FileNotFound) _then)
      : super(_value, (v) => _then(v as _FileNotFound));

  @override
  _FileNotFound get _value => super._value as _FileNotFound;

  @override
  $Res call({
    Object? fileName = freezed,
    Object? fileType = freezed,
  }) {
    return _then(_FileNotFound(
      fileName: fileName == freezed
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      fileType: fileType == freezed
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FileNotFound implements _FileNotFound {
  const _$_FileNotFound({required this.fileName, required this.fileType});

  @override
  final String fileName;
  @override
  final String fileType;

  @override
  String toString() {
    return 'Failure.fileNotFound(fileName: $fileName, fileType: $fileType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FileNotFound &&
            (identical(other.fileName, fileName) ||
                const DeepCollectionEquality()
                    .equals(other.fileName, fileName)) &&
            (identical(other.fileType, fileType) ||
                const DeepCollectionEquality()
                    .equals(other.fileType, fileType)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(fileName) ^
      const DeepCollectionEquality().hash(fileType);

  @JsonKey(ignore: true)
  @override
  _$FileNotFoundCopyWith<_FileNotFound> get copyWith =>
      __$FileNotFoundCopyWithImpl<_FileNotFound>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String fileName, String fileType) fileNotFound,
    required TResult Function(String fileName, String fileType, Object error)
        fileParseError,
    required TResult Function(String fileName, String fileType) fileEmpty,
    required TResult Function(String fileName, String fileType)
        fileFormatIncorrect,
  }) {
    return fileNotFound(fileName, fileType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String fileName, String fileType)? fileNotFound,
    TResult Function(String fileName, String fileType, Object error)?
        fileParseError,
    TResult Function(String fileName, String fileType)? fileEmpty,
    TResult Function(String fileName, String fileType)? fileFormatIncorrect,
    required TResult orElse(),
  }) {
    if (fileNotFound != null) {
      return fileNotFound(fileName, fileType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FileNotFound value) fileNotFound,
    required TResult Function(_FileParseError value) fileParseError,
    required TResult Function(_FileEmpty value) fileEmpty,
    required TResult Function(_FileFormatIncorrect value) fileFormatIncorrect,
  }) {
    return fileNotFound(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FileNotFound value)? fileNotFound,
    TResult Function(_FileParseError value)? fileParseError,
    TResult Function(_FileEmpty value)? fileEmpty,
    TResult Function(_FileFormatIncorrect value)? fileFormatIncorrect,
    required TResult orElse(),
  }) {
    if (fileNotFound != null) {
      return fileNotFound(this);
    }
    return orElse();
  }
}

abstract class _FileNotFound implements Failure {
  const factory _FileNotFound(
      {required String fileName, required String fileType}) = _$_FileNotFound;

  @override
  String get fileName => throw _privateConstructorUsedError;
  @override
  String get fileType => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FileNotFoundCopyWith<_FileNotFound> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$FileParseErrorCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$FileParseErrorCopyWith(
          _FileParseError value, $Res Function(_FileParseError) then) =
      __$FileParseErrorCopyWithImpl<$Res>;
  @override
  $Res call({String fileName, String fileType, Object error});
}

/// @nodoc
class __$FileParseErrorCopyWithImpl<$Res> extends _$FailureCopyWithImpl<$Res>
    implements _$FileParseErrorCopyWith<$Res> {
  __$FileParseErrorCopyWithImpl(
      _FileParseError _value, $Res Function(_FileParseError) _then)
      : super(_value, (v) => _then(v as _FileParseError));

  @override
  _FileParseError get _value => super._value as _FileParseError;

  @override
  $Res call({
    Object? fileName = freezed,
    Object? fileType = freezed,
    Object? error = freezed,
  }) {
    return _then(_FileParseError(
      fileName: fileName == freezed
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      fileType: fileType == freezed
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Object,
    ));
  }
}

/// @nodoc

class _$_FileParseError implements _FileParseError {
  const _$_FileParseError(
      {required this.fileName, required this.fileType, required this.error});

  @override
  final String fileName;
  @override
  final String fileType;
  @override
  final Object error;

  @override
  String toString() {
    return 'Failure.fileParseError(fileName: $fileName, fileType: $fileType, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FileParseError &&
            (identical(other.fileName, fileName) ||
                const DeepCollectionEquality()
                    .equals(other.fileName, fileName)) &&
            (identical(other.fileType, fileType) ||
                const DeepCollectionEquality()
                    .equals(other.fileType, fileType)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(fileName) ^
      const DeepCollectionEquality().hash(fileType) ^
      const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  _$FileParseErrorCopyWith<_FileParseError> get copyWith =>
      __$FileParseErrorCopyWithImpl<_FileParseError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String fileName, String fileType) fileNotFound,
    required TResult Function(String fileName, String fileType, Object error)
        fileParseError,
    required TResult Function(String fileName, String fileType) fileEmpty,
    required TResult Function(String fileName, String fileType)
        fileFormatIncorrect,
  }) {
    return fileParseError(fileName, fileType, error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String fileName, String fileType)? fileNotFound,
    TResult Function(String fileName, String fileType, Object error)?
        fileParseError,
    TResult Function(String fileName, String fileType)? fileEmpty,
    TResult Function(String fileName, String fileType)? fileFormatIncorrect,
    required TResult orElse(),
  }) {
    if (fileParseError != null) {
      return fileParseError(fileName, fileType, error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FileNotFound value) fileNotFound,
    required TResult Function(_FileParseError value) fileParseError,
    required TResult Function(_FileEmpty value) fileEmpty,
    required TResult Function(_FileFormatIncorrect value) fileFormatIncorrect,
  }) {
    return fileParseError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FileNotFound value)? fileNotFound,
    TResult Function(_FileParseError value)? fileParseError,
    TResult Function(_FileEmpty value)? fileEmpty,
    TResult Function(_FileFormatIncorrect value)? fileFormatIncorrect,
    required TResult orElse(),
  }) {
    if (fileParseError != null) {
      return fileParseError(this);
    }
    return orElse();
  }
}

abstract class _FileParseError implements Failure {
  const factory _FileParseError(
      {required String fileName,
      required String fileType,
      required Object error}) = _$_FileParseError;

  @override
  String get fileName => throw _privateConstructorUsedError;
  @override
  String get fileType => throw _privateConstructorUsedError;
  Object get error => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FileParseErrorCopyWith<_FileParseError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$FileEmptyCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$FileEmptyCopyWith(
          _FileEmpty value, $Res Function(_FileEmpty) then) =
      __$FileEmptyCopyWithImpl<$Res>;
  @override
  $Res call({String fileName, String fileType});
}

/// @nodoc
class __$FileEmptyCopyWithImpl<$Res> extends _$FailureCopyWithImpl<$Res>
    implements _$FileEmptyCopyWith<$Res> {
  __$FileEmptyCopyWithImpl(_FileEmpty _value, $Res Function(_FileEmpty) _then)
      : super(_value, (v) => _then(v as _FileEmpty));

  @override
  _FileEmpty get _value => super._value as _FileEmpty;

  @override
  $Res call({
    Object? fileName = freezed,
    Object? fileType = freezed,
  }) {
    return _then(_FileEmpty(
      fileName: fileName == freezed
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      fileType: fileType == freezed
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FileEmpty implements _FileEmpty {
  const _$_FileEmpty({required this.fileName, required this.fileType});

  @override
  final String fileName;
  @override
  final String fileType;

  @override
  String toString() {
    return 'Failure.fileEmpty(fileName: $fileName, fileType: $fileType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FileEmpty &&
            (identical(other.fileName, fileName) ||
                const DeepCollectionEquality()
                    .equals(other.fileName, fileName)) &&
            (identical(other.fileType, fileType) ||
                const DeepCollectionEquality()
                    .equals(other.fileType, fileType)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(fileName) ^
      const DeepCollectionEquality().hash(fileType);

  @JsonKey(ignore: true)
  @override
  _$FileEmptyCopyWith<_FileEmpty> get copyWith =>
      __$FileEmptyCopyWithImpl<_FileEmpty>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String fileName, String fileType) fileNotFound,
    required TResult Function(String fileName, String fileType, Object error)
        fileParseError,
    required TResult Function(String fileName, String fileType) fileEmpty,
    required TResult Function(String fileName, String fileType)
        fileFormatIncorrect,
  }) {
    return fileEmpty(fileName, fileType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String fileName, String fileType)? fileNotFound,
    TResult Function(String fileName, String fileType, Object error)?
        fileParseError,
    TResult Function(String fileName, String fileType)? fileEmpty,
    TResult Function(String fileName, String fileType)? fileFormatIncorrect,
    required TResult orElse(),
  }) {
    if (fileEmpty != null) {
      return fileEmpty(fileName, fileType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FileNotFound value) fileNotFound,
    required TResult Function(_FileParseError value) fileParseError,
    required TResult Function(_FileEmpty value) fileEmpty,
    required TResult Function(_FileFormatIncorrect value) fileFormatIncorrect,
  }) {
    return fileEmpty(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FileNotFound value)? fileNotFound,
    TResult Function(_FileParseError value)? fileParseError,
    TResult Function(_FileEmpty value)? fileEmpty,
    TResult Function(_FileFormatIncorrect value)? fileFormatIncorrect,
    required TResult orElse(),
  }) {
    if (fileEmpty != null) {
      return fileEmpty(this);
    }
    return orElse();
  }
}

abstract class _FileEmpty implements Failure {
  const factory _FileEmpty(
      {required String fileName, required String fileType}) = _$_FileEmpty;

  @override
  String get fileName => throw _privateConstructorUsedError;
  @override
  String get fileType => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FileEmptyCopyWith<_FileEmpty> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$FileFormatIncorrectCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$FileFormatIncorrectCopyWith(_FileFormatIncorrect value,
          $Res Function(_FileFormatIncorrect) then) =
      __$FileFormatIncorrectCopyWithImpl<$Res>;
  @override
  $Res call({String fileName, String fileType});
}

/// @nodoc
class __$FileFormatIncorrectCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res>
    implements _$FileFormatIncorrectCopyWith<$Res> {
  __$FileFormatIncorrectCopyWithImpl(
      _FileFormatIncorrect _value, $Res Function(_FileFormatIncorrect) _then)
      : super(_value, (v) => _then(v as _FileFormatIncorrect));

  @override
  _FileFormatIncorrect get _value => super._value as _FileFormatIncorrect;

  @override
  $Res call({
    Object? fileName = freezed,
    Object? fileType = freezed,
  }) {
    return _then(_FileFormatIncorrect(
      fileName: fileName == freezed
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      fileType: fileType == freezed
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FileFormatIncorrect implements _FileFormatIncorrect {
  const _$_FileFormatIncorrect(
      {required this.fileName, required this.fileType});

  @override
  final String fileName;
  @override
  final String fileType;

  @override
  String toString() {
    return 'Failure.fileFormatIncorrect(fileName: $fileName, fileType: $fileType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FileFormatIncorrect &&
            (identical(other.fileName, fileName) ||
                const DeepCollectionEquality()
                    .equals(other.fileName, fileName)) &&
            (identical(other.fileType, fileType) ||
                const DeepCollectionEquality()
                    .equals(other.fileType, fileType)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(fileName) ^
      const DeepCollectionEquality().hash(fileType);

  @JsonKey(ignore: true)
  @override
  _$FileFormatIncorrectCopyWith<_FileFormatIncorrect> get copyWith =>
      __$FileFormatIncorrectCopyWithImpl<_FileFormatIncorrect>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String fileName, String fileType) fileNotFound,
    required TResult Function(String fileName, String fileType, Object error)
        fileParseError,
    required TResult Function(String fileName, String fileType) fileEmpty,
    required TResult Function(String fileName, String fileType)
        fileFormatIncorrect,
  }) {
    return fileFormatIncorrect(fileName, fileType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String fileName, String fileType)? fileNotFound,
    TResult Function(String fileName, String fileType, Object error)?
        fileParseError,
    TResult Function(String fileName, String fileType)? fileEmpty,
    TResult Function(String fileName, String fileType)? fileFormatIncorrect,
    required TResult orElse(),
  }) {
    if (fileFormatIncorrect != null) {
      return fileFormatIncorrect(fileName, fileType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FileNotFound value) fileNotFound,
    required TResult Function(_FileParseError value) fileParseError,
    required TResult Function(_FileEmpty value) fileEmpty,
    required TResult Function(_FileFormatIncorrect value) fileFormatIncorrect,
  }) {
    return fileFormatIncorrect(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FileNotFound value)? fileNotFound,
    TResult Function(_FileParseError value)? fileParseError,
    TResult Function(_FileEmpty value)? fileEmpty,
    TResult Function(_FileFormatIncorrect value)? fileFormatIncorrect,
    required TResult orElse(),
  }) {
    if (fileFormatIncorrect != null) {
      return fileFormatIncorrect(this);
    }
    return orElse();
  }
}

abstract class _FileFormatIncorrect implements Failure {
  const factory _FileFormatIncorrect(
      {required String fileName,
      required String fileType}) = _$_FileFormatIncorrect;

  @override
  String get fileName => throw _privateConstructorUsedError;
  @override
  String get fileType => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FileFormatIncorrectCopyWith<_FileFormatIncorrect> get copyWith =>
      throw _privateConstructorUsedError;
}
