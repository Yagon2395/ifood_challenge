part of 'home_cubit.dart';

enum TopRatedStatus { empty, filled, loading, error }

class HomeState extends Equatable {
  final TopRatedStatus topRatedStatus;
  final TopRatedMoviesResultEntity topRatedResult;

  const HomeState({
    this.topRatedStatus = TopRatedStatus.loading,
    this.topRatedResult = const TopRatedMoviesResultEntity(
      page: 0,
      totalPages: 0,
      results: [],
    ),
  });

  factory HomeState.initial() => const HomeState();

  HomeState copyWith({
    topRatedStatus,
    topRatedResult,
  }) {
    return HomeState(
      topRatedStatus: topRatedStatus ?? this.topRatedStatus,
      topRatedResult: topRatedResult ?? this.topRatedResult,
    );
  }

  @override
  List<Object?> get props => [
        topRatedStatus,
        topRatedResult,
      ];
}
