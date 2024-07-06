import '../../domain/entities/now_playing_movies_result_entity.dart';
import '../models/now_playing_movies_response_model.dart';
import 'now_playing_movie_mapper.dart';

abstract class NowPlayingMoviesResultMapper {
  static NowPlayingMoviesResultEntity toEntity(
      NowPlayingMoviesResponseModel model) {
    return NowPlayingMoviesResultEntity(
      page: model.page,
      totalPages: model.totalPages,
      results:
          model.results.map((e) => NowPlayingMovieMapper.toEntity(e)).toList(),
    );
  }
}
