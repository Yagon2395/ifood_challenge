import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ifood_challenge/src/modules/core/domain/failures/failures.dart';
import 'package:ifood_challenge/src/modules/search/domain/repositories/search_repository.dart';
import 'package:ifood_challenge/src/modules/search/domain/usecases/search_movies_usecase.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/search_movies_response_mock.dart';

class MockedSearchRepository extends Mock implements SearchRepository {}

void main() {
  late SearchRepository repository;
  late SearchMoviesUsecase usecase;

  setUp(() {
    repository = MockedSearchRepository();
    usecase = SearchMoviesUsecase(repository: repository);
  });

  test(
    'should return Right with correct value when repository completes successfully',
    () async {
      // Arrange
      when(() => repository.searchMovies(
            locale: any(named: 'locale'),
            page: any(named: 'page'),
            keyword: any(named: 'keyword'),
          )).thenAnswer(
        (_) async => const Right(tSearchMoviesResultEntity),
      );

      // Act
      final result = await usecase.call(
          params: const SearchMoviesParams(
              locale: 'en', page: 1, keyword: 'Mario'));

      // Assert
      expect(result, const Right(tSearchMoviesResultEntity));
      verify(() => repository.searchMovies(
            locale: any(named: 'locale'),
            page: any(named: 'page'),
            keyword: any(named: 'keyword'),
          )).called(1);
      verifyNoMoreInteractions(repository);
    },
  );

  test(
    'should return Left with Failure when repository catch exceptions',
    () async {
      // Arrange
      when(() => repository.searchMovies(
            locale: any(named: 'locale'),
            page: any(named: 'page'),
            keyword: any(named: 'keyword'),
          )).thenAnswer(
        (_) async => const Left(UnknownFailure(message: 'message')),
      );

      // Act
      final result = await usecase.call(
          params: const SearchMoviesParams(
        locale: 'en',
        page: 1,
        keyword: 'Mario',
      ));

      // Assert
      expect(
        result,
        const Left(UnknownFailure(message: 'message')),
      );
      verify(() => repository.searchMovies(
            locale: any(named: 'locale'),
            page: any(named: 'page'),
            keyword: any(named: 'keyword'),
          )).called(1);
      verifyNoMoreInteractions(repository);
    },
  );
}
