import 'package:dartz/dartz.dart';

import '../../infrastructure/locus_dto.dart';
import '../core/failures.dart';

abstract class ILocusDataSource {
  Future<Either<Failure, List<LocusDto>>> getLocus();
}
