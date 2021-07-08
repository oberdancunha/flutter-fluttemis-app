import 'package:dartz/dartz.dart';
import 'package:fluttemis/domain/core/failures.dart';
import 'package:fluttemis/infrastructure/locus/i_locus_data_source.dart';
import 'package:fluttemis/domain/locus/locus.dart';
import 'package:fluttemis/infrastructure/locus/locus_dto.dart';
import 'package:fluttemis/infrastructure/locus/locus_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kt_dart/kt.dart';
import 'package:mocktail/mocktail.dart';

import '../../data/genbank_data.dart';
import '../../data/genbank_dto.dart';

class LocusDataSourceMock extends Mock implements ILocusDataSource {}

void main() {
  late LocusRepository locusRepository;
  late LocusDataSourceMock locusDataSourceMock;

  setUpAll(() {
    locusDataSourceMock = LocusDataSourceMock();
    locusRepository = LocusRepository(locusDataSource: locusDataSourceMock);
  });

  Future<Either<Failure, KtList<Locus>>> locusRepositoryGet() => locusRepository.getLocus();

  group(
    'Success | ',
    () {
      void mockDataSourceGetLocusSuccess() {
        when(locusDataSourceMock.getLocus)
            .thenAnswer((_) async => right<Failure, List<LocusDto>>(getLocusDto()));
      }

      test(
        'Should return a immutable locus entity list (right(KtList<Locus>))',
        () async {
          mockDataSourceGetLocusSuccess();
          final locusMocked = getLocus();
          final listLocus = await locusRepositoryGet();
          expect(listLocus, equals(right(locusMocked)));
        },
      );
    },
  );

  group(
    'Failure | ',
    () {
      const fileName = 'test.gb';
      const fileType = 'genbank';

      test(
        'Should return a Failure.fileNotFound when file not exists',
        () async {
          when(locusDataSourceMock.getLocus).thenAnswer(
            (_) async => left<Failure, List<LocusDto>>(
              const Failure.fileNotFound(
                fileName: fileName,
                fileType: fileType,
              ),
            ),
          );
          final listLocus = await locusRepositoryGet();
          expect(
            listLocus,
            equals(
              left(
                const Failure.fileNotFound(
                  fileName: fileName,
                  fileType: fileType,
                ),
              ),
            ),
          );
        },
      );

      test(
        'Should return a Failure.fileIsEmpty when file is empty',
        () async {
          when(locusDataSourceMock.getLocus).thenAnswer(
            (_) async => left<Failure, List<LocusDto>>(
              const Failure.fileEmpty(
                fileName: fileName,
                fileType: fileType,
              ),
            ),
          );
          final listLocus = await locusRepositoryGet();
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
          when(locusDataSourceMock.getLocus).thenAnswer(
            (_) async => left<Failure, List<LocusDto>>(
              const Failure.fileFormatIncorrect(
                fileName: fileName,
                fileType: fileType,
              ),
            ),
          );
          final listLocus = await locusRepositoryGet();
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

      test(
        'Should return a Failure.fileParseError when there are an unexpected error',
        () async {
          when(locusDataSourceMock.getLocus).thenAnswer(
            (_) async => left<Failure, List<LocusDto>>(
              const Failure.fileParseError(
                fileName: fileName,
                fileType: fileType,
                error: {},
              ),
            ),
          );
          final listLocus = await locusRepositoryGet();
          expect(
            listLocus,
            equals(
              left(
                const Failure.fileParseError(
                  fileName: fileName,
                  fileType: 'genbank',
                  error: {},
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
