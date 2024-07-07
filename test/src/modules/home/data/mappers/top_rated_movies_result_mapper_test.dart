import 'package:flutter_test/flutter_test.dart';
import 'package:ifood_challenge/src/modules/home/data/mappers/top_rated_movies_result_mapper.dart';
import 'package:ifood_challenge/src/modules/home/domain/entities/top_rated_movies_result_entity.dart';

import '../../mocks/top_rated_movies_response_mock.dart';

void main() {
  test('should convert model to entity correctly', () {
    final result =
        TopRatedMoviesResultMapper.toEntity(tTopRatedMoviesResponseModel);
    expect(result, isA<TopRatedMoviesResultEntity>());
    expect(result, tTopRatedMoviesResultEntity);
  });
}
