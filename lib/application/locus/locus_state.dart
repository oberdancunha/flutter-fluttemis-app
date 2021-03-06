part of 'locus_bloc.dart';

@freezed
class LocusState with _$LocusState {
  const factory LocusState({
    required Option<Either<Failure, KtList<Locus>>> locusFailureOrSuccess,
    required bool isSearching,
    required KtList<Locus> locusList,
    required Locus locusShowed,
    Feature? locusFeatureShowed,
  }) = _LocusState;

  factory LocusState.initial() => LocusState(
        locusFailureOrSuccess: none(),
        isSearching: false,
        locusList: const KtList.empty(),
        locusShowed: Locus.empty(),
        locusFeatureShowed: Feature.empty(),
      );
}
