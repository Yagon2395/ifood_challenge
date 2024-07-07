import 'package:flutter_test/flutter_test.dart';
import 'package:ifood_challenge/src/modules/search/data/mappers/search_movie_mapper.dart';
import 'package:ifood_challenge/src/modules/search/domain/entities/search_movie_entity.dart';

import '../../mocks/search_movie_mock.dart';

void main() {
  test('should convert model to entity correctly', () {
    final result = SearchMovieMapper.toEntity(tSearchMovieModel);
    expect(result, isA<SearchMovieEntity>());
    expect(result, tSearchMovieEntity);
  });
}
