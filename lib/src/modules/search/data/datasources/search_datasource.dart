import '../models/search_movies_response_model.dart';

abstract class SearchDatasource {
  Future<SearchMoviesResponseModel> searchMovies(
      {required int page, required String locale, required String keyword});
}
