import 'package:dartz/dartz.dart';

import '../../../core/domain/failures/failures.dart';
import '../../../core/domain/usecases/base_usecase.dart';
import '../entities/now_playing_movies_result_entity.dart';
import '../repositories/home_repository.dart';

class NowPlayingMoviesUsecase
    implements InputableUsecase<NowPlayingMoviesResultEntity, int> {
  final HomeRepository _repository;

  NowPlayingMoviesUsecase({required HomeRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, NowPlayingMoviesResultEntity>> call(
      {required int params}) async {
    return await _repository.listNowPlayingMovies(page: params);
  }
}
