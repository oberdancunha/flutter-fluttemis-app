import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';

import '../core/failures.dart';
import 'locus.dart';

abstract class ILocusDataSource {
  Future<Either<Failure, KtList<Locus>>> getLocus();
}
