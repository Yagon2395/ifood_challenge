import 'package:flutter_test/flutter_test.dart';
import 'package:ifood_challenge/src/modules/home/data/mappers/now_playing_movies_result_mapper.dart';
import 'package:ifood_challenge/src/modules/home/domain/entities/now_playing_movies_result_entity.dart';

import '../../mocks/now_playing_movies_response_mock.dart';

void main() {
  test('should convert model to entity correctly', () {
    final result =
        NowPlayingMoviesResultMapper.toEntity(tNowPlayingMoviesResponseModel);
    expect(result, isA<NowPlayingMoviesResultEntity>());
    expect(result, tNowPlayingMoviesResultEntity);
  });
}
