import 'package:flutter/material.dart';
import 'package:ifood_challenge/src/application/l10n/l10n_extension.dart';
import 'package:ifood_challenge/src/modules/core/presentation/themes/ifood_challenge_theme_extension.dart';

import '../../../core/presentation/tokens/ifood_challenge_font_size.dart';

class SearchEmpty extends StatelessWidget {
  const SearchEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Text(
            context.l10n.searchEmptyMessage,
            style: context.theme.body.copyWith(
              fontSize: IFoodChallengeFontSize.md,
            ),
          ),
        ),
      ],
    );
  }
}
