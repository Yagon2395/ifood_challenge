import 'package:dartz/dartz.dart';

import '../../../core/domain/failures/failures.dart';
import '../entities/search_movies_result_entity.dart';

abstract class SearchRepository {
  Future<Either<Failure, SearchMoviesResultEntity>> searchMovies(
      {required int page, required String locale, required String keyword});
}
