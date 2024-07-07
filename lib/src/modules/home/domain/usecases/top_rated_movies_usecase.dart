import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ifood_challenge/src/modules/core/domain/failures/failures.dart';

import '../../../core/domain/usecases/base_usecase.dart';
import '../entities/top_rated_movies_result_entity.dart';
import '../repositories/home_repository.dart';

class TopRatedMoviesUsecase
    implements InputableUsecase<TopRatedMoviesResultEntity, TopRatedParams> {
  final HomeRepository _repository;

  TopRatedMoviesUsecase({required HomeRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, TopRatedMoviesResultEntity>> call(
      {required TopRatedParams params}) async {
    return await _repository.listTopRatedMovies(
      page: params.page,
      locale: params.locale,
    );
  }
}

class TopRatedParams extends Equatable {
  final int page;
  final String locale;

  const TopRatedParams({required this.page, required this.locale});

  @override
  List<Object?> get props => [page, locale];
}
