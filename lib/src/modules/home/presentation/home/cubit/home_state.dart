part of 'home_cubit.dart';

enum TopRatedStatus { idle, empty, filled, loading, error }

enum NowPlayingStatus { idle, empty, filled, loading, error }

enum GenresStatus { idle, loading, success, error }

class HomeState extends Equatable {
  final TopRatedStatus topRatedStatus;
  final TopRatedMoviesResultEntity topRatedResult;
  final NowPlayingStatus nowPlayingStatus;
  final NowPlayingMoviesResultEntity nowPlayingResult;
  final GenresStatus genresStatus;
  final List<GenreEntity> genres;
  final String locale;
  final bool initialized;

  const HomeState({
    this.topRatedStatus = TopRatedStatus.idle,
    this.topRatedResult = const TopRatedMoviesResultEntity(
      page: 0,
      totalPages: 0,
      totalResults: 0,
      results: [],
    ),
    this.nowPlayingStatus = NowPlayingStatus.idle,
    this.nowPlayingResult = const NowPlayingMoviesResultEntity(
      page: 0,
      totalPages: 0,
      totalResults: 0,
      results: [],
    ),
    this.genresStatus = GenresStatus.idle,
    this.genres = const [],
    this.locale = 'en',
    this.initialized = false,
  });

  factory HomeState.initial() => const HomeState();

  HomeState copyWith({
    topRatedStatus,
    topRatedResult,
    nowPlayingStatus,
    nowPlayingResult,
    genresStatus,
    genres,
    locale,
    initialized,
  }) {
    return HomeState(
      topRatedStatus: topRatedStatus ?? this.topRatedStatus,
      topRatedResult: topRatedResult ?? this.topRatedResult,
      nowPlayingStatus: nowPlayingStatus ?? this.nowPlayingStatus,
      nowPlayingResult: nowPlayingResult ?? this.nowPlayingResult,
      genresStatus: genresStatus ?? this.genresStatus,
      genres: genres ?? this.genres,
      locale: locale ?? this.locale,
      initialized: initialized ?? this.initialized,
    );
  }

  @override
  List<Object?> get props => [
        topRatedStatus,
        topRatedResult,
        nowPlayingStatus,
        nowPlayingResult,
        genresStatus,
        genres,
        locale,
        initialized,
      ];
}
