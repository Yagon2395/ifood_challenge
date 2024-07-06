import 'package:equatable/equatable.dart';

import 'now_playing_movie_entity.dart';

class NowPlayingMoviesResultEntity extends Equatable {
  final int page;
  final int totalPages;
  final List<NowPlayingMovieEntity> results;

  const NowPlayingMoviesResultEntity({
    required this.page,
    required this.totalPages,
    required this.results,
  });

  NowPlayingMoviesResultEntity copyWith({
    page,
    totalPages,
    results,
  }) {
    return NowPlayingMoviesResultEntity(
      page: page ?? this.page,
      totalPages: totalPages ?? this.totalPages,
      results: results ?? this.results,
    );
  }

  @override
  List<Object?> get props => [page, totalPages, results];
}
