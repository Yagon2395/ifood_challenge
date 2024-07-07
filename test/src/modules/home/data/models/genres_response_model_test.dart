import 'package:flutter_test/flutter_test.dart';
import 'package:ifood_challenge/src/modules/home/data/models/genres_response_model.dart';

import '../../../../../utils/json_utils.dart';
import '../../mocks/genres_response_mock.dart';

void main() {
  group('serialization', () {
    test(
      'fromJson',
      () async {
        // Arrange
        final jsonStr = jsonReader(
            'test/src/modules/home/mocks/genres_response_model_mock.json');

        // Act
        final result = GenresResponseModel.fromJson(jsonStr);

        // Assert
        expect(result.genres.length, tGenresResponseModel.genres.length);
      },
    );

    test(
      'toJson',
      () async {
        // Arrange
        final jsonStr = jsonReader(
            'test/src/modules/home/mocks/genres_response_model_mock.json');

        // Act
        final result = tGenresResponseModel.toJson();

        // Assert
        expect(result.clearEncodedJson(), jsonStr.clearEncodedJson());
      },
    );
  });
}
