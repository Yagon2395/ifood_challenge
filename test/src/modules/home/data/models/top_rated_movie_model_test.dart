import 'package:flutter_test/flutter_test.dart';
import 'package:ifood_challenge/src/modules/home/data/models/top_rated_movie_model.dart';

import '../../../../../utils/json_utils.dart';
import '../../mocks/top_rated_movie_mock.dart';

void main() {
  group('serialization', () {
    test(
      'fromJson',
      () async {
        // Arrange
        final jsonStr = jsonReader(
            'test/src/modules/home/mocks/top_rated_movie_model_mock.json');

        // Act
        final result = TopRatedMovieModel.fromJson(jsonStr);

        // Assert
        expect(result.id, tTopRatedMovieModel.id);
        expect(result.title, tTopRatedMovieModel.title);
        expect(result.voteAverage, tTopRatedMovieModel.voteAverage);
        expect(result.backdropPath, tTopRatedMovieModel.backdropPath);
      },
    );

    test(
      'toJson',
      () async {
        // Arrange
        final jsonStr = jsonReader(
            'test/src/modules/home/mocks/top_rated_movie_model_mock.json');

        // Act
        final result = tTopRatedMovieModel.toJson();

        // Assert
        expect(result.clearEncodedJson(), jsonStr.clearEncodedJson());
      },
    );
  });
}
