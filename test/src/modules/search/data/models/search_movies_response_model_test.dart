import 'package:flutter_test/flutter_test.dart';
import 'package:ifood_challenge/src/modules/search/data/models/search_movies_response_model.dart';

import '../../../../../utils/json_utils.dart';
import '../../mocks/search_movies_response_mock.dart';

void main() {
  group('serialization', () {
    test(
      'fromJson',
      () async {
        // Arrange
        final jsonStr = jsonReader(
            'test/src/modules/search/mocks/search_movies_response_model_mock.json');

        // Act
        final result = SearchMoviesResponseModel.fromJson(jsonStr);

        // Assert
        expect(result.page, tSearchMoviesResponseModel.page);
        expect(result.totalPages, tSearchMoviesResponseModel.totalPages);
        expect(result.totalResults, tSearchMoviesResponseModel.totalResults);
        expect(
            result.results.length, tSearchMoviesResponseModel.results.length);
      },
    );

    test(
      'toJson',
      () async {
        // Arrange
        final jsonStr = jsonReader(
            'test/src/modules/search/mocks/search_movies_response_model_mock.json');

        // Act
        final result = tSearchMoviesResponseModel.toJson();

        // Assert
        expect(result.clearEncodedJson(), jsonStr.clearEncodedJson());
      },
    );
  });
}
