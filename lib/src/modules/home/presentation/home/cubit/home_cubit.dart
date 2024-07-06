import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/genre_entity.dart';
import '../../../domain/entities/now_playing_movies_result_entity.dart';
import '../../../domain/entities/top_rated_movies_result_entity.dart';
import '../../../domain/usecases/genres_usecase.dart';
import '../../../domain/usecases/now_playing_movies_usecase.dart';
import '../../../domain/usecases/top_rated_movies_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final TopRatedMoviesUsecase _topRatedMoviesUsecase;
  final NowPlayingMoviesUsecase _nowPlayingMoviesUsecase;
  final GenresUsecase _genresUsecase;

  HomeCubit({
    required TopRatedMoviesUsecase topRatedMoviesUsecase,
    required NowPlayingMoviesUsecase nowPlayingMoviesUsecase,
    required GenresUsecase genresUsecase,
  })  : _topRatedMoviesUsecase = topRatedMoviesUsecase,
        _nowPlayingMoviesUsecase = nowPlayingMoviesUsecase,
        _genresUsecase = genresUsecase,
        super(HomeState.initial());

  Future initialize() async {
    await Future.wait([
      fetchTopRatedMovies(),
      fetchNowPlayingMovies(),
      fetchGenres(),
    ]);
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

  Future fetchNowPlayingMovies() async {
    emit(state.copyWith(nowPlayingStatus: NowPlayingStatus.loading));
    final nextPage = state.topRatedResult.page + 1;
    final result = await _nowPlayingMoviesUsecase(params: nextPage);
    result.fold((_) {
      emit(state.copyWith(nowPlayingStatus: NowPlayingStatus.error));
    }, (r) {
      final isEmpty = state.topRatedResult.results.isEmpty && r.results.isEmpty;
      emit(state.copyWith(
        nowPlayingStatus:
            isEmpty ? NowPlayingStatus.empty : NowPlayingStatus.filled,
        nowPlayingResult: r,
      ));
    });
  }

  Future fetchGenres() async {
    emit(state.copyWith(genresStatus: GenresStatus.loading));
    await Future.delayed(const Duration(seconds: 3));
    final result = await _genresUsecase();
    result.fold((_) {
      emit(state.copyWith(genresStatus: GenresStatus.error));
    }, (r) {
      emit(state.copyWith(
        genresStatus: r.isNotEmpty ? GenresStatus.success : GenresStatus.error,
        genres: r,
      ));
    });
  }
}
