import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/domain/usecases/locale_usecase.dart';
import '../../domain/entities/search_movies_result_entity.dart';
import '../../domain/usecases/search_movies_usecase.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchMoviesUsecase _searchMoviesUsecase;
  final LocaleUsecase _localeUsecase;
  SearchCubit({
    required SearchMoviesUsecase searchMoviesUsecase,
    required LocaleUsecase localeUsecase,
  })  : _searchMoviesUsecase = searchMoviesUsecase,
        _localeUsecase = localeUsecase,
        super(SearchState.initial());

  Future initialize({required String locale}) async {
    final resultLocale = await _localeUsecase.call(params: locale);
    resultLocale.fold(
      (_) {
        emit(state.copyWith(locale: _));
      },
      (r) {
        emit(state.copyWith(locale: r));
      },
    );
  }

  Future searchMovies({String keyword = '', bool reset = false}) async {
    emit(state.copyWith(
      searchMoviesStatus: SearchMoviesStatus.loading,
    ));
    int nextPage = keyword.isNotEmpty ? 1 : state.searchMoviesResult.page + 1;
    nextPage = reset ? 1 : nextPage;
    String filter = keyword.isNotEmpty ? keyword : state.keyword;
    filter = reset ? '' : filter;
    final result = await _searchMoviesUsecase(
        params: SearchMoviesParams(
      page: nextPage,
      locale: state.locale,
      keyword: filter,
    ));
    result.fold((_) {
      emit(state.copyWith(
        searchMoviesStatus: SearchMoviesStatus.error,
        keyword: filter,
      ));
    }, (r) {
      final isEmpty =
          (state.searchMoviesResult.results.isEmpty && r.results.isEmpty);
      var movies = keyword.isEmpty
          ? [...state.searchMoviesResult.results, ...r.results]
          : r.results;
      movies = reset ? [] : movies;
      emit(state.copyWith(
        searchMoviesStatus:
            isEmpty ? SearchMoviesStatus.empty : SearchMoviesStatus.filled,
        searchMoviesResult: r.copyWith(results: movies),
        keyword: filter,
      ));
    });
  }
}
