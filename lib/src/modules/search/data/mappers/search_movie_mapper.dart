import '../../../core/data/datasources/constants.dart';
import '../../domain/entities/search_movie_entity.dart';
import '../models/search_movie_model.dart';

abstract class SearchMovieMapper {
  static SearchMovieEntity toEntity(SearchMovieModel model) {
    return SearchMovieEntity(
      id: model.id,
      title: model.title,
      voteAverage: model.voteAverage,
      posterUrl: '$tmdbImageBaseUrl/t/p/w500${model.posterPath}',
      backdropUrl: '$tmdbImageBaseUrl/t/p/w780${model.posterPath}',
      overview: model.overview,
    );
  }
}
