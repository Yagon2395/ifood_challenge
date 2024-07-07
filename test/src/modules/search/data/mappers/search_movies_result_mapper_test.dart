import 'package:flutter_test/flutter_test.dart';
import 'package:ifood_challenge/src/modules/search/data/mappers/search_movies_result_mapper.dart';
import 'package:ifood_challenge/src/modules/search/domain/entities/search_movies_result_entity.dart';

import '../../mocks/search_movies_response_mock.dart';

void main() {
  test('should convert model to entity correctly', () {
    final result =
        SearchMoviesResultMapper.toEntity(tSearchMoviesResponseModel);
    expect(result, isA<SearchMoviesResultEntity>());
    expect(result, tSearchMoviesResultEntity);
  });
}
