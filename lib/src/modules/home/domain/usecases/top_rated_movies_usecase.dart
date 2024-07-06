import 'package:dartz/dartz.dart';
import 'package:ifood_challenge/src/modules/core/domain/failures/failures.dart';

import '../../../core/domain/usecases/base_usecase.dart';
import '../entities/top_rated_movies_result_entity.dart';
import '../repositories/home_repository.dart';

class TopRatedMoviesUsecase
    implements InputableUsecase<TopRatedMoviesResultEntity, int> {
  final HomeRepository _repository;

  TopRatedMoviesUsecase({required HomeRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, TopRatedMoviesResultEntity>> call(
      {required int params}) async {
    return await _repository.listTopRatedMovies(page: params);
  }
}
