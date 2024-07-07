import 'package:flutter_test/flutter_test.dart';
import 'package:ifood_challenge/src/modules/home/data/models/now_playing_movie_model.dart';

import '../../../../../utils/json_utils.dart';
import '../../mocks/now_playing_movie_mock.dart';

void main() {
  group('serialization', () {
    test(
      'fromJson',
      () async {
        // Arrange
        final jsonStr = jsonReader(
            'test/src/modules/home/mocks/now_playing_movie_model_mock.json');

        // Act
        final result = NowPlayingMovieModel.fromJson(jsonStr);

        // Assert
        expect(result.id, tNowPlayingMovieModel.id);
        expect(result.title, tNowPlayingMovieModel.title);
        expect(result.voteAverage, tNowPlayingMovieModel.voteAverage);
        expect(result.posterPath, tNowPlayingMovieModel.posterPath);
        expect(result.genreIds, tNowPlayingMovieModel.genreIds);
        expect(result.overview, tNowPlayingMovieModel.overview);
      },
    );

    test(
      'toJson',
      () async {
        // Arrange
        final jsonStr = jsonReader(
            'test/src/modules/home/mocks/now_playing_movie_model_mock.json');

        // Act
        final result = tNowPlayingMovieModel.toJson();

        // Assert
        expect(result.clearEncodedJson(), jsonStr.clearEncodedJson());
      },
    );
  });
}
