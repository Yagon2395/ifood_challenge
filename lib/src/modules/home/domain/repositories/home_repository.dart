import 'package:dartz/dartz.dart';

import '../../../core/domain/failures/failures.dart';
import '../entities/genre_entity.dart';
import '../entities/now_playing_movies_result_entity.dart';
import '../entities/top_rated_movies_result_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, TopRatedMoviesResultEntity>> listTopRatedMovies(
      {required int page, required String locale});
  Future<Either<Failure, NowPlayingMoviesResultEntity>> listNowPlayingMovies(
      {required int page, required String locale});
  Future<Either<Failure, List<GenreEntity>>> listGenres(
      {required String locale});
}
