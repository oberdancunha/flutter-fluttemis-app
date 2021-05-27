import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';

import '../../domain/core/failures.dart';
import 'locus.dart';

abstract class ILocusRepository {
  Future<Either<Failure, KtList<Locus>>> getLocus();
}
