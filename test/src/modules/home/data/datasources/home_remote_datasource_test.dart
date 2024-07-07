import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ifood_challenge/src/modules/core/data/datasources/server_exception.dart';
import 'package:ifood_challenge/src/modules/home/data/datasources/home_datasource.dart';
import 'package:ifood_challenge/src/modules/home/data/datasources/home_remote_datasource.dart';
import 'package:ifood_challenge/src/modules/home/data/models/genres_response_model.dart';
import 'package:ifood_challenge/src/modules/home/data/models/now_playing_movies_response_model.dart';
import 'package:ifood_challenge/src/modules/home/data/models/top_rated_movies_response_model.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../utils/dio_utils.dart';
import '../../../../../utils/json_utils.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late Dio client;
  late HomeDatasource datasource;

  setUp(() {
    client = MockDio();
    datasource = HomeRemoteDatasource(client: client);
  });

  group('listTopRatedMovies', () {
    final jsonStr = jsonReader(
        'test/src/modules/home/mocks/top_rated_movies_response_model_mock.json');
    test(
        'should return [TopRatedMoviesResponseModel] when action is performed successfully',
        () async {
      // Arrange
      setupMockDioClientResponse(
        client: client,
        method: HttpMethod.get,
        statusCode: HttpStatus.ok,
        responseJson: jsonDecode(jsonStr),
      );

      // Act
      final result = await datasource.listTopRatedMovies(page: 1, locale: 'en');

      // Assert
      expect(result, isA<TopRatedMoviesResponseModel>());
    });

    test('should throw [ServerException] when catch [DioException]', () async {
      // Arrange
      setupMockDioClientResponse(
        client: client,
        method: HttpMethod.get,
        statusCode: HttpStatus.internalServerError,
      );

      // Act
      final action = datasource.listTopRatedMovies(page: 1, locale: 'en');

      // Assert
      expect(() async => await action, throwsA(isA<ServerException>()));
    });
  });

  group('listNowPlayingMovies', () {
    final jsonStr = jsonReader(
        'test/src/modules/home/mocks/now_playing_movies_response_model_mock.json');
    test(
        'should return [NowPlayingMoviesResponseModel] when action is performed successfully',
        () async {
      // Arrange
      setupMockDioClientResponse(
        client: client,
        method: HttpMethod.get,
        statusCode: HttpStatus.ok,
        responseJson: jsonDecode(jsonStr),
      );

      // Act
      final result =
          await datasource.listNowPlayingMovies(page: 1, locale: 'en');

      // Assert
      expect(result, isA<NowPlayingMoviesResponseModel>());
    });

    test('should throw [ServerException] when catch [DioException]', () async {
      // Arrange
      setupMockDioClientResponse(
        client: client,
        method: HttpMethod.get,
        statusCode: HttpStatus.internalServerError,
      );

      // Act
      final action = datasource.listNowPlayingMovies(page: 1, locale: 'en');

      // Assert
      expect(() async => await action, throwsA(isA<ServerException>()));
    });
  });

  group('listGenres', () {
    final jsonStr = jsonReader(
        'test/src/modules/home/mocks/genres_response_model_mock.json');
    test(
        'should return [GenresResponseModel] when action is performed successfully',
        () async {
      // Arrange
      setupMockDioClientResponse(
        client: client,
        method: HttpMethod.get,
        statusCode: HttpStatus.ok,
        responseJson: jsonDecode(jsonStr),
      );

      // Act
      final result = await datasource.listGenres(locale: 'en');

      // Assert
      expect(result, isA<GenresResponseModel>());
    });

    test('should throw [ServerException] when catch [DioException]', () async {
      // Arrange
      setupMockDioClientResponse(
        client: client,
        method: HttpMethod.get,
        statusCode: HttpStatus.internalServerError,
      );

      // Act
      final action = datasource.listGenres(locale: 'en');

      // Assert
      expect(() async => await action, throwsA(isA<ServerException>()));
    });
  });
}
