import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ifood_challenge/src/modules/core/domain/failures/failures.dart';
import 'package:ifood_challenge/src/modules/core/domain/usecases/locale_usecase.dart';
import 'package:ifood_challenge/src/modules/search/domain/entities/search_movies_result_entity.dart';
import 'package:ifood_challenge/src/modules/search/domain/usecases/search_movies_usecase.dart';
import 'package:ifood_challenge/src/modules/search/presentation/cubit/search_cubit.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/search_movies_response_mock.dart';

class MockedSearchMoviesUsecase extends Mock implements SearchMoviesUsecase {}

class MockedLocaleUsecase extends Mock implements LocaleUsecase {}

void main() {
  late SearchMoviesUsecase searchMoviesUsecase;
  late LocaleUsecase localeUsecase;
  late SearchCubit cubit;
  const tSearchParams = SearchMoviesParams(
    page: 1,
    locale: 'en',
    keyword: 'Mario',
  );

  setUp(() {
    searchMoviesUsecase = MockedSearchMoviesUsecase();
    localeUsecase = MockedLocaleUsecase();
    cubit = SearchCubit(
      searchMoviesUsecase: searchMoviesUsecase,
      localeUsecase: localeUsecase,
    );
  });

  setUpAll(() {
    registerFallbackValue(tSearchParams);
  });

  group('initialize', () {
    blocTest('emits correct state when initialize successfully',
        setUp: () {
          when(() => localeUsecase.call(params: any(named: 'params')))
              .thenAnswer((_) async => const Right('en-US'));
        },
        build: () => cubit,
        act: (cubit) => cubit.initialize(locale: 'en'),
        expect: () => [
              SearchState.initial().copyWith(
                locale: 'en-US',
              ),
            ],
        verify: (_) {
          verify(() => localeUsecase.call(params: any(named: 'params')))
              .called(1);
        });

    blocTest('emits correct state when initialize locale fails',
        setUp: () {
          when(() => localeUsecase.call(params: any(named: 'params')))
              .thenAnswer(
                  (_) async => const Left(UnknownFailure(message: 'message')));
        },
        build: () => cubit,
        act: (cubit) => cubit.initialize(locale: 'en'),
        expect: () => [
              SearchState.initial().copyWith(
                locale: 'en-US',
              ),
            ],
        verify: (_) {
          verify(() => localeUsecase.call(params: any(named: 'params')))
              .called(1);
        });
  });

  group('searchMovies', () {
    blocTest(
      'emits correct state when movies are fetched successfully without filter',
      setUp: () {
        when(() => searchMoviesUsecase.call(params: any(named: 'params')))
            .thenAnswer((_) async => const Right(
                  SearchMoviesResultEntity(
                    page: 1,
                    totalPages: 1,
                    totalResults: 0,
                    results: [],
                  ),
                ));
      },
      build: () => cubit,
      act: (cubit) => cubit.searchMovies(),
      expect: () => [
        SearchState.initial()
            .copyWith(searchMoviesStatus: SearchMoviesStatus.loading),
        SearchState.initial().copyWith(
          searchMoviesStatus: SearchMoviesStatus.empty,
          searchMoviesResult: const SearchMoviesResultEntity(
            page: 1,
            totalPages: 1,
            totalResults: 0,
            results: [],
          ),
          keyword: '',
        ),
      ],
      verify: (_) =>
          verify(() => searchMoviesUsecase.call(params: any(named: 'params')))
              .called(1),
    );

    blocTest(
      'emits correct state when movies are fetched successfully with filter',
      setUp: () {
        when(() => searchMoviesUsecase.call(params: any(named: 'params')))
            .thenAnswer((_) async => const Right(tSearchMoviesResultEntity));
      },
      build: () => cubit,
      act: (cubit) => cubit.searchMovies(keyword: 'Mario'),
      expect: () => [
        SearchState.initial()
            .copyWith(searchMoviesStatus: SearchMoviesStatus.loading),
        SearchState.initial().copyWith(
          searchMoviesStatus: SearchMoviesStatus.filled,
          searchMoviesResult: tSearchMoviesResultEntity,
          keyword: 'Mario',
        )
      ],
      verify: (_) =>
          verify(() => searchMoviesUsecase.call(params: any(named: 'params')))
              .called(1),
    );

    blocTest(
      'emits correct state when movies are fetched with failure',
      setUp: () {
        when(() => searchMoviesUsecase.call(params: any(named: 'params')))
            .thenAnswer(
                (_) async => const Left(UnknownFailure(message: 'message')));
      },
      build: () => cubit,
      act: (cubit) => cubit.searchMovies(keyword: 'Mario'),
      expect: () => [
        SearchState.initial()
            .copyWith(searchMoviesStatus: SearchMoviesStatus.loading),
        SearchState.initial().copyWith(
            searchMoviesStatus: SearchMoviesStatus.error, keyword: 'Mario'),
      ],
      verify: (_) =>
          verify(() => searchMoviesUsecase.call(params: any(named: 'params')))
              .called(1),
    );
  });
}
