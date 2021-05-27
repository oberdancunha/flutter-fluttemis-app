import 'dart:io' show Platform;

import 'package:dartz/dartz.dart';
import 'package:fluttemis/domain/core/failures.dart';
import 'package:fluttemis/domain/locus/locus.dart';
import 'package:fluttemis/infrastructure/locus_data_source_genbank_file.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kt_dart/collection.dart';
import 'package:path/path.dart' as path;
import "package:path/path.dart" show dirname;

import '../data/genbank_data.dart';

void main() {
  late LocusDataSourceGenbankFile locusDataSourceGenbankFile;
  late String basePath;

  setUpAll(() {
    basePath = path.fromUri(dirname(Platform.script.toString()));
  });

  Future<Either<Failure, KtList<Locus>>> locusDataSourceGenbankFileGet() =>
      locusDataSourceGenbankFile.getLocus();

  group(
    'Success | ',
    () {
      test(
        'Should return a immutable locus entity list (right(KtList<Locus>))',
        () async {
          final genbankFile = path.join(basePath, 'test/data/sequence.gb');
          locusDataSourceGenbankFile = LocusDataSourceGenbankFile(genbankFile: genbankFile);
          final listLocusMocked = getLocus();
          final listLocus = await locusDataSourceGenbankFileGet();
          expect(listLocus, equals(right(listLocusMocked)));
        },
      );
    },
  );

  group(
    'Failure | ',
    () {
      test(
        'Should return a Failure.fileNotFound when file not exists',
        () async {
          final genbankFileNotFound = path.join(basePath, 'test/data/sequence1.gb');
          locusDataSourceGenbankFile = LocusDataSourceGenbankFile(genbankFile: genbankFileNotFound);
          final listLocus = await locusDataSourceGenbankFileGet();
          expect(listLocus, equals(left(const Failure.fileNotFound())));
        },
      );

      test(
        'Should return a Failure.fileIsEmpty when file is empty',
        () async {
          final genbankFileEmpty = path.join(basePath, 'test/data/sequence_empty.gb');
          locusDataSourceGenbankFile = LocusDataSourceGenbankFile(genbankFile: genbankFileEmpty);
          final listLocus = await locusDataSourceGenbankFileGet();
          expect(listLocus, equals(left(const Failure.fileIsEmpty())));
        },
      );

      test(
        'Should return a Failure.fileFormatIncorrect when file format is not a genbank',
        () async {
          final genbankFileInvalidFormat =
              path.join(basePath, 'test/data/sequence_invalid_format.gb');
          locusDataSourceGenbankFile =
              LocusDataSourceGenbankFile(genbankFile: genbankFileInvalidFormat);
          final listLocus = await locusDataSourceGenbankFileGet();
          expect(listLocus, equals(left(const Failure.fileFormatIncorrect())));
        },
      );
    },
  );
}
