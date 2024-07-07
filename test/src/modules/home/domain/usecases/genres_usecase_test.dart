import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ifood_challenge/src/modules/core/domain/failures/failures.dart';
import 'package:ifood_challenge/src/modules/home/domain/repositories/home_repository.dart';
import 'package:ifood_challenge/src/modules/home/domain/usecases/genres_usecase.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/genre_mock.dart';

class MockedHomeRepository extends Mock implements HomeRepository {}

void main() {
  late HomeRepository repository;
  late GenresUsecase usecase;

  setUp(() {
    repository = MockedHomeRepository();
    usecase = GenresUsecase(repository: repository);
  });

  test(
    'should return Right with correct value when repository completes successfully',
    () async {
      // Arrange
      when(() => repository.listGenres(locale: any(named: 'locale')))
          .thenAnswer(
        (_) async => const Right([tGenreEntity]),
      );

      // Act
      final result =
          await usecase.call(params: const GenresParams(locale: 'en'));

      // Assert
      expect(result, const Right([tGenreEntity]));
    },
  );

  test(
    'should return Left with Failure when repository catch exceptions',
    () async {
      // Arrange
      when(() => repository.listGenres(locale: any(named: 'locale')))
          .thenAnswer(
        (_) async => const Left(UnknownFailure(message: 'message')),
      );

      // Act
      final result =
          await usecase.call(params: const GenresParams(locale: 'en'));

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
      when(() => repository.listGenres(locale: any(named: 'locale')))
          .thenAnswer(
        (_) async => const Right([tGenreEntity]),
      );
      // Act
      await usecase.call(params: const GenresParams(locale: 'en'));

      // Assert
      verify(() => repository.listGenres(locale: any(named: 'locale')))
          .called(1);
      verifyNoMoreInteractions(repository);
    },
  );
}
