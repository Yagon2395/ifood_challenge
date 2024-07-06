import '../../domain/entities/top_rated_movies_result_entity.dart';
import '../models/top_rated_movies_response_model.dart';
import 'top_rated_movie_mapper.dart';

abstract class TopRatedMoviesResultMapper {
  static TopRatedMoviesResultEntity toEntity(
      TopRatedMoviesResponseModel model) {
    return TopRatedMoviesResultEntity(
      page: model.page,
      totalPages: model.totalPages,
      totalResults: model.totalResults,
      results:
          model.results.map((e) => TopRatedMovieMapper.toEntity(e)).toList(),
    );
  }
}
