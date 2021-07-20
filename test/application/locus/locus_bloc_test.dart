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
  late KtList<Locus> mockLocus;

  setUpAll(() {
    mockLocusRepository = MockLocusRepository();
    locusBloc = LocusBloc(locusRepository: mockLocusRepository);
    mockLocus = getLocus();
  });

  void setUpMockGetSuccess() {
    when(() => mockLocusRepository.getLocus()).thenAnswer((_) async => right(mockLocus));
  }

  List<LocusState> setUpMockGetLocusStatesSuccess(KtList<Locus> mockLocus) => [
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

  group(
    'Get locus | ',
    () {
      test(
        'Should be initial state',
        () {
          expect(locusBloc.state, equals(LocusState.initial()));
        },
      );

      void setUpMockGetLocusEvent() {
        locusBloc.add(const LocusEvent.getLocus());
      }

      group(
        'Get success | ',
        () {
          test(
            'Should get locus',
            () async {
              setUpMockGetSuccess();
              setUpMockGetLocusEvent();
              await untilCalled(() => mockLocusRepository.getLocus());
              verify(() => mockLocusRepository.getLocus());
            },
          );

          test(
            'Should obtain locus list success',
            () async {
              setUpMockGetSuccess();
              setUpMockGetLocusEvent();
              await untilCalled(() => mockLocusRepository.getLocus());
              final locus = await mockLocusRepository.getLocus();
              expect(locus, equals(right(mockLocus)));
            },
          );

          test(
            'Should verify list locus success state',
            () async {
              setUpMockGetSuccess();
              setUpMockGetLocusEvent();
              final expectedStates = setUpMockGetLocusStatesSuccess(mockLocus);
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
              setUpMockGetLocusEvent();
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
              setUpMockGetLocusEvent();
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

  group(
    'Show locus | ',
    () {
      final mockLocusList = getMoreOneLocus();

      void setUpMockGetLocusList() {
        when(() => mockLocusRepository.getLocus()).thenAnswer((_) async => right(mockLocusList));
      }

      test(
        'Should return first locus when locus searching is empty',
        () async {
          setUpMockGetLocusList();

          locusBloc
            ..add(const LocusEvent.getLocus())
            ..add(const LocusEvent.showLocus(locusSearching: ''));

          final expectedStates = setUpMockGetLocusStatesSuccess(mockLocusList)
            ..add(LocusState(
              locusFailureOrSuccess: optionOf(right(mockLocusList)),
              isSearching: true,
              locusList: mockLocusList,
              locusShowed: mockLocusList.first(),
              locusFeatureShowed: Feature.empty(),
            ))
            ..add(
              LocusState(
                locusFailureOrSuccess: optionOf(right(mockLocusList)),
                isSearching: false,
                locusList: mockLocusList,
                locusShowed: mockLocusList.first(),
                locusFeatureShowed: Feature.empty(),
              ),
            );
          await expectLater(locusBloc.stream, emitsInOrder(expectedStates));
        },
      );

      test(
        'Should search SCU49845_1 locus',
        () async {
          setUpMockGetLocusList();

          locusBloc
            ..add(const LocusEvent.getLocus())
            ..add(const LocusEvent.showLocus(locusSearching: 'SCU49845_1'));

          final expectedStates = setUpMockGetLocusStatesSuccess(mockLocusList)
            ..add(LocusState(
              locusFailureOrSuccess: optionOf(right(mockLocusList)),
              isSearching: true,
              locusList: mockLocusList,
              locusShowed: mockLocusList.first(),
              locusFeatureShowed: Feature.empty(),
            ))
            ..add(
              LocusState(
                locusFailureOrSuccess: optionOf(right(mockLocusList)),
                isSearching: false,
                locusList: mockLocusList,
                locusShowed: mockLocusList.last(),
                locusFeatureShowed: Feature.empty(),
              ),
            );
          await expectLater(locusBloc.stream, emitsInOrder(expectedStates));
        },
      );
    },
  );

  group(
    'Show locus feature | ',
    () {
      final mockLocus = getLocus();
      final mockLocusFirstFeature = getFirstFeature();

      test(
        'Should show first locus feature',
        () async {
          setUpMockGetSuccess();

          locusBloc
            ..add(const LocusEvent.getLocus())
            ..add(LocusEvent.showLocusFeature(locusFeature: mockLocusFirstFeature));

          final expectedStates = setUpMockGetLocusStatesSuccess(mockLocus)
            ..add(LocusState(
              locusFailureOrSuccess: optionOf(right(mockLocus)),
              isSearching: false,
              locusList: mockLocus,
              locusShowed: mockLocus.first(),
              locusFeatureShowed: mockLocusFirstFeature,
            ));
          await expectLater(locusBloc.stream, emitsInOrder(expectedStates));
        },
      );
    },
  );
}
