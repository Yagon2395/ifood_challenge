import 'package:dartz/dartz.dart';

import '../failures/failures.dart';
import 'base_usecase.dart';

class LocaleUsecase implements InputableUsecase<String, String> {
  @override
  Future<Either<Failure, String>> call({required String params}) async {
    return Right(params == 'pt' ? '$params-BR' : '$params-US');
  }
}
