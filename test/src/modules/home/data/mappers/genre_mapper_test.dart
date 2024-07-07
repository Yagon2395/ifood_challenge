import 'package:flutter_test/flutter_test.dart';
import 'package:ifood_challenge/src/modules/home/data/mappers/genre_mapper.dart';
import 'package:ifood_challenge/src/modules/home/domain/entities/genre_entity.dart';

import '../../mocks/genre_mock.dart';

void main() {
  test('should convert model to entity correctly', () {
    final result = GenreMapper.toEntity(tGenreModel);
    expect(result, isA<GenreEntity>());
    expect(result, tGenreEntity);
  });
}
