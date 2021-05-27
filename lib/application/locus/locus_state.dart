part of 'locus_bloc.dart';

@freezed
class LocusState with _$LocusState {
  const factory LocusState({
    required Option<Either<Failure, KtList<Locus>>> locusFailureOrSuccess,
    required bool isSearching,
  }) = _LocusState;

  factory LocusState.initial() => LocusState(
        locusFailureOrSuccess: none(),
        isSearching: false,
      );
}
