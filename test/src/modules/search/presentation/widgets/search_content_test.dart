import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ifood_challenge/src/modules/search/presentation/cubit/search_cubit.dart';
import 'package:ifood_challenge/src/modules/search/presentation/widgets/result_movies_sliver_list.dart';
import 'package:ifood_challenge/src/modules/search/presentation/widgets/search_content.dart';
import 'package:ifood_challenge/src/modules/search/presentation/widgets/search_empty.dart';
import 'package:ifood_challenge/src/modules/search/presentation/widgets/search_error.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../../../../utils/widget_utils.dart';
import '../../mocks/search_movies_response_mock.dart';

class MockedSearchCubit extends Mock implements SearchCubit {}

void main() {
  late SearchCubit searchCubit;

  setUp(() {
    searchCubit = MockedSearchCubit();
    when(() => searchCubit.close()).thenAnswer((_) async {
      return;
    });
  });

  testWidgets('should render [SearchEmpty] correctly', (tester) async {
    whenListen(
      searchCubit,
      Stream.fromIterable([
        SearchState.initial()
            .copyWith(searchMoviesStatus: SearchMoviesStatus.empty),
      ]),
      initialState: SearchState.initial()
          .copyWith(searchMoviesStatus: SearchMoviesStatus.empty),
    );

    await tester.pumpWidget(makeTestableWidget(
      BlocProvider(
        create: (context) => searchCubit,
        child: const Material(child: SearchContent()),
      ),
    ));

    expect(find.byType(SearchContent), findsOneWidget);
    expect(find.byType(SearchEmpty), findsOneWidget);
  });

  testWidgets('should render [SearchError] correctly', (tester) async {
    whenListen(
      searchCubit,
      Stream.fromIterable([
        SearchState.initial()
            .copyWith(searchMoviesStatus: SearchMoviesStatus.error),
      ]),
      initialState: SearchState.initial()
          .copyWith(searchMoviesStatus: SearchMoviesStatus.error),
    );

    await tester.pumpWidget(makeTestableWidget(
      BlocProvider(
        create: (context) => searchCubit,
        child: const Material(child: SearchContent()),
      ),
    ));

    expect(find.byType(SearchContent), findsOneWidget);
    expect(find.byType(SearchError), findsOneWidget);
  });

  testWidgets('should render [ResultMoviesSliverList] correctly',
      (tester) async {
    whenListen(
      searchCubit,
      Stream.fromIterable([
        SearchState.initial().copyWith(
          searchMoviesStatus: SearchMoviesStatus.filled,
          searchMoviesResult: tSearchMoviesResultEntity,
        ),
      ]),
      initialState: SearchState.initial().copyWith(
        searchMoviesStatus: SearchMoviesStatus.filled,
        searchMoviesResult: tSearchMoviesResultEntity,
      ),
    );

    await tester.pumpWidget(makeTestableWidget(
      BlocProvider(
        create: (context) => searchCubit,
        child: const Material(child: SearchContent()),
      ),
    ));

    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(makeTestableWidget(
        BlocProvider(
          create: (context) => searchCubit,
          child: const Material(child: SearchContent()),
        ),
      ));
    });

    expect(find.byType(SearchContent), findsOneWidget);
    expect(find.byType(ResultMoviesSliverList), findsOneWidget);
  });
}
