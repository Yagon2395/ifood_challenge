import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ifood_challenge/src/modules/core/domain/failures/failures.dart';
import 'package:ifood_challenge/src/modules/home/domain/repositories/home_repository.dart';
import 'package:ifood_challenge/src/modules/home/domain/usecases/top_rated_movies_usecase.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/top_rated_movies_response_mock.dart';

class MockedHomeRepository extends Mock implements HomeRepository {}

void main() {
  late HomeRepository repository;
  late TopRatedMoviesUsecase usecase;

  setUp(() {
    repository = MockedHomeRepository();
    usecase = TopRatedMoviesUsecase(repository: repository);
  });

  test(
    'should return Right with correct value when repository completes successfully',
    () async {
      // Arrange
      when(() => repository.listTopRatedMovies(
          locale: any(named: 'locale'), page: any(named: 'page'))).thenAnswer(
        (_) async => const Right(tTopRatedMoviesResultEntity),
      );

      // Act
      final result = await usecase.call(
          params: const TopRatedParams(
        locale: 'en',
        page: 1,
      ));

      // Assert
      expect(result, const Right(tTopRatedMoviesResultEntity));
    },
  );

  test(
    'should return Left with Failure when repository catch exceptions',
    () async {
      // Arrange
      when(() => repository.listTopRatedMovies(
          locale: any(named: 'locale'), page: any(named: 'page'))).thenAnswer(
        (_) async => const Left(UnknownFailure(message: 'message')),
      );

      // Act
      final result = await usecase.call(
          params: const TopRatedParams(
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
      when(() => repository.listTopRatedMovies(
          locale: any(named: 'locale'), page: any(named: 'page'))).thenAnswer(
        (_) async => const Right(tTopRatedMoviesResultEntity),
      );

      // Act
      await usecase.call(
          params: const TopRatedParams(
        locale: 'en',
        page: 1,
      ));

      // Assert
      verify(() => repository.listTopRatedMovies(
          locale: any(named: 'locale'), page: any(named: 'page'))).called(1);
      verifyNoMoreInteractions(repository);
    },
  );
}
