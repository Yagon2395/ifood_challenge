import 'package:dartz/dartz.dart';

import '../../../core/domain/failures/failures.dart';
import '../../../core/domain/usecases/base_usecase.dart';

class LocaleUsecase implements InputableUsecase<String, String> {
  @override
  Future<Either<Failure, String>> call({required String params}) async {
    return Right(params == 'pt' ? '$params-BR' : '$params-EN');
  }
}
