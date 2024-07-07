import 'package:ifood_challenge/src/modules/search/data/models/search_movies_response_model.dart';
import 'package:ifood_challenge/src/modules/search/domain/entities/search_movies_result_entity.dart';

import 'search_movie_mock.dart';

final tSearchMoviesResponseModel = SearchMoviesResponseModel(
  page: 1,
  totalPages: 1,
  totalResults: 1,
  results: [tSearchMovieModel],
);

const tSearchMoviesResultEntity = SearchMoviesResultEntity(
  page: 1,
  totalPages: 1,
  totalResults: 1,
  results: [tSearchMovieEntity],
);
