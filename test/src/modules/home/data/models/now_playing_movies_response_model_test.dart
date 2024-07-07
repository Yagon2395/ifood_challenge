import 'package:flutter_test/flutter_test.dart';
import 'package:ifood_challenge/src/modules/home/data/models/now_playing_movies_response_model.dart';

import '../../../../../utils/json_utils.dart';
import '../../mocks/now_playing_movies_response_mock.dart';

void main() {
  group('serialization', () {
    test(
      'fromJson',
      () async {
        // Arrange
        final jsonStr = jsonReader(
            'test/src/modules/home/mocks/now_playing_movies_response_model_mock.json');

        // Act
        final result = NowPlayingMoviesResponseModel.fromJson(jsonStr);

        // Assert
        expect(result.page, tNowPlayingMoviesResponseModel.page);
        expect(result.totalPages, tNowPlayingMoviesResponseModel.totalPages);
        expect(
            result.totalResults, tNowPlayingMoviesResponseModel.totalResults);
        expect(result.results.length,
            tNowPlayingMoviesResponseModel.results.length);
      },
    );

    test(
      'toJson',
      () async {
        // Arrange
        final jsonStr = jsonReader(
            'test/src/modules/home/mocks/now_playing_movies_response_model_mock.json');

        // Act
        final result = tNowPlayingMoviesResponseModel.toJson();

        // Assert
        expect(result.clearEncodedJson(), jsonStr.clearEncodedJson());
      },
    );
  });
}
