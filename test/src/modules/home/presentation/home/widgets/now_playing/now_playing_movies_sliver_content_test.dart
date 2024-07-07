import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ifood_challenge/src/modules/home/domain/entities/genre_entity.dart';
import 'package:ifood_challenge/src/modules/home/presentation/home/cubit/home_cubit.dart';
import 'package:ifood_challenge/src/modules/home/presentation/home/widgets/now_playing/now_playing_movies_empty.dart';
import 'package:ifood_challenge/src/modules/home/presentation/home/widgets/now_playing/now_playing_movies_error.dart';
import 'package:ifood_challenge/src/modules/home/presentation/home/widgets/now_playing/now_playing_movies_skeleton.dart';
import 'package:ifood_challenge/src/modules/home/presentation/home/widgets/now_playing/now_playing_movies_sliver_content.dart';
import 'package:ifood_challenge/src/modules/home/presentation/home/widgets/now_playing/now_playing_movies_sliver_list.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../../../../../../utils/widget_utils.dart';
import '../../../../mocks/now_playing_movies_response_mock.dart';

class MockedHomeCubit extends Mock implements HomeCubit {}

void main() {
  late HomeCubit homeCubit;

  setUp(() {
    homeCubit = MockedHomeCubit();
    when(() => homeCubit.close()).thenAnswer((_) async {
      return;
    });
  });

  testWidgets('should render [NowPlayingMoviesEmpty] correctly',
      (tester) async {
    whenListen(
      homeCubit,
      Stream.fromIterable([
        HomeState.initial().copyWith(nowPlayingStatus: NowPlayingStatus.empty),
      ]),
      initialState: HomeState.initial()
          .copyWith(nowPlayingStatus: NowPlayingStatus.empty),
    );

    await tester.pumpWidget(makeTestableWidget(
      BlocProvider(
        create: (context) => homeCubit,
        child: const CustomScrollView(slivers: [
          NowPlayingMoviesSliverContent(),
        ]),
      ),
    ));

    expect(find.byType(NowPlayingMoviesSliverContent), findsOneWidget);
    expect(find.byType(NowPlayingMoviesEmpty), findsOneWidget);
  });

  testWidgets('should render [NowPlayingMoviesSkeletonSliver] correctly',
      (tester) async {
    whenListen(
      homeCubit,
      Stream.fromIterable([
        HomeState.initial()
            .copyWith(nowPlayingStatus: NowPlayingStatus.loading),
      ]),
      initialState: HomeState.initial()
          .copyWith(nowPlayingStatus: NowPlayingStatus.loading),
    );

    await tester.pumpWidget(makeTestableWidget(
      BlocProvider(
        create: (context) => homeCubit,
        child: const CustomScrollView(slivers: [
          NowPlayingMoviesSliverContent(),
        ]),
      ),
    ));

    expect(find.byType(NowPlayingMoviesSliverContent), findsOneWidget);
    expect(find.byType(NowPlayingMoviesSkeletonSliver), findsOneWidget);
  });

  testWidgets('should render [NowPlayingMoviesError] correctly',
      (tester) async {
    whenListen(
      homeCubit,
      Stream.fromIterable([
        HomeState.initial().copyWith(nowPlayingStatus: NowPlayingStatus.error),
      ]),
      initialState: HomeState.initial()
          .copyWith(nowPlayingStatus: NowPlayingStatus.error),
    );

    await tester.pumpWidget(makeTestableWidget(
      BlocProvider(
        create: (context) => homeCubit,
        child: const CustomScrollView(slivers: [
          NowPlayingMoviesSliverContent(),
        ]),
      ),
    ));

    expect(find.byType(NowPlayingMoviesSliverContent), findsOneWidget);
    expect(find.byType(NowPlayingMoviesError), findsOneWidget);
  });

  testWidgets(
      'should render [NowPlayingMoviesSliverList] correctly '
      'with genres loading', (tester) async {
    whenListen(
      homeCubit,
      Stream.fromIterable([
        HomeState.initial().copyWith(
          nowPlayingStatus: NowPlayingStatus.filled,
          nowPlayingResult: tNowPlayingMoviesResultEntity,
          genresStatus: GenresStatus.loading,
        ),
      ]),
      initialState: HomeState.initial().copyWith(
        nowPlayingStatus: NowPlayingStatus.filled,
        nowPlayingResult: tNowPlayingMoviesResultEntity,
        genresStatus: GenresStatus.loading,
      ),
    );

    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(makeTestableWidget(
        BlocProvider(
          create: (context) => homeCubit,
          child: const CustomScrollView(slivers: [
            NowPlayingMoviesSliverContent(),
          ]),
        ),
      ));
    });

    await tester.pump(const Duration(seconds: 1));
    expect(find.byType(NowPlayingMoviesSliverContent), findsOneWidget);
    expect(find.byType(NowPlayingMoviesSliverList), findsOneWidget);
    expect(find.byKey(const Key('kSkeletonGenre')), findsOneWidget);
  });

  testWidgets(
      'should render [NowPlayingMoviesSliverList] correctly '
      'with genres success', (tester) async {
    whenListen(
      homeCubit,
      Stream.fromIterable([
        HomeState.initial().copyWith(
          nowPlayingStatus: NowPlayingStatus.filled,
          nowPlayingResult: tNowPlayingMoviesResultEntity,
          genresStatus: GenresStatus.success,
          genres: [const GenreEntity(id: 16, name: 'dumb name')],
        ),
      ]),
      initialState: HomeState.initial().copyWith(
        nowPlayingStatus: NowPlayingStatus.filled,
        nowPlayingResult: tNowPlayingMoviesResultEntity,
        genresStatus: GenresStatus.success,
        genres: [const GenreEntity(id: 16, name: 'dumb name')],
      ),
    );

    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(makeTestableWidget(
        BlocProvider(
          create: (context) => homeCubit,
          child: const CustomScrollView(slivers: [
            NowPlayingMoviesSliverContent(),
          ]),
        ),
      ));
    });

    await tester.pump(const Duration(seconds: 1));
    expect(find.byType(NowPlayingMoviesSliverContent), findsOneWidget);
    expect(find.byType(NowPlayingMoviesSliverList), findsOneWidget);
    expect(find.byKey(const Key('kGenreName')), findsOneWidget);
  });
}
