import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ifood_challenge/src/modules/core/data/datasources/server_exception.dart';
import 'package:ifood_challenge/src/modules/core/domain/failures/failures.dart';
import 'package:ifood_challenge/src/modules/home/data/datasources/home_datasource.dart';
import 'package:ifood_challenge/src/modules/home/data/repositories/home_repository_impl.dart';
import 'package:ifood_challenge/src/modules/home/domain/entities/genre_entity.dart';
import 'package:ifood_challenge/src/modules/home/domain/repositories/home_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/genres_response_mock.dart';
import '../../mocks/now_playing_movies_response_mock.dart';
import '../../mocks/top_rated_movies_response_mock.dart';

class MockedHomeDatasource extends Mock implements HomeDatasource {}

void main() {
  late HomeDatasource datasource;
  late HomeRepository repository;

  setUp(() {
    datasource = MockedHomeDatasource();
    repository = HomeRepositoryImpl(datasource: datasource);
  });

  group('listTopRatedMovies', () {
    test(
        'should return [Right<TopRatedMoviesResultEntity>] when datasource completes successfully',
        () async {
      // Arrange
      when(() => datasource.listTopRatedMovies(
              page: any(named: 'page'), locale: any(named: 'locale')))
          .thenAnswer((_) async => tTopRatedMoviesResponseModel);

      // Act
      final result = await repository.listTopRatedMovies(page: 1, locale: 'en');

      // Assert
      expect(result, const Right(tTopRatedMoviesResultEntity));
      verify(
        () => repository.listTopRatedMovies(
            page: any(named: 'page'), locale: any(named: 'locale')),
      ).called(1);
      verifyNoMoreInteractions(datasource);
    });

    test('should return [Left<Failure>] with Failure when datasource throws',
        () async {
      // Arrange
      when(() => datasource.listTopRatedMovies(
              page: any(named: 'page'), locale: any(named: 'locale')))
          .thenThrow(ServerException(message: 'message'));

      // Act
      final result = await repository.listTopRatedMovies(page: 1, locale: 'en');

      // Assert
      expect(result, const Left(ServerFailure(message: 'message')));
      verify(
        () => repository.listTopRatedMovies(
            page: any(named: 'page'), locale: any(named: 'locale')),
      ).called(1);
      verifyNoMoreInteractions(datasource);
    });
  });

  group('listNowPlayingMovies', () {
    test(
        'should return [Right<NowPlayingMoviesResultEntity>] when datasource completes successfully',
        () async {
      // Arrange
      when(() => datasource.listNowPlayingMovies(
              page: any(named: 'page'), locale: any(named: 'locale')))
          .thenAnswer((_) async => tNowPlayingMoviesResponseModel);

      // Act
      final result =
          await repository.listNowPlayingMovies(page: 1, locale: 'en');

      // Assert
      expect(result, const Right(tNowPlayingMoviesResultEntity));
      verify(
        () => repository.listNowPlayingMovies(
            page: any(named: 'page'), locale: any(named: 'locale')),
      ).called(1);
      verifyNoMoreInteractions(datasource);
    });

    test('should return [Left<Failure>] with Failure when datasource throws',
        () async {
      // Arrange
      when(() => datasource.listNowPlayingMovies(
              page: any(named: 'page'), locale: any(named: 'locale')))
          .thenThrow(ServerException(message: 'message'));

      // Act
      final result =
          await repository.listNowPlayingMovies(page: 1, locale: 'en');

      // Assert
      expect(result, const Left(ServerFailure(message: 'message')));
      verify(
        () => repository.listNowPlayingMovies(
            page: any(named: 'page'), locale: any(named: 'locale')),
      ).called(1);
      verifyNoMoreInteractions(datasource);
    });
  });

  group('listGenres', () {
    test(
        'should return [Right<List<GenreEntity>>] when datasource completes successfully',
        () async {
      // Arrange
      when(() => datasource.listGenres(locale: any(named: 'locale')))
          .thenAnswer((_) async => tGenresResponseModel);

      // Act
      final result = await repository.listGenres(locale: 'en');

      // Assert
      expect(result, isA<Right<Failure, List<GenreEntity>>>());
      verify(
        () => repository.listGenres(locale: any(named: 'locale')),
      ).called(1);
      verifyNoMoreInteractions(datasource);
    });

    test('should return [Left<Failure>] with Failure when datasource throws',
        () async {
      // Arrange
      when(() => datasource.listGenres(locale: any(named: 'locale')))
          .thenThrow(ServerException(message: 'message'));

      // Act
      final result = await repository.listGenres(locale: 'en');

      // Assert
      expect(result, const Left(ServerFailure(message: 'message')));
      verify(
        () => repository.listGenres(locale: any(named: 'locale')),
      ).called(1);
      verifyNoMoreInteractions(datasource);
    });
  });
}
