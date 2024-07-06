import 'package:flutter/material.dart';

class IFoodChallengeThemeExtension
    extends ThemeExtension<IFoodChallengeThemeExtension> {
  final Color neutralBlack;
  final Color neutralGray;
  final Color neutralWhite;
  final Color primary;
  final TextStyle heading;
  final TextStyle title;
  final TextStyle subTitle;
  final TextStyle body;
  final TextStyle label;
  final TextStyle button;

  IFoodChallengeThemeExtension({
    required this.neutralBlack,
    required this.neutralGray,
    required this.neutralWhite,
    required this.primary,
    required this.heading,
    required this.title,
    required this.subTitle,
    required this.body,
    required this.label,
    required this.button,
  });

  @override
  ThemeExtension<IFoodChallengeThemeExtension> copyWith({
    Color? neutralBlack,
    Color? neutralGray,
    Color? neutralWhite,
    Color? primary,
    TextStyle? heading,
    TextStyle? title,
    TextStyle? subTitle,
    TextStyle? body,
    TextStyle? label,
    TextStyle? button,
  }) {
    return IFoodChallengeThemeExtension(
      neutralBlack: neutralBlack ?? this.neutralBlack,
      neutralGray: neutralGray ?? this.neutralGray,
      neutralWhite: neutralWhite ?? this.neutralWhite,
      primary: primary ?? this.primary,
      heading: heading ?? this.heading,
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      body: body ?? this.body,
      label: label ?? this.label,
      button: button ?? this.button,
    );
  }

  @override
  ThemeExtension<IFoodChallengeThemeExtension> lerp(
      covariant ThemeExtension<IFoodChallengeThemeExtension>? other, double t) {
    if (other is! IFoodChallengeThemeExtension) {
      return this;
    }

    return IFoodChallengeThemeExtension(
      neutralBlack: Color.lerp(neutralBlack, other.neutralBlack, t)!,
      neutralGray: Color.lerp(neutralGray, other.neutralGray, t)!,
      neutralWhite: Color.lerp(neutralWhite, other.neutralWhite, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      heading: TextStyle.lerp(heading, other.heading, t)!,
      title: TextStyle.lerp(title, other.title, t)!,
      subTitle: TextStyle.lerp(subTitle, other.subTitle, t)!,
      body: TextStyle.lerp(body, other.body, t)!,
      label: TextStyle.lerp(label, other.label, t)!,
      button: TextStyle.lerp(button, other.button, t)!,
    );
  }
}

extension ContextThemeExtension on BuildContext {
  IFoodChallengeThemeExtension get theme =>
      Theme.of(this).extension<IFoodChallengeThemeExtension>()!;
}
