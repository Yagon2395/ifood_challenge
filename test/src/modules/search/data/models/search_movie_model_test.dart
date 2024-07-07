import 'package:flutter_test/flutter_test.dart';
import 'package:ifood_challenge/src/modules/search/data/models/search_movie_model.dart';

import '../../../../../utils/json_utils.dart';
import '../../mocks/search_movie_mock.dart';

void main() {
  group('serialization', () {
    test(
      'fromJson',
      () async {
        // Arrange
        final jsonStr = jsonReader(
            'test/src/modules/search/mocks/search_movie_model_mock.json');

        // Act
        final result = SearchMovieModel.fromJson(jsonStr);

        // Assert
        expect(result.id, tSearchMovieModel.id);
        expect(result.title, tSearchMovieModel.title);
        expect(result.voteAverage, tSearchMovieModel.voteAverage);
        expect(result.posterPath, tSearchMovieModel.posterPath);
        expect(result.backdropPath, tSearchMovieModel.backdropPath);
        expect(result.overview, tSearchMovieModel.overview);
      },
    );

    test(
      'toJson',
      () async {
        // Arrange
        final jsonStr = jsonReader(
            'test/src/modules/search/mocks/search_movie_model_mock.json');

        // Act
        final result = tSearchMovieModel.toJson();

        // Assert
        expect(result.clearEncodedJson(), jsonStr.clearEncodedJson());
      },
    );
  });
}
