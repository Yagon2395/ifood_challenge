import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../modules/core/presentation/themes/ifood_challenge_theme.dart';
import '../modules/home/presentation/main/main_page.dart';

class IFoodChallengeApp extends StatelessWidget {
  const IFoodChallengeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: IFoodChallengeTheme.dark,
      home: const MainPage(),
    );
  }
}
