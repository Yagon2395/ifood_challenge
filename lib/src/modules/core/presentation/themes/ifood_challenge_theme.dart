import 'package:flutter/material.dart';

import '../colors/ifood_challenge_colors.dart';
import '../typography/ifood_challenge_typography.dart';
import 'ifood_challenge_theme_extension.dart';

class IFoodChallengeTheme {
  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      extensions: <ThemeExtension<IFoodChallengeThemeExtension>>[
        IFoodChallengeThemeExtension(
          neutralBlack: IFoodChallengeColors.neutralBlack,
          neutralGray: IFoodChallengeColors.neutralGray,
          neutralWhite: IFoodChallengeColors.neutralWhite,
          primary: IFoodChallengeColors.primary,
          heading: IFoodChallengeTypography.heading,
          title: IFoodChallengeTypography.title,
          subTitle: IFoodChallengeTypography.subTitle,
          body: IFoodChallengeTypography.body,
          label: IFoodChallengeTypography.label,
          button: IFoodChallengeTypography.button,
        )
      ],
      scaffoldBackgroundColor: IFoodChallengeColors.neutralBlack,
      textTheme: const TextTheme(
        displayLarge: TextStyle(color: IFoodChallengeColors.neutralWhite),
        displaySmall: TextStyle(color: IFoodChallengeColors.neutralWhite),
        headlineLarge: TextStyle(color: IFoodChallengeColors.neutralWhite),
        headlineMedium: TextStyle(color: IFoodChallengeColors.neutralWhite),
        headlineSmall: TextStyle(color: IFoodChallengeColors.neutralWhite),
        titleLarge: TextStyle(color: IFoodChallengeColors.neutralWhite),
        titleMedium: TextStyle(color: IFoodChallengeColors.neutralWhite),
        titleSmall: TextStyle(color: IFoodChallengeColors.neutralWhite),
        bodyLarge: TextStyle(color: IFoodChallengeColors.neutralWhite),
        bodyMedium: TextStyle(color: IFoodChallengeColors.neutralWhite),
        bodySmall: TextStyle(color: IFoodChallengeColors.neutralWhite),
        labelLarge: TextStyle(color: IFoodChallengeColors.neutralWhite),
        labelMedium: TextStyle(color: IFoodChallengeColors.neutralWhite),
        labelSmall: TextStyle(color: IFoodChallengeColors.neutralWhite),
      ),
      cardTheme: const CardTheme(
        color: IFoodChallengeColors.neutralGray,
      ),
      iconTheme: const IconThemeData(color: IFoodChallengeColors.neutralWhite),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: IFoodChallengeColors.neutralBlack,
        surfaceTintColor: IFoodChallengeColors.neutralBlack,
        indicatorColor: IFoodChallengeColors.neutralBlack,
        labelTextStyle: WidgetStateTextStyle.resolveWith(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return IFoodChallengeTypography.label
                  .copyWith(color: IFoodChallengeColors.primary);
            }
            return IFoodChallengeTypography.label
                .copyWith(color: IFoodChallengeColors.neutralWhite);
          },
        ),
        iconTheme: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return const IconThemeData(color: IFoodChallengeColors.primary);
            }
            return const IconThemeData(
                color: IFoodChallengeColors.neutralWhite);
          },
        ),
      ),
    );
  }
}
