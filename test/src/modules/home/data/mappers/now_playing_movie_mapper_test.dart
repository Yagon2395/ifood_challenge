import 'package:flutter_test/flutter_test.dart';
import 'package:ifood_challenge/src/modules/home/data/mappers/now_playing_movie_mapper.dart';
import 'package:ifood_challenge/src/modules/home/domain/entities/now_playing_movie_entity.dart';

import '../../mocks/now_playing_movie_mock.dart';

void main() {
  test('should convert model to entity correctly', () {
    final result = NowPlayingMovieMapper.toEntity(tNowPlayingMovieModel);
    expect(result, isA<NowPlayingMovieEntity>());
    expect(result, tNowPlayingMovieEntity);
  });
}
