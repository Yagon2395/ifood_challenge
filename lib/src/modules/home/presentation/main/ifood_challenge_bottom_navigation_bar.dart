import 'package:flutter/material.dart';
import 'package:ifood_challenge/src/application/l10n/l10n_extension.dart';

class IFoodChallengeBottomNavigationBar extends StatelessWidget {
  final ValueChanged<int> onDestinationSelected;
  final int selectedIndex;

  const IFoodChallengeBottomNavigationBar({
    required this.onDestinationSelected,
    this.selectedIndex = 0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: onDestinationSelected,
      selectedIndex: selectedIndex,
      destinations: <Widget>[
        NavigationDestination(
          key: const Key('kHomeBottomNav'),
          icon: const Icon(Icons.home_outlined),
          label: context.l10n.bottomNavBarLabelHome,
        ),
        NavigationDestination(
          key: const Key('kSearchBottomNav'),
          icon: const Icon(Icons.search_outlined),
          label: context.l10n.bottomNavBarLabelSearch,
        ),
        NavigationDestination(
          key: const Key('kBookmarksBottomNav'),
          icon: const Icon(Icons.bookmark),
          label: context.l10n.bottomNavBarLabelBookmarks,
        ),
      ],
    );
  }
}
