part of 'locus_bloc.dart';

@freezed
class LocusEvent with _$LocusEvent {
  const factory LocusEvent.getLocus() = _GetLocus;
  const factory LocusEvent.locusShowed({required String locusSearching}) = _LocusShowed;
}
