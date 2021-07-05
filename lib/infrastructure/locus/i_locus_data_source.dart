import 'package:dartz/dartz.dart';

import '../../domain/core/failures.dart';
import 'locus_dto.dart';

abstract class ILocusDataSource {
  Future<Either<Failure, List<LocusDto>>> getLocus();
}
