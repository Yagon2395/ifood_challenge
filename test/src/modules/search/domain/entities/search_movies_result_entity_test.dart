import 'package:flutter_test/flutter_test.dart';
import 'package:ifood_challenge/src/modules/search/domain/entities/search_movies_result_entity.dart';

import '../../mocks/search_movie_mock.dart';
import '../../mocks/search_movies_response_mock.dart';

void main() {
  group('operator == from [Equatable]', () {
    test('entities should be different', () {
      const otherEntity = SearchMoviesResultEntity(
        page: 1,
        totalPages: 1,
        totalResults: 1,
        results: [],
      );

      expect(tSearchMoviesResultEntity, isNot(otherEntity));
    });

    test('entities should be equal', () {
      const otherEntity = SearchMoviesResultEntity(
        page: 1,
        totalPages: 1,
        totalResults: 1,
        results: [tSearchMovieEntity],
      );
      expect(tSearchMoviesResultEntity, otherEntity);
    });
  });

  group('copyWith', () {
    test('copyWith without arguments should not modify the origin entity', () {
      final newEntity = tSearchMoviesResultEntity.copyWith();
      expect(newEntity, tSearchMoviesResultEntity);
    });

    test('copyWith with arguments should modify the origin entity correctly',
        () {
      final newEntity = tSearchMoviesResultEntity.copyWith(page: 3);
      expect(newEntity, isNot(tSearchMoviesResultEntity));
    });
  });
}
