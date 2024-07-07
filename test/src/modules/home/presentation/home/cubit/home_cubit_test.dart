import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ifood_challenge/src/modules/core/domain/failures/failures.dart';
import 'package:ifood_challenge/src/modules/core/domain/usecases/locale_usecase.dart';
import 'package:ifood_challenge/src/modules/home/domain/usecases/genres_usecase.dart';
import 'package:ifood_challenge/src/modules/home/domain/usecases/now_playing_movies_usecase.dart';
import 'package:ifood_challenge/src/modules/home/domain/usecases/top_rated_movies_usecase.dart';
import 'package:ifood_challenge/src/modules/home/presentation/home/cubit/home_cubit.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/genre_mock.dart';
import '../../../mocks/now_playing_movies_response_mock.dart';
import '../../../mocks/top_rated_movies_response_mock.dart';

class MockedTopRatedMoviesUsecase extends Mock
    implements TopRatedMoviesUsecase {}

class MockedNowPlayingMoviesUsecase extends Mock
    implements NowPlayingMoviesUsecase {}

class MockedGenresUsecase extends Mock implements GenresUsecase {}

class MockedLocaleUsecase extends Mock implements LocaleUsecase {}

void main() {
  late TopRatedMoviesUsecase topRatedMoviesUsecase;
  late NowPlayingMoviesUsecase nowPlayingMoviesUsecase;
  late GenresUsecase genresUsecase;
  late LocaleUsecase localeUsecase;
  late HomeCubit cubit;
  const tTopRatedParams = TopRatedParams(page: 1, locale: 'en');
  const tNowPlayingParams = NowPlayingParams(page: 1, locale: 'en');
  const tGenresParams = GenresParams(locale: 'en');

  setUp(() {
    topRatedMoviesUsecase = MockedTopRatedMoviesUsecase();
    nowPlayingMoviesUsecase = MockedNowPlayingMoviesUsecase();
    genresUsecase = MockedGenresUsecase();
    localeUsecase = MockedLocaleUsecase();
    cubit = HomeCubit(
      topRatedMoviesUsecase: topRatedMoviesUsecase,
      nowPlayingMoviesUsecase: nowPlayingMoviesUsecase,
      genresUsecase: genresUsecase,
      localeUsecase: localeUsecase,
    );
  });

  setUpAll(() {
    registerFallbackValue(tTopRatedParams);
    registerFallbackValue(tNowPlayingParams);
    registerFallbackValue(tGenresParams);
  });

  group('initialize', () {
    blocTest('emits correct state when initialize successfully',
        setUp: () {
          when(() => topRatedMoviesUsecase.call(params: any(named: 'params')))
              .thenAnswer(
                  (_) async => const Right(tTopRatedMoviesResultEntity));
          when(() => nowPlayingMoviesUsecase.call(params: any(named: 'params')))
              .thenAnswer(
                  (_) async => const Right(tNowPlayingMoviesResultEntity));
          when(() => genresUsecase.call(params: any(named: 'params')))
              .thenAnswer((_) async => const Right([tGenreEntity]));
          when(() => localeUsecase.call(params: any(named: 'params')))
              .thenAnswer((_) async => const Right('en-US'));
        },
        build: () => cubit,
        act: (cubit) => cubit.initialize(locale: 'en'),
        skip: 6,
        expect: () => [
              HomeState.initial().copyWith(
                topRatedStatus: TopRatedStatus.filled,
                topRatedResult: tTopRatedMoviesResultEntity,
                nowPlayingStatus: NowPlayingStatus.filled,
                nowPlayingResult: tNowPlayingMoviesResultEntity,
                genresStatus: GenresStatus.success,
                genres: [tGenreEntity],
                locale: 'en-US',
                initialized: true,
              ),
            ],
        verify: (_) {
          verify(() => topRatedMoviesUsecase.call(params: any(named: 'params')))
              .called(1);
          verify(() =>
                  nowPlayingMoviesUsecase.call(params: any(named: 'params')))
              .called(1);
          verify(() => genresUsecase.call(params: any(named: 'params')))
              .called(1);
          verify(() => localeUsecase.call(params: any(named: 'params')))
              .called(1);
        });

    blocTest('emits correct state when initialize locale fails',
        setUp: () {
          when(() => topRatedMoviesUsecase.call(params: any(named: 'params')))
              .thenAnswer(
                  (_) async => const Right(tTopRatedMoviesResultEntity));
          when(() => nowPlayingMoviesUsecase.call(params: any(named: 'params')))
              .thenAnswer(
                  (_) async => const Right(tNowPlayingMoviesResultEntity));
          when(() => genresUsecase.call(params: any(named: 'params')))
              .thenAnswer((_) async => const Right([tGenreEntity]));
          when(() => localeUsecase.call(params: any(named: 'params')))
              .thenAnswer(
                  (_) async => const Left(UnknownFailure(message: 'message')));
        },
        build: () => cubit,
        act: (cubit) => cubit.initialize(locale: 'en'),
        skip: 6,
        expect: () => [
              HomeState.initial().copyWith(
                topRatedStatus: TopRatedStatus.filled,
                topRatedResult: tTopRatedMoviesResultEntity,
                nowPlayingStatus: NowPlayingStatus.filled,
                nowPlayingResult: tNowPlayingMoviesResultEntity,
                genresStatus: GenresStatus.success,
                genres: [tGenreEntity],
                locale: 'en-US',
                initialized: true,
              ),
            ],
        verify: (_) {
          verify(() => topRatedMoviesUsecase.call(params: any(named: 'params')))
              .called(1);
          verify(() =>
                  nowPlayingMoviesUsecase.call(params: any(named: 'params')))
              .called(1);
          verify(() => genresUsecase.call(params: any(named: 'params')))
              .called(1);
          verify(() => localeUsecase.call(params: any(named: 'params')))
              .called(1);
        });
  });

  group('fetchTopRatedMovies', () {
    blocTest(
      'emits correct state when movies are fetched successfully',
      setUp: () {
        when(() => topRatedMoviesUsecase.call(params: any(named: 'params')))
            .thenAnswer((_) async => const Right(tTopRatedMoviesResultEntity));
      },
      build: () => cubit,
      act: (cubit) => cubit.fetchTopRatedMovies(),
      expect: () => [
        HomeState.initial().copyWith(topRatedStatus: TopRatedStatus.loading),
        HomeState.initial().copyWith(
          topRatedStatus: TopRatedStatus.filled,
          topRatedResult: tTopRatedMoviesResultEntity,
        ),
      ],
      verify: (_) =>
          verify(() => topRatedMoviesUsecase.call(params: tTopRatedParams))
              .called(1),
    );

    blocTest(
      'emits correct state when movies are fetched with failure',
      setUp: () {
        when(() => topRatedMoviesUsecase.call(params: any(named: 'params')))
            .thenAnswer(
                (_) async => const Left(UnknownFailure(message: 'message')));
      },
      build: () => cubit,
      act: (cubit) => cubit.fetchTopRatedMovies(),
      expect: () => [
        HomeState.initial().copyWith(topRatedStatus: TopRatedStatus.loading),
        HomeState.initial().copyWith(topRatedStatus: TopRatedStatus.error),
      ],
      verify: (_) =>
          verify(() => topRatedMoviesUsecase.call(params: tTopRatedParams))
              .called(1),
    );
  });

  group('fetchNowPlayingMovies', () {
    blocTest(
      'emits correct state when movies are fetched successfully',
      setUp: () {
        when(() => nowPlayingMoviesUsecase.call(params: any(named: 'params')))
            .thenAnswer(
                (_) async => const Right(tNowPlayingMoviesResultEntity));
      },
      build: () => cubit,
      act: (cubit) => cubit.fetchNowPlayingMovies(),
      expect: () => [
        HomeState.initial()
            .copyWith(nowPlayingStatus: NowPlayingStatus.loading),
        HomeState.initial().copyWith(
          nowPlayingStatus: NowPlayingStatus.filled,
          nowPlayingResult: tNowPlayingMoviesResultEntity,
        ),
      ],
      verify: (_) =>
          verify(() => nowPlayingMoviesUsecase.call(params: tNowPlayingParams))
              .called(1),
    );

    blocTest(
      'emits correct state when movies are fetched with failure',
      setUp: () {
        when(() => nowPlayingMoviesUsecase.call(params: any(named: 'params')))
            .thenAnswer(
                (_) async => const Left(UnknownFailure(message: 'message')));
      },
      build: () => cubit,
      act: (cubit) => cubit.fetchNowPlayingMovies(),
      expect: () => [
        HomeState.initial()
            .copyWith(nowPlayingStatus: NowPlayingStatus.loading),
        HomeState.initial().copyWith(nowPlayingStatus: NowPlayingStatus.error),
      ],
      verify: (_) =>
          verify(() => nowPlayingMoviesUsecase.call(params: tNowPlayingParams))
              .called(1),
    );
  });

  group('fetchGenres', () {
    blocTest(
      'emits correct state when genres are fetched successfully',
      setUp: () {
        when(() => genresUsecase.call(params: any(named: 'params')))
            .thenAnswer((_) async => const Right([tGenreEntity]));
      },
      build: () => cubit,
      act: (cubit) => cubit.fetchGenres(),
      expect: () => [
        HomeState.initial().copyWith(genresStatus: GenresStatus.loading),
        HomeState.initial().copyWith(
          genresStatus: GenresStatus.success,
          genres: [tGenreEntity],
        ),
      ],
      verify: (_) =>
          verify(() => genresUsecase.call(params: tGenresParams)).called(1),
    );

    blocTest(
      'emits correct state when genres are fetched with failure',
      setUp: () {
        when(() => genresUsecase.call(params: any(named: 'params'))).thenAnswer(
            (_) async => const Left(UnknownFailure(message: 'message')));
      },
      build: () => cubit,
      act: (cubit) => cubit.fetchGenres(),
      expect: () => [
        HomeState.initial().copyWith(genresStatus: GenresStatus.loading),
        HomeState.initial().copyWith(genresStatus: GenresStatus.error),
      ],
      verify: (_) =>
          verify(() => genresUsecase.call(params: tGenresParams)).called(1),
    );
  });
}
