import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:ifood_challenge/src/modules/bookmarks/presentation/bookmarks.dart';
import 'package:ifood_challenge/src/modules/home/presentation/home/cubit/home_cubit.dart';
import 'package:ifood_challenge/src/modules/home/presentation/home/widgets/home_page.dart';
import 'package:ifood_challenge/src/modules/home/presentation/main/ifood_challenge_bottom_navigation_bar.dart';
import 'package:ifood_challenge/src/modules/home/presentation/main/main_page.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../utils/widget_utils.dart';

class MockedHomeCubit extends Mock implements HomeCubit {}

void main() {
  late HomeCubit homeCubit;
  final injector = GetIt.instance;

  setUp(() {
    homeCubit = MockedHomeCubit();
    if (!injector.isRegistered<HomeCubit>()) {
      injector.registerFactory<HomeCubit>(() => homeCubit);
    }
  });

  testWidgets('[MainPage] should render correctly', (tester) async {
    whenListen(
      homeCubit,
      Stream.fromIterable([HomeState.initial()]),
      initialState: HomeState.initial(),
    );

    when(() => homeCubit.initialize(locale: any(named: 'locale')))
        .thenAnswer((_) async {});
    when(() => homeCubit.close()).thenAnswer((_) async {});

    await tester.pumpWidget(makeTestableWidget(const MainPage()));

    expect(find.byType(MainPage), findsOneWidget);
    expect(find.byType(Scaffold), findsAtLeast(1));
    expect(find.byType(BlocProvider<HomeCubit>), findsOneWidget);
    expect(find.byType(HomePage), findsOneWidget);
    expect(find.byType(IFoodChallengeBottomNavigationBar), findsOneWidget);
  });

  testWidgets('should perform bottom navigation correctly', (tester) async {
    whenListen(
      homeCubit,
      Stream.fromIterable([HomeState.initial()]),
      initialState: HomeState.initial(),
    );

    when(() => homeCubit.initialize(locale: any(named: 'locale')))
        .thenAnswer((_) async {});
    when(() => homeCubit.close()).thenAnswer((_) async {});

    await tester.pumpWidget(makeTestableWidget(const MainPage()));

    expect(find.byType(Scaffold), findsAtLeast(1));
    expect(find.byType(BlocProvider<HomeCubit>), findsOneWidget);
    expect(find.byType(HomePage), findsOneWidget);
    expect(find.byType(IFoodChallengeBottomNavigationBar), findsOneWidget);

    final bookMarksBottomNav = find.byKey(const Key('kBookmarksBottomNav'));
    await tester.tap(bookMarksBottomNav);
    await tester.pumpAndSettle();

    expect(find.byType(BookmarksPage), findsOneWidget);
  });
}
