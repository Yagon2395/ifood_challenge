part of 'search_cubit.dart';

enum SearchMoviesStatus { empty, filled, loading, error }

class SearchState extends Equatable {
  final SearchMoviesStatus searchMoviesStatus;
  final SearchMoviesResultEntity searchMoviesResult;
  final String locale;
  final String keyword;

  const SearchState({
    this.searchMoviesStatus = SearchMoviesStatus.loading,
    this.searchMoviesResult = const SearchMoviesResultEntity(
      page: 0,
      totalPages: 0,
      totalResults: 0,
      results: [],
    ),
    this.locale = 'en',
    this.keyword = '',
  });

  factory SearchState.initial() => const SearchState();

  SearchState copyWith({
    searchMoviesStatus,
    searchMoviesResult,
    locale,
    keyword,
  }) {
    return SearchState(
      searchMoviesStatus: searchMoviesStatus ?? this.searchMoviesStatus,
      searchMoviesResult: searchMoviesResult ?? this.searchMoviesResult,
      locale: locale ?? this.locale,
      keyword: keyword ?? this.keyword,
    );
  }

  @override
  List<Object?> get props => [
        searchMoviesStatus,
        searchMoviesResult,
        locale,
        keyword,
      ];
}
