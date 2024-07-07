import 'package:flutter_test/flutter_test.dart';
import 'package:ifood_challenge/src/modules/home/data/models/top_rated_movies_response_model.dart';

import '../../../../../utils/json_utils.dart';
import '../../mocks/top_rated_movies_response_mock.dart';

void main() {
  group('serialization', () {
    test(
      'fromJson',
      () async {
        // Arrange
        final jsonStr = jsonReader(
            'test/src/modules/home/mocks/top_rated_movies_response_model_mock.json');

        // Act
        final result = TopRatedMoviesResponseModel.fromJson(jsonStr);

        // Assert
        expect(result.page, tTopRatedMoviesResponseModel.page);
        expect(result.totalPages, tTopRatedMoviesResponseModel.totalPages);
        expect(result.totalResults, tTopRatedMoviesResponseModel.totalResults);
        expect(
            result.results.length, tTopRatedMoviesResponseModel.results.length);
      },
    );

    test(
      'toJson',
      () async {
        // Arrange
        final jsonStr = jsonReader(
            'test/src/modules/home/mocks/top_rated_movies_response_model_mock.json');

        // Act
        final result = tTopRatedMoviesResponseModel.toJson();

        // Assert
        expect(result.clearEncodedJson(), jsonStr.clearEncodedJson());
      },
    );
  });
}
