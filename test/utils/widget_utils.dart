import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ifood_challenge/src/modules/core/presentation/themes/ifood_challenge_theme.dart';

Widget makeTestableWidget(Widget child) {
  return MaterialApp(
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    theme: IFoodChallengeTheme.dark,
    home: child,
  );
}
