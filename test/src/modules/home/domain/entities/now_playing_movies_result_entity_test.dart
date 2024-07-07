import 'package:flutter_test/flutter_test.dart';
import 'package:ifood_challenge/src/modules/home/domain/entities/now_playing_movies_result_entity.dart';

import '../../mocks/now_playing_movie_mock.dart';
import '../../mocks/now_playing_movies_response_mock.dart';

void main() {
  group('operator == from [Equatable]', () {
    test('entities should be different', () {
      const otherEntity = NowPlayingMoviesResultEntity(
        page: 1,
        totalPages: 1,
        totalResults: 1,
        results: [],
      );

      expect(tNowPlayingMoviesResultEntity, isNot(otherEntity));
    });

    test('entities should be equal', () {
      const otherEntity = NowPlayingMoviesResultEntity(
        page: 1,
        totalPages: 1,
        totalResults: 1,
        results: [tNowPlayingMovieEntity],
      );
      expect(tNowPlayingMoviesResultEntity, otherEntity);
    });
  });

  group('copyWith', () {
    test('copyWith without arguments should not modify the origin entity', () {
      final newEntity = tNowPlayingMoviesResultEntity.copyWith();
      expect(newEntity, tNowPlayingMoviesResultEntity);
    });

    test('copyWith with arguments should modify the origin entity correctly',
        () {
      final newEntity = tNowPlayingMoviesResultEntity.copyWith(page: 3);
      expect(newEntity, isNot(tNowPlayingMoviesResultEntity));
    });
  });
}
