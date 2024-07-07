import 'package:ifood_challenge/src/modules/home/data/models/now_playing_movies_response_model.dart';
import 'package:ifood_challenge/src/modules/home/domain/entities/now_playing_movies_result_entity.dart';

import 'now_playing_movie_mock.dart';

final tNowPlayingMoviesResponseModel = NowPlayingMoviesResponseModel(
  page: 1,
  totalPages: 1,
  totalResults: 1,
  results: [tNowPlayingMovieModel],
);

const tNowPlayingMoviesResultEntity = NowPlayingMoviesResultEntity(
  page: 1,
  totalPages: 1,
  totalResults: 1,
  results: [tNowPlayingMovieEntity],
);
