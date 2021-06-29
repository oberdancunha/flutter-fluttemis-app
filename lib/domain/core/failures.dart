import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.fileNotFound({
    required String fileName,
    required String fileType,
  }) = _FileNotFound;
  const factory Failure.fileParserError({
    required String fileName,
    required String fileType,
    required Object error,
  }) = _ParserError;
  const factory Failure.fileIsEmpty({
    required String fileName,
    required String fileType,
  }) = _FileIsEmpty;
  const factory Failure.fileFormatIncorrect({
    required String fileName,
    required String fileType,
  }) = _FileFormatIncorrect;
}
