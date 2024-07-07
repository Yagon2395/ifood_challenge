import 'package:flutter_test/flutter_test.dart';
import 'package:ifood_challenge/src/modules/home/domain/entities/top_rated_movies_result_entity.dart';

import '../../mocks/top_rated_movie_mock.dart';
import '../../mocks/top_rated_movies_response_mock.dart';

void main() {
  group('operator == from [Equatable]', () {
    test('entities should be different', () {
      const otherEntity = TopRatedMoviesResultEntity(
        page: 1,
        totalPages: 1,
        totalResults: 1,
        results: [],
      );

      expect(tTopRatedMoviesResultEntity, isNot(otherEntity));
    });

    test('entities should be equal', () {
      const otherEntity = TopRatedMoviesResultEntity(
        page: 1,
        totalPages: 1,
        totalResults: 1,
        results: [tTopRatedMovieEntity],
      );

      expect(tTopRatedMoviesResultEntity, otherEntity);
    });
  });

  group('copyWith', () {
    test('copyWith without arguments should not modify the origin entity', () {
      final newEntity = tTopRatedMoviesResultEntity.copyWith();
      expect(newEntity, tTopRatedMoviesResultEntity);
    });

    test('copyWith with arguments should modify the origin entity correctly',
        () {
      final newEntity = tTopRatedMoviesResultEntity.copyWith(page: 3);
      expect(newEntity, isNot(tTopRatedMoviesResultEntity));
    });
  });
}
