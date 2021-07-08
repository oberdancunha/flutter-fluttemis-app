import 'dart:io' show Platform;

import 'package:dartz/dartz.dart';
import 'package:fluttemis/domain/core/failures.dart';
import 'package:fluttemis/external/locus/locus_data_source_genbank_file.dart';
import 'package:fluttemis/infrastructure/locus/locus_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as path;
import "package:path/path.dart" show dirname;

import '../../data/genbank_dto.dart';

void main() {
  late LocusDataSourceGenbankFile locusDataSourceGenbankFile;
  late String basePath;

  setUpAll(() {
    basePath = path.fromUri(dirname(Platform.script.toString()));
  });

  Future<Either<Failure, List<LocusDto>>> locusDataSourceGenbankFileGet() =>
      locusDataSourceGenbankFile.getLocus();

  group(
    'Success | ',
    () {
      test(
        'Should return locusDto list (right(List<LocusDto>))',
        () async {
          final genbankFile = path.join(basePath, 'test/data/sequence.gb');
          locusDataSourceGenbankFile = LocusDataSourceGenbankFile(genbankFile: genbankFile);
          final listLocusDtoMocked = getLocusDto();
          final listLocus = await locusDataSourceGenbankFileGet();
          expect(listLocus.toString(), equals(right(listLocusDtoMocked).toString()));
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
          const fileName = 'sequence1.gb';
          final genbankFileNotFound = path.join(basePath, 'test/data/$fileName');
          locusDataSourceGenbankFile = LocusDataSourceGenbankFile(genbankFile: genbankFileNotFound);
          final listLocus = await locusDataSourceGenbankFileGet();
          expect(
            listLocus,
            equals(
              left(
                const Failure.fileNotFound(
                  fileName: fileName,
                  fileType: 'genbank',
                ),
              ),
            ),
          );
        },
      );

      test(
        'Should return a Failure.fileIsEmpty when file is empty',
        () async {
          const fileName = 'sequence_empty.gb';
          final genbankFileEmpty = path.join(basePath, 'test/data/$fileName');
          locusDataSourceGenbankFile = LocusDataSourceGenbankFile(genbankFile: genbankFileEmpty);
          final listLocus = await locusDataSourceGenbankFileGet();
          expect(
            listLocus,
            equals(
              left(
                const Failure.fileEmpty(
                  fileName: fileName,
                  fileType: 'genbank',
                ),
              ),
            ),
          );
        },
      );

      test(
        'Should return a Failure.fileFormatIncorrect when file format is not a genbank',
        () async {
          const fileName = 'sequence_invalid_format.gb';
          final genbankFileInvalidFormat = path.join(basePath, 'test/data/$fileName');
          locusDataSourceGenbankFile =
              LocusDataSourceGenbankFile(genbankFile: genbankFileInvalidFormat);
          final listLocus = await locusDataSourceGenbankFileGet();
          expect(
            listLocus,
            equals(
              left(
                const Failure.fileFormatIncorrect(
                  fileName: fileName,
                  fileType: 'genbank',
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
