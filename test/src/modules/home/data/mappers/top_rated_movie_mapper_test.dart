import 'package:flutter_test/flutter_test.dart';
import 'package:ifood_challenge/src/modules/home/data/mappers/top_rated_movie_mapper.dart';
import 'package:ifood_challenge/src/modules/home/domain/entities/top_rated_movie_entity.dart';

import '../../mocks/top_rated_movie_mock.dart';

void main() {
  test('should convert model to entity correctly', () {
    final result = TopRatedMovieMapper.toEntity(tTopRatedMovieModel);
    expect(result, isA<TopRatedMovieEntity>());
    expect(result, tTopRatedMovieEntity);
  });
}
