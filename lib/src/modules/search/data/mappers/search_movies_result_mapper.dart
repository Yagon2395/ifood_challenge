import '../../domain/entities/search_movies_result_entity.dart';
import '../models/search_movies_response_model.dart';
import 'search_movie_mapper.dart';

abstract class SearchMoviesResultMapper {
  static SearchMoviesResultEntity toEntity(SearchMoviesResponseModel model) {
    return SearchMoviesResultEntity(
      page: model.page,
      totalPages: model.totalPages,
      totalResults: model.totalResults,
      results: model.results.map((e) => SearchMovieMapper.toEntity(e)).toList(),
    );
  }
}
