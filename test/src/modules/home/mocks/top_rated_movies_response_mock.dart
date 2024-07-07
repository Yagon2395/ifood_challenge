import 'package:ifood_challenge/src/modules/home/data/models/top_rated_movies_response_model.dart';
import 'package:ifood_challenge/src/modules/home/domain/entities/top_rated_movies_result_entity.dart';

import 'top_rated_movie_mock.dart';

final tTopRatedMoviesResponseModel = TopRatedMoviesResponseModel(
  page: 1,
  totalPages: 1,
  totalResults: 1,
  results: [tTopRatedMovieModel],
);

const tTopRatedMoviesResultEntity = TopRatedMoviesResultEntity(
  page: 1,
  totalPages: 1,
  totalResults: 1,
  results: [tTopRatedMovieEntity],
);
