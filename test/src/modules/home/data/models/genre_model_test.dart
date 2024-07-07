import 'package:flutter_test/flutter_test.dart';
import 'package:ifood_challenge/src/modules/home/data/models/genre_model.dart';

import '../../../../../utils/json_utils.dart';
import '../../mocks/genre_mock.dart';

void main() {
  group('serialization', () {
    test(
      'fromJson',
      () async {
        // Arrange
        final jsonStr =
            jsonReader('test/src/modules/home/mocks/genre_model_mock.json');

        // Act
        final result = GenreModel.fromJson(jsonStr);

        // Assert
        expect(result.id, tGenreModel.id);
        expect(result.name, tGenreModel.name);
      },
    );

    test(
      'toJson',
      () async {
        // Arrange
        final jsonStr =
            jsonReader('test/src/modules/home/mocks/genre_model_mock.json');

        // Act
        final result = tGenreModel.toJson();

        // Assert
        expect(result.clearEncodedJson(), jsonStr.clearEncodedJson());
      },
    );
  });
}
