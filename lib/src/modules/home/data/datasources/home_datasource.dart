import '../models/genres_response_model.dart';
import '../models/now_playing_movies_response_model.dart';
import '../models/top_rated_movies_response_model.dart';

abstract class HomeDatasource {
  Future<TopRatedMoviesResponseModel> listTopRatedMovies(
      {required int page, required String locale});
  Future<NowPlayingMoviesResponseModel> listNowPlayingMovies(
      {required int page, required String locale});
  Future<GenresResponseModel> listGenres({required String locale});
}
