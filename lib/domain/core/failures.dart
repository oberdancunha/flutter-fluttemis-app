import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.fileNotFound({
    required String fileName,
    required String fileType,
  }) = _FileNotFound;
  const factory Failure.fileParseError({
    required String fileName,
    required String fileType,
    required Object error,
  }) = _FileParseError;
  const factory Failure.fileEmpty({
    required String fileName,
    required String fileType,
  }) = _FileEmpty;
  const factory Failure.fileFormatIncorrect({
    required String fileName,
    required String fileType,
  }) = _FileFormatIncorrect;
}
