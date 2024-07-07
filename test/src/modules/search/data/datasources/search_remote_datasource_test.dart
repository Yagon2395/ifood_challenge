import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ifood_challenge/src/modules/core/data/datasources/server_exception.dart';
import 'package:ifood_challenge/src/modules/search/data/datasources/search_datasource.dart';
import 'package:ifood_challenge/src/modules/search/data/datasources/search_remote_datasource.dart';
import 'package:ifood_challenge/src/modules/search/data/models/search_movies_response_model.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../utils/dio_utils.dart';
import '../../../../../utils/json_utils.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late Dio client;
  late SearchDatasource datasource;

  setUp(() {
    client = MockDio();
    datasource = SearchRemoteDatasource(client: client);
  });

  group('searchMovies', () {
    final jsonStr = jsonReader(
        'test/src/modules/search/mocks/search_movies_response_model_mock.json');
    test(
        'should return [SearchMoviesResponseModel ] when action is performed successfully',
        () async {
      // Arrange
      setupMockDioClientResponse(
        client: client,
        method: HttpMethod.get,
        statusCode: HttpStatus.ok,
        responseJson: jsonDecode(jsonStr),
      );

      // Act
      final result = await datasource.searchMovies(
        page: 1,
        locale: 'en',
        keyword: 'Mario',
      );

      // Assert
      expect(result, isA<SearchMoviesResponseModel>());
    });

    test('should throw [ServerException] when catch [DioException]', () async {
      // Arrange
      setupMockDioClientResponse(
        client: client,
        method: HttpMethod.get,
        statusCode: HttpStatus.internalServerError,
      );

      // Act
      final action =
          datasource.searchMovies(page: 1, locale: 'en', keyword: 'Mario');

      // Assert
      expect(() async => await action, throwsA(isA<ServerException>()));
    });
  });
}
