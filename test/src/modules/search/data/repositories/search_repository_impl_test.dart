import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ifood_challenge/src/modules/core/data/datasources/server_exception.dart';
import 'package:ifood_challenge/src/modules/core/domain/failures/failures.dart';
import 'package:ifood_challenge/src/modules/search/data/datasources/search_datasource.dart';
import 'package:ifood_challenge/src/modules/search/data/repositories/search_repository_impl.dart';
import 'package:ifood_challenge/src/modules/search/domain/repositories/search_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/search_movies_response_mock.dart';

class MockedSearchDatasource extends Mock implements SearchDatasource {}

void main() {
  late SearchDatasource datasource;
  late SearchRepository repository;

  setUp(() {
    datasource = MockedSearchDatasource();
    repository = SearchRepositoryImpl(datasource: datasource);
  });

  group('searchMovies', () {
    test(
        'should return [Right<TopRatedMoviesResultEntity>] when datasource completes successfully',
        () async {
      // Arrange
      when(() => datasource.searchMovies(
            page: any(named: 'page'),
            locale: any(named: 'locale'),
            keyword: any(named: 'keyword'),
          )).thenAnswer((_) async => tSearchMoviesResponseModel);

      // Act
      final result = await repository.searchMovies(
        page: 1,
        locale: 'en',
        keyword: 'Mario',
      );

      // Assert
      expect(result, const Right(tSearchMoviesResultEntity));
      verify(
        () => repository.searchMovies(
          page: any(named: 'page'),
          locale: any(named: 'locale'),
          keyword: any(named: 'keyword'),
        ),
      ).called(1);
      verifyNoMoreInteractions(datasource);
    });

    test('should return [Left<Failure>] with Failure when datasource throws',
        () async {
      // Arrange
      when(() => datasource.searchMovies(
            page: any(named: 'page'),
            locale: any(named: 'locale'),
            keyword: any(named: 'keyword'),
          )).thenThrow(ServerException(message: 'message'));

      // Act
      final result = await repository.searchMovies(
        page: 1,
        locale: 'en',
        keyword: 'Mario',
      );

      // Assert
      expect(result, const Left(ServerFailure(message: 'message')));
      verify(
        () => repository.searchMovies(
          page: any(named: 'page'),
          locale: any(named: 'locale'),
          keyword: any(named: 'keyword'),
        ),
      ).called(1);
      verifyNoMoreInteractions(datasource);
    });
  });
}
