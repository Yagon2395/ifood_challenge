import 'package:flutter_test/flutter_test.dart';
import 'package:ifood_challenge/src/modules/home/presentation/home/cubit/home_cubit.dart';

import '../../../mocks/genre_mock.dart';
import '../../../mocks/now_playing_movies_response_mock.dart';
import '../../../mocks/top_rated_movies_response_mock.dart';

void main() {
  group('operator == from [Equatable]', () {
    test('entities should be different', () {
      const someState = HomeState(
        initialized: true,
        genresStatus: GenresStatus.error,
      );
      expect(HomeState.initial(), isNot(someState));
    });

    test('entities should be equal', () {
      final someState = HomeState.initial();
      final anotherState = HomeState.initial();
      expect(someState, anotherState);
    });
  });

  group('copyWith', () {
    final HomeState tHomeState = HomeState.initial();
    test(
        'copyWith without any arguments should not modify any property of state',
        () {
      final newState = tHomeState.copyWith();
      expect(newState, tHomeState);
    });

    test('copyWith should work for all properties of state', () {
      final newState = tHomeState.copyWith(
        topRatedStatus: TopRatedStatus.filled,
        topRatedResult: tTopRatedMoviesResultEntity,
        nowPlayingStatus: NowPlayingStatus.filled,
        nowPlayingResult: tNowPlayingMoviesResultEntity,
        genresStatus: GenresStatus.success,
        genres: [tGenreEntity],
        locale: 'pt',
        initialized: true,
      );

      expect(newState, isNot(tHomeState));
    });
  });
}
