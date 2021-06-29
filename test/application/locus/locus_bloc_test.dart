import 'package:dartz/dartz.dart';
import 'package:fluttemis/application/locus/locus_bloc.dart';
import 'package:fluttemis/domain/core/failures.dart';
import 'package:fluttemis/domain/locus/feature.dart';
import 'package:fluttemis/domain/locus/i_locus_repository.dart';
import 'package:fluttemis/domain/locus/locus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kt_dart/kt.dart';
import 'package:mocktail/mocktail.dart';

import '../../data/genbank_data.dart';

class MockLocusRepository extends Mock implements ILocusRepository {}

void main() {
  late MockLocusRepository mockLocusRepository;
  late LocusBloc locusBloc;

  setUpAll(() {
    mockLocusRepository = MockLocusRepository();
    locusBloc = LocusBloc(locusRepository: mockLocusRepository);
  });

  test(
    'Should be initial state',
    () {
      expect(locusBloc.state, equals(LocusState.initial()));
    },
  );

  void setUpMockEvent() {
    locusBloc.add(const LocusEvent.getLocus());
  }

  group(
    'Get | ',
    () {
      group(
        'Get success | ',
        () {
          final mockLocus = getLocus();

          void setUpMockGetSuccess() {
            when(() => mockLocusRepository.getLocus()).thenAnswer((_) async => right(mockLocus));
          }

          test(
            'Should get locus',
            () async {
              setUpMockGetSuccess();
              setUpMockEvent();
              await untilCalled(() => mockLocusRepository.getLocus());
              verify(() => mockLocusRepository.getLocus());
            },
          );

          test(
            'Should obtain locus list success',
            () async {
              setUpMockGetSuccess();
              setUpMockEvent();
              await untilCalled(() => mockLocusRepository.getLocus());
              final locus = await mockLocusRepository.getLocus();
              expect(locus, equals(right(mockLocus)));
            },
          );

          test(
            'Should verify list locus success state',
            () async {
              setUpMockGetSuccess();
              setUpMockEvent();
              final expectedStates = [
                LocusState(
                  locusFailureOrSuccess: none(),
                  isSearching: true,
                  locusList: const KtList.empty(),
                  locusShowed: Locus.empty(),
                  locusFeatureShowed: Feature.empty(),
                ),
                LocusState(
                  locusFailureOrSuccess: optionOf(right(mockLocus)),
                  isSearching: false,
                  locusList: mockLocus,
                  locusShowed: mockLocus.first(),
                  locusFeatureShowed: Feature.empty(),
                ),
              ];
              await expectLater(locusBloc.stream, emitsInOrder(expectedStates));
            },
          );
        },
      );

      group(
        'Get failure - fileNotFound | ',
        () {
          void setUpMockGetFailure() {
            when(() => mockLocusRepository.getLocus())
                .thenAnswer((_) async => left(const Failure.fileNotFound(
                      fileName: '',
                      fileType: '',
                    )));
          }

          test(
            'Should obtain a failure',
            () async {
              setUpMockGetFailure();
              setUpMockEvent();
              await untilCalled(() => mockLocusRepository.getLocus());
              final locus = await mockLocusRepository.getLocus();
              expect(
                  locus,
                  equals(left(const Failure.fileNotFound(
                    fileName: '',
                    fileType: '',
                  ))));
            },
          );

          test(
            'Should verify list locus failure state',
            () async {
              setUpMockGetFailure();
              setUpMockEvent();
              final expectedStates = [
                LocusState(
                  locusFailureOrSuccess: none(),
                  isSearching: true,
                  locusList: const KtList.empty(),
                  locusShowed: Locus.empty(),
                  locusFeatureShowed: Feature.empty(),
                ),
                LocusState(
                  locusFailureOrSuccess: optionOf(left(const Failure.fileNotFound(
                    fileName: '',
                    fileType: '',
                  ))),
                  isSearching: false,
                  locusList: const KtList.empty(),
                  locusShowed: Locus.empty(),
                  locusFeatureShowed: Feature.empty(),
                ),
              ];
              await expectLater(locusBloc.stream, emitsInOrder(expectedStates));
            },
          );
        },
      );
    },
  );
}
