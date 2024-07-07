import 'package:dartz/dartz.dart';

import '../../../core/domain/failures/failures.dart';
import '../../../core/domain/usecases/base_usecase.dart';
import '../entities/search_movies_result_entity.dart';
import '../repositories/search_repository.dart';

class SearchMoviesUsecase
    implements InputableUsecase<SearchMoviesResultEntity, SearchMoviesParams> {
  final SearchRepository _repository;

  SearchMoviesUsecase({required SearchRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, SearchMoviesResultEntity>> call(
      {required SearchMoviesParams params}) async {
    final keyword = params.keyword.replaceAll(' ', '+');
    return await _repository.searchMovies(
      page: params.page,
      locale: params.locale,
      keyword: keyword,
    );
  }
}

class SearchMoviesParams {
  final int page;
  final String locale;
  final String keyword;

  SearchMoviesParams({
    required this.page,
    required this.locale,
    required this.keyword,
  });
}
