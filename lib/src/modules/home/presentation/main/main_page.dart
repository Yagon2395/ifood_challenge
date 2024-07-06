import 'package:flutter/material.dart';

import '../../../bookmarks/presentation/widgets/bookmarks_page.dart';
import '../../../search/presentation/widgets/search_page.dart';
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
    return Scaffold(
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
    );
  }
}
