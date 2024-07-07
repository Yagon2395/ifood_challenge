import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ifood_challenge/src/modules/home/presentation/home/cubit/home_cubit.dart';
import 'package:ifood_challenge/src/modules/home/presentation/home/widgets/top_rated/top_rated_movies_content.dart';
import 'package:ifood_challenge/src/modules/home/presentation/home/widgets/top_rated/top_rated_movies_empty.dart';
import 'package:ifood_challenge/src/modules/home/presentation/home/widgets/top_rated/top_rated_movies_error.dart';
import 'package:ifood_challenge/src/modules/home/presentation/home/widgets/top_rated/top_rated_movies_list.dart';
import 'package:ifood_challenge/src/modules/home/presentation/home/widgets/top_rated/top_rated_movies_skeleton.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../../../../../../utils/widget_utils.dart';
import '../../../../mocks/top_rated_movies_response_mock.dart';

class MockedHomeCubit extends Mock implements HomeCubit {}

void main() {
  late HomeCubit homeCubit;

  setUp(() {
    homeCubit = MockedHomeCubit();
    when(() => homeCubit.close()).thenAnswer((_) async {
      return;
    });
  });

  testWidgets('should render [TopRatedMoviesEmpty] correctly', (tester) async {
    whenListen(
      homeCubit,
      Stream.fromIterable([
        HomeState.initial().copyWith(topRatedStatus: TopRatedStatus.empty),
      ]),
      initialState:
          HomeState.initial().copyWith(topRatedStatus: TopRatedStatus.empty),
    );

    await tester.pumpWidget(makeTestableWidget(
      BlocProvider(
        create: (context) => homeCubit,
        child: const TopRatedMoviesContent(),
      ),
    ));

    expect(find.byType(TopRatedMoviesContent), findsOneWidget);
    expect(find.byType(TopRatedMoviesEmpty), findsOneWidget);
  });

  testWidgets('should render [TopRatedMoviesSkeleton] correctly',
      (tester) async {
    whenListen(
      homeCubit,
      Stream.fromIterable([
        HomeState.initial().copyWith(topRatedStatus: TopRatedStatus.loading),
      ]),
      initialState:
          HomeState.initial().copyWith(topRatedStatus: TopRatedStatus.loading),
    );

    await tester.pumpWidget(makeTestableWidget(
      BlocProvider(
        create: (context) => homeCubit,
        child: const TopRatedMoviesContent(),
      ),
    ));

    expect(find.byType(TopRatedMoviesContent), findsOneWidget);
    expect(find.byType(TopRatedMoviesSkeleton), findsOneWidget);
  });

  testWidgets('should render [TopRatedMoviesError] correctly', (tester) async {
    whenListen(
      homeCubit,
      Stream.fromIterable([
        HomeState.initial().copyWith(topRatedStatus: TopRatedStatus.error),
      ]),
      initialState:
          HomeState.initial().copyWith(topRatedStatus: TopRatedStatus.error),
    );

    await tester.pumpWidget(makeTestableWidget(
      BlocProvider(
        create: (context) => homeCubit,
        child: const TopRatedMoviesContent(),
      ),
    ));

    expect(find.byType(TopRatedMoviesContent), findsOneWidget);
    expect(find.byType(TopRatedMoviesError), findsOneWidget);
  });

  testWidgets('should render [TopRatedMoviesList] correctly', (tester) async {
    whenListen(
      homeCubit,
      Stream.fromIterable([
        HomeState.initial().copyWith(
          topRatedStatus: TopRatedStatus.filled,
          topRatedResult: tTopRatedMoviesResultEntity,
        ),
      ]),
      initialState: HomeState.initial().copyWith(
        topRatedStatus: TopRatedStatus.filled,
        topRatedResult: tTopRatedMoviesResultEntity,
      ),
    );

    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(makeTestableWidget(
        BlocProvider(
          create: (context) => homeCubit,
          child: const TopRatedMoviesContent(),
        ),
      ));
    });

    expect(find.byType(TopRatedMoviesContent), findsOneWidget);
    expect(find.byType(TopRatedMoviesList), findsOneWidget);
  });
}
