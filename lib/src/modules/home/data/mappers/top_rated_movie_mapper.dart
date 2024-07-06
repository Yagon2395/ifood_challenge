import '../../../core/data/datasources/constants.dart';
import '../../domain/entities/top_rated_movie_entity.dart';
import '../models/top_rated_movie_model.dart';

abstract class TopRatedMovieMapper {
  static TopRatedMovieEntity toEntity(TopRatedMovieModel model) {
    return TopRatedMovieEntity(
      id: model.id,
      title: model.title,
      voteAverage: model.voteAverage,
      backdropUrl: '$tmdbImageBaseUrl/t/p/w780${model.backdropPath}',
    );
  }
}
