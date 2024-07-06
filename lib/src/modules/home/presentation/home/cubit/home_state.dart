part of 'home_cubit.dart';

enum TopRatedStatus { empty, filled, loading, error }

enum NowPlayingStatus { empty, filled, loading, error }

enum GenresStatus { loading, success, error }

class HomeState extends Equatable {
  final TopRatedStatus topRatedStatus;
  final TopRatedMoviesResultEntity topRatedResult;
  final NowPlayingStatus nowPlayingStatus;
  final NowPlayingMoviesResultEntity nowPlayingResult;
  final GenresStatus genresStatus;
  final List<GenreEntity> genres;

  const HomeState({
    this.topRatedStatus = TopRatedStatus.loading,
    this.topRatedResult = const TopRatedMoviesResultEntity(
      page: 0,
      totalPages: 0,
      results: [],
    ),
    this.nowPlayingStatus = NowPlayingStatus.loading,
    this.nowPlayingResult = const NowPlayingMoviesResultEntity(
      page: 0,
      totalPages: 0,
      results: [],
    ),
    this.genresStatus = GenresStatus.loading,
    this.genres = const [],
  });

  factory HomeState.initial() => const HomeState();

  HomeState copyWith({
    topRatedStatus,
    topRatedResult,
    nowPlayingStatus,
    nowPlayingResult,
    genresStatus,
    genres,
  }) {
    return HomeState(
      topRatedStatus: topRatedStatus ?? this.topRatedStatus,
      topRatedResult: topRatedResult ?? this.topRatedResult,
      nowPlayingStatus: nowPlayingStatus ?? this.nowPlayingStatus,
      nowPlayingResult: nowPlayingResult ?? this.nowPlayingResult,
      genresStatus: genresStatus ?? this.genresStatus,
      genres: genres ?? this.genres,
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
      ];
}
