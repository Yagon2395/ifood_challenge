import 'package:flutter_test/flutter_test.dart';
import 'package:ifood_challenge/src/modules/core/data/datasources/constants.dart';
import 'package:ifood_challenge/src/modules/home/domain/entities/top_rated_movie_entity.dart';

import '../../mocks/top_rated_movie_mock.dart';

void main() {
  group('operator == from [Equatable]', () {
    test('entities should be different', () {
      const otherEntity = TopRatedMovieEntity(
          id: 0, title: 'title', voteAverage: 0, backdropUrl: 'backdropUrl');
      expect(tTopRatedMovieEntity, isNot(otherEntity));
    });

    test('entities should be equal', () {
      const otherEntity = TopRatedMovieEntity(
        id: 240,
        title: 'The Godfather Part II',
        voteAverage: 8.6,
        backdropUrl:
            '$tmdbImageBaseUrl/t/p/w780/kGzFbGhp99zva6oZODW5atUtnqi.jpg',
      );

      expect(tTopRatedMovieEntity, otherEntity);
    });
  });
}
