import 'package:equatable/equatable.dart';

import 'now_playing_movie_entity.dart';

class NowPlayingMoviesResultEntity extends Equatable {
  final int page;
  final int totalPages;
  final int totalResults;
  final List<NowPlayingMovieEntity> results;

  bool get hasReachedEnd =>
      (page > 0 && totalResults > 0 && page == totalPages);

  const NowPlayingMoviesResultEntity({
    required this.page,
    required this.totalPages,
    required this.totalResults,
    required this.results,
  });

  NowPlayingMoviesResultEntity copyWith({
    page,
    totalPages,
    totalResults,
    results,
  }) {
    return NowPlayingMoviesResultEntity(
      page: page ?? this.page,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
      results: results ?? this.results,
    );
  }

  @override
  List<Object?> get props => [page, totalPages, totalResults, results];
}
