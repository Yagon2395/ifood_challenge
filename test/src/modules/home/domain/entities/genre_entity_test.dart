import 'package:flutter_test/flutter_test.dart';
import 'package:ifood_challenge/src/modules/home/domain/entities/genre_entity.dart';

import '../../mocks/genre_mock.dart';

void main() {
  group('operator == from [Equatable]', () {
    test('entities should be different', () {
      const otherEntity = GenreEntity(id: 0, name: 'name');
      expect(tGenreEntity, isNot(otherEntity));
    });

    test('entities should be equal', () {
      const otherEntity = GenreEntity(id: 28, name: 'Action');
      expect(tGenreEntity, otherEntity);
    });
  });
}
