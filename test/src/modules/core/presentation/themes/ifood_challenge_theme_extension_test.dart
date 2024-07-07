import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ifood_challenge/src/modules/core/presentation/colors/ifood_challenge_colors.dart';
import 'package:ifood_challenge/src/modules/core/presentation/themes/ifood_challenge_theme_extension.dart';
import 'package:ifood_challenge/src/modules/core/presentation/typography/ifood_challenge_typography.dart';

void main() {
  group('copyWith', () {
    test('copyWith without arguments should not modify the origin obj', () {
      final obj1 = IFoodChallengeThemeExtension(
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
      );

      final obj2 = obj1.copyWith();
      expect(obj1.neutralBlack, obj2.neutralBlack);
      expect(obj1.neutralGray, obj2.neutralGray);
      expect(obj1.neutralWhite, obj2.neutralWhite);
      expect(obj1.primary, obj2.primary);
      expect(obj1.heading, obj2.heading);
      expect(obj1.title, obj2.title);
      expect(obj1.subTitle, obj2.subTitle);
      expect(obj1.body, obj2.body);
      expect(obj1.label, obj2.label);
      expect(obj1.button, obj2.button);
    });

    test('copyWith with arguments should modify the origin obj correctly', () {
      final obj1 = IFoodChallengeThemeExtension(
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
      );

      final obj2 = obj1.copyWith(neutralBlack: Colors.red);
      expect(obj1.neutralBlack, isNot(obj2.neutralBlack));
    });
  });

  group('lerp', () {
    test('should lerp correctly', () {
      IFoodChallengeThemeExtension extensionA1 = IFoodChallengeThemeExtension(
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
      );

      IFoodChallengeThemeExtension extensionA2 = IFoodChallengeThemeExtension(
        neutralBlack: Colors.red,
        neutralGray: Colors.green,
        neutralWhite: Colors.grey,
        primary: Colors.black,
        heading: IFoodChallengeTypography.heading.copyWith(fontSize: 10),
        title: IFoodChallengeTypography.title.copyWith(fontSize: 10),
        subTitle: IFoodChallengeTypography.subTitle.copyWith(fontSize: 10),
        body: IFoodChallengeTypography.body.copyWith(fontSize: 10),
        label: IFoodChallengeTypography.label.copyWith(fontSize: 10),
        button: IFoodChallengeTypography.button.copyWith(fontSize: 10),
      );

      ThemeData lerped = ThemeData.lerp(
        ThemeData(
          extensions: <ThemeExtension<dynamic>>[
            extensionA1,
          ],
        ),
        ThemeData(
          extensions: <ThemeExtension<dynamic>>{
            extensionA2,
          },
        ),
        0.5,
      );

      expect(lerped.extension<IFoodChallengeThemeExtension>()!.neutralBlack,
          const Color(0xff822a23));
    });
  });
}
