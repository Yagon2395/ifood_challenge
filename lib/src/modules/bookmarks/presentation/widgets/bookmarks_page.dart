import 'package:flutter/material.dart';
import 'package:ifood_challenge/src/application/l10n/l10n_extension.dart';
import 'package:ifood_challenge/src/modules/core/presentation/themes/ifood_challenge_theme_extension.dart';

import '../../../core/presentation/tokens/ifood_challenge_spacing.dart';

class BookmarksPage extends StatelessWidget {
  const BookmarksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(IFoodChallengeSpacing.xs),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            titleSpacing: 0,
            title: Text(
              context.l10n.bookmarksAppBarTitle,
              style: context.theme.heading,
            ),
            floating: true,
            surfaceTintColor: context.theme.neutralBlack,
            backgroundColor: context.theme.neutralBlack,
            foregroundColor: context.theme.neutralWhite,
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: IFoodChallengeSpacing.xs,
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      context.l10n.comingSoonMessage,
                      style: context.theme.title,
                    ),
                    const SizedBox(width: IFoodChallengeSpacing.xs),
                    const Icon(Icons.construction)
                  ],
                ),
                const SizedBox(height: IFoodChallengeSpacing.xs),
                Text(
                  context.l10n.inConstructionMessage,
                  style: context.theme.subTitle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
