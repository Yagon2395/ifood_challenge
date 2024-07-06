import '../../../core/data/datasources/constants.dart';
import '../../domain/entities/now_playing_movie_entity.dart';
import '../models/now_playing_movie_model.dart';

abstract class NowPlayingMovieMapper {
  static NowPlayingMovieEntity toEntity(NowPlayingMovieModel model) {
    return NowPlayingMovieEntity(
      id: model.id,
      title: model.title,
      voteAverage: model.voteAverage,
      genreIds: model.genreIds,
      overview: model.overview,
      posterUrl: '$tmdbImageBaseUrl/t/p/w500${model.posterPath}',
    );
  }
}
