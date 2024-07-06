import 'package:dartz/dartz.dart';

import '../failures/failures.dart';

sealed class BaseUsecase {}

abstract class InputlessUsecase<Output> extends BaseUsecase {
  Future<Either<Failure, Output>> call();
}

abstract class InputableUsecase<Output, Input> extends BaseUsecase {
  Future<Either<Failure, Output>> call({required Input params});
}
