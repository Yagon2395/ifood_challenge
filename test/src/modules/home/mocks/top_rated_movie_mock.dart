import 'package:ifood_challenge/src/modules/core/data/datasources/constants.dart';
import 'package:ifood_challenge/src/modules/home/data/models/top_rated_movie_model.dart';
import 'package:ifood_challenge/src/modules/home/domain/entities/top_rated_movie_entity.dart';

final tTopRatedMovieModel = TopRatedMovieModel(
  id: 240,
  title: 'The Godfather Part II',
  voteAverage: 8.6,
  backdropPath: '/kGzFbGhp99zva6oZODW5atUtnqi.jpg',
);

const tTopRatedMovieEntity = TopRatedMovieEntity(
  id: 240,
  title: 'The Godfather Part II',
  voteAverage: 8.6,
  backdropUrl: '$tmdbImageBaseUrl/t/p/w780/kGzFbGhp99zva6oZODW5atUtnqi.jpg',
);
