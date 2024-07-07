import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ifood_challenge/src/application/l10n/l10n_extension.dart';

import '../../../bookmarks/presentation/widgets/bookmarks_page.dart';
import '../../../search/presentation/widgets/search_page.dart';
import '../home/cubit/home_cubit.dart';
import '../home/widgets/home_page.dart';
import 'ifood_challenge_bottom_navigation_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Singletons must be initialized in this scope.
    // If necessary another singleton, change to MultiBlocProvider.
    return BlocProvider<HomeCubit>(
      create: (_) => GetIt.I()..initialize(locale: context.l10n.localeName),
      child: Scaffold(
        bottomNavigationBar: IFoodChallengeBottomNavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
        ),
        body: <Widget>[
          const HomePage(),
          const SearchPage(),
          const BookmarksPage(),
        ][currentPageIndex],
      ),
    );
  }
}
