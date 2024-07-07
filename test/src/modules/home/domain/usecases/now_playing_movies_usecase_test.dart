import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ifood_challenge/src/modules/core/domain/failures/failures.dart';
import 'package:ifood_challenge/src/modules/home/domain/repositories/home_repository.dart';
import 'package:ifood_challenge/src/modules/home/domain/usecases/now_playing_movies_usecase.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/now_playing_movies_response_mock.dart';

class MockedHomeRepository extends Mock implements HomeRepository {}

void main() {
  late HomeRepository repository;
  late NowPlayingMoviesUsecase usecase;

  setUp(() {
    repository = MockedHomeRepository();
    usecase = NowPlayingMoviesUsecase(repository: repository);
  });

  test(
    'should return Right with correct value when repository completes successfully',
    () async {
      // Arrange
      when(() => repository.listNowPlayingMovies(
          locale: any(named: 'locale'), page: any(named: 'page'))).thenAnswer(
        (_) async => const Right(tNowPlayingMoviesResultEntity),
      );

      // Act
      final result = await usecase.call(
          params: const NowPlayingParams(
        locale: 'en',
        page: 1,
      ));

      // Assert
      expect(result, const Right(tNowPlayingMoviesResultEntity));
    },
  );

  test(
    'should return Left with Failure when repository catch exceptions',
    () async {
      // Arrange
      when(() => repository.listNowPlayingMovies(
          locale: any(named: 'locale'), page: any(named: 'page'))).thenAnswer(
        (_) async => const Left(UnknownFailure(message: 'message')),
      );

      // Act
      final result = await usecase.call(
          params: const NowPlayingParams(
        locale: 'en',
        page: 1,
      ));

      // Assert
      expect(
        result,
        const Left(UnknownFailure(message: 'message')),
      );
    },
  );

  test(
    'should call repository correctly',
    () async {
      // Arrange
      when(() => repository.listNowPlayingMovies(
          locale: any(named: 'locale'), page: any(named: 'page'))).thenAnswer(
        (_) async => const Right(tNowPlayingMoviesResultEntity),
      );

      // Act
      await usecase.call(
          params: const NowPlayingParams(
        locale: 'en',
        page: 1,
      ));

      // Assert
      verify(() => repository.listNowPlayingMovies(
          locale: any(named: 'locale'), page: any(named: 'page'))).called(1);
      verifyNoMoreInteractions(repository);
    },
  );
}
