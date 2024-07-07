import 'package:ifood_challenge/src/modules/core/data/datasources/constants.dart';
import 'package:ifood_challenge/src/modules/home/data/models/now_playing_movie_model.dart';
import 'package:ifood_challenge/src/modules/home/domain/entities/now_playing_movie_entity.dart';

final tNowPlayingMovieModel = NowPlayingMovieModel(
  id: 502356,
  title: 'The Super Mario Bros. Movie',
  voteAverage: 7.5,
  posterPath: '/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg',
  genreIds: [16, 12, 10751, 14, 35],
  overview:
      'While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.',
);

const tNowPlayingMovieEntity = NowPlayingMovieEntity(
  id: 502356,
  title: 'The Super Mario Bros. Movie',
  voteAverage: 7.5,
  posterUrl: '$tmdbImageBaseUrl/t/p/w500/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg',
  genreIds: [16, 12, 10751, 14, 35],
  overview:
      'While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.',
);
