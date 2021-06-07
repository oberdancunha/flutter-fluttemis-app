part of 'locus_bloc.dart';

@freezed
class LocusEvent with _$LocusEvent {
  const factory LocusEvent.getLocus() = _GetLocus;
  const factory LocusEvent.showLocus({required String locusSearching}) = _ShowLocus;
  const factory LocusEvent.showLocusFeature({required Feature locusFeature}) = _ShowLocusFeature;
}
