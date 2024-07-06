import 'package:equatable/equatable.dart';

import 'top_rated_movie_entity.dart';

class TopRatedMoviesResultEntity extends Equatable {
  final int page;
  final int totalPages;
  final List<TopRatedMovieEntity> results;

  const TopRatedMoviesResultEntity({
    required this.page,
    required this.totalPages,
    required this.results,
  });

  TopRatedMoviesResultEntity copyWith({
    page,
    totalPages,
    results,
  }) {
    return TopRatedMoviesResultEntity(
      page: page ?? this.page,
      totalPages: totalPages ?? this.totalPages,
      results: results ?? this.results,
    );
  }

  @override
  List<Object?> get props => [page, totalPages, results];
}
