import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';

import '../../domain/core/failures.dart';
import '../../domain/locus/feature.dart';
import '../../domain/locus/i_locus_repository.dart';
import '../../domain/locus/locus.dart';

part 'locus_bloc.freezed.dart';
part 'locus_event.dart';
part 'locus_state.dart';

class LocusBloc extends Bloc<LocusEvent, LocusState> {
  ILocusRepository locusRepository;

  LocusBloc({
    required this.locusRepository,
  }) : super(LocusState.initial());

  @override
  Stream<LocusState> mapEventToState(LocusEvent event) async* {
    yield* event.map(
      getLocus: (e) async* {
        yield state.copyWith(
          locusFailureOrSuccess: none(),
          isSearching: true,
          locusList: const KtList.empty(),
          locusShowed: Locus.empty(),
        );
        final locusFailureOrSuccess = await locusRepository.getLocus();
        KtList<Locus> locus = const KtList.empty();
        locusFailureOrSuccess.foldRight(
          '',
          (locusList, previous) => locus = locusList,
        );
        yield state.copyWith(
          locusFailureOrSuccess: optionOf(locusFailureOrSuccess),
          isSearching: false,
          locusList: locus,
          locusShowed: locus.isNotEmpty() ? locus.first() : Locus.empty(),
        );
      },
      showLocus: (e) async* {
        yield state.copyWith(
          isSearching: true,
        );
        Locus locusShowed = Locus.empty();
        locusShowed = e.locusSearching == ''
            ? state.locusList.first()
            : state.locusList.asList().firstWhere(
                  (locus) => locus.name == e.locusSearching,
                );

        yield state.copyWith(
          isSearching: false,
          locusShowed: locusShowed,
          locusFeatureShowed: Feature.empty(),
        );
      },
      showLocusFeature: (e) async* {
        yield state.copyWith(
          locusFeatureShowed: e.locusFeature,
        );
      },
    );
  }
}
