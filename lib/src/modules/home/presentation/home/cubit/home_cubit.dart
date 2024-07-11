import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/usecases/locale_usecase.dart';
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
  final LocaleUsecase _localeUsecase;

  HomeCubit({
    required TopRatedMoviesUsecase topRatedMoviesUsecase,
    required NowPlayingMoviesUsecase nowPlayingMoviesUsecase,
    required GenresUsecase genresUsecase,
    required LocaleUsecase localeUsecase,
  })  : _topRatedMoviesUsecase = topRatedMoviesUsecase,
        _nowPlayingMoviesUsecase = nowPlayingMoviesUsecase,
        _genresUsecase = genresUsecase,
        _localeUsecase = localeUsecase,
        super(HomeState.initial());

  Future initialize({required String locale}) async {
    if (state.initialized || isClosed) {
      return;
    }

    final resultLocale = await _localeUsecase.call(params: locale);
    resultLocale.fold(
      (l) {
        emit(state.copyWith(locale: 'en-US', initialized: true));
      },
      (r) {
        emit(state.copyWith(locale: r, initialized: true));
      },
    );
    await Future.wait([
      fetchTopRatedMovies(),
      fetchNowPlayingMovies(),
      fetchGenres(),
    ]);
  }

  Future fetchTopRatedMovies() async {
    emit(state.copyWith(topRatedStatus: TopRatedStatus.loading));
    final nextPage = state.topRatedResult.page + 1;
    final result = await _topRatedMoviesUsecase(
        params: TopRatedParams(
      page: nextPage,
      locale: state.locale,
    ));
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
    if (isClosed ||
        state.nowPlayingStatus == NowPlayingStatus.loading ||
        state.nowPlayingResult.hasReachedEnd) {
      return;
    }

    emit(state.copyWith(nowPlayingStatus: NowPlayingStatus.loading));

    final nextPage = state.nowPlayingResult.page + 1;
    final result = await _nowPlayingMoviesUsecase(
        params: NowPlayingParams(
      page: nextPage,
      locale: state.locale,
    ));
    result.fold((_) {
      emit(state.copyWith(nowPlayingStatus: NowPlayingStatus.error));
    }, (r) {
      final isEmpty =
          state.nowPlayingResult.results.isEmpty && r.results.isEmpty;
      final movies = [...state.nowPlayingResult.results, ...r.results];
      emit(state.copyWith(
        nowPlayingStatus:
            isEmpty ? NowPlayingStatus.empty : NowPlayingStatus.filled,
        nowPlayingResult: r.copyWith(results: movies),
      ));
    });
  }

  Future fetchGenres() async {
    emit(state.copyWith(genresStatus: GenresStatus.loading));
    await Future.delayed(const Duration(seconds: 3));
    final result = await _genresUsecase(
        params: GenresParams(
      locale: state.locale,
    ));
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
