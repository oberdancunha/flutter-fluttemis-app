import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';

import '../../domain/core/failures.dart';
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
        );
        final locusFailureOrSuccess = await locusRepository.getLocus();
        yield state.copyWith(
          locusFailureOrSuccess: optionOf(locusFailureOrSuccess),
          isSearching: false,
        );
      },
    );
  }
}
