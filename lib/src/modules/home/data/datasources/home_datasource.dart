import '../models/top_rated_movies_response_model.dart';

abstract class HomeDatasource {
  Future<TopRatedMoviesResponseModel> listTopRatedMovies({required int page});
}
