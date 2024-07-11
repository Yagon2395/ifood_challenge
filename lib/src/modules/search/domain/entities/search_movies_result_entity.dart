import 'package:equatable/equatable.dart';

import 'search_movie_entity.dart';

class SearchMoviesResultEntity extends Equatable {
  final int page;
  final int totalPages;
  final int totalResults;
  final List<SearchMovieEntity> results;

  bool get hasReachedEnd =>
      (page > 0 && totalResults > 0 && page == totalPages);

  const SearchMoviesResultEntity({
    required this.page,
    required this.totalPages,
    required this.totalResults,
    required this.results,
  });

  SearchMoviesResultEntity copyWith({
    page,
    totalPages,
    totalResults,
    results,
  }) {
    return SearchMoviesResultEntity(
      page: page ?? this.page,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
      results: results ?? this.results,
    );
  }

  @override
  List<Object?> get props => [page, totalPages, totalResults, results];
}
