import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/top_rated_movies_result_entity.dart';
import '../../../domain/usecases/top_rated_movies_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final TopRatedMoviesUsecase _topRatedMoviesUsecase;

  HomeCubit({required TopRatedMoviesUsecase topRatedMoviesUsecase})
      : _topRatedMoviesUsecase = topRatedMoviesUsecase,
        super(HomeState.initial());

  Future initialize() async {
    await Future.wait([fetchTopRatedMovies()]);
  }

  Future fetchTopRatedMovies() async {
    emit(state.copyWith(topRatedStatus: TopRatedStatus.loading));
    final nextPage = state.topRatedResult.page + 1;
    final result = await _topRatedMoviesUsecase(params: nextPage);
    result.fold((_) {
      emit(state.copyWith(topRatedStatus: TopRatedStatus.error));
    }, (r) {
      final isEmpty = state.topRatedResult.results.isEmpty && r.results.isEmpty;
      emit(state.copyWith(
        topRatedStatus: isEmpty ? TopRatedStatus.empty : TopRatedStatus.filled,
        topRatedResult: r,
      ));
    });
  }
}
