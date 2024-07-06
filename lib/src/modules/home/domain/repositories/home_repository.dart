import 'package:dartz/dartz.dart';

import '../../../core/domain/failures/failures.dart';
import '../entities/top_rated_movies_result_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, TopRatedMoviesResultEntity>> listTopRatedMovies(
      {required int page});
}
