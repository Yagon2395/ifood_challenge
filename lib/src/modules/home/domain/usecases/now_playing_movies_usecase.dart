import 'package:dartz/dartz.dart';

import '../../../core/domain/failures/failures.dart';
import '../../../core/domain/usecases/base_usecase.dart';
import '../entities/now_playing_movies_result_entity.dart';
import '../repositories/home_repository.dart';

class NowPlayingMoviesUsecase
    implements
        InputableUsecase<NowPlayingMoviesResultEntity, NowPlayingParams> {
  final HomeRepository _repository;

  NowPlayingMoviesUsecase({required HomeRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, NowPlayingMoviesResultEntity>> call(
      {required NowPlayingParams params}) async {
    return await _repository.listNowPlayingMovies(
        page: params.page, locale: params.locale);
  }
}

class NowPlayingParams {
  final int page;
  final String locale;

  NowPlayingParams({required this.page, required this.locale});
}
