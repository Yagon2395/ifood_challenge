import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:ifood_challenge/src/modules/search/presentation/cubit/search_cubit.dart';
import 'package:ifood_challenge/src/modules/search/presentation/widgets/search_content.dart';
import 'package:ifood_challenge/src/modules/search/presentation/widgets/search_page.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../utils/widget_utils.dart';

class MockedSearchCubit extends Mock implements SearchCubit {}

void main() {
  late SearchCubit searchCubit;
  final injector = GetIt.instance;
  setUp(() {
    searchCubit = MockedSearchCubit();
    if (!injector.isRegistered<SearchCubit>()) {
      injector.registerFactory<SearchCubit>(() => searchCubit);
    }
  });

  testWidgets('[SearchPage] should render correctly', (tester) async {
    // Arrange
    whenListen(
      searchCubit,
      Stream.fromIterable([SearchState.initial()]),
      initialState: SearchState.initial(),
    );

    when(() => searchCubit.initialize(locale: any(named: 'locale')))
        .thenAnswer((_) async {});
    when(() => searchCubit.close()).thenAnswer((_) async {
      return;
    });

    // Act
    await tester.pumpWidget(makeTestableWidget(const SearchPage()));

    // Assert
    expect(find.byType(SearchPage), findsOneWidget);
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(BlocProvider<SearchCubit>), findsOneWidget);
    expect(find.byType(SearchContent), findsOneWidget);
  });
}
