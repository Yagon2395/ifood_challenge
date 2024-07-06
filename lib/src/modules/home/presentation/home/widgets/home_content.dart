import 'package:flutter/material.dart';
import 'package:ifood_challenge/src/application/l10n/l10n_extension.dart';
import 'package:ifood_challenge/src/modules/core/presentation/themes/ifood_challenge_theme_extension.dart';

import '../../../../core/presentation/tokens/ifood_challenge_spacing.dart';
import 'now_playing/now_playing_movies_sliver_content.dart';
import 'top_rated/top_rated_movies_content.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(IFoodChallengeSpacing.xs),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            titleSpacing: 0,
            title: Text(
              context.l10n.homeAppBarTitle,
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
          const SliverToBoxAdapter(
            child: TopRatedMoviesContent(),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: IFoodChallengeSpacing.xs,
            ),
          ),
          SliverToBoxAdapter(
            child: Text(
              context.l10n.nowPlayingHeading,
              style: context.theme.heading,
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: IFoodChallengeSpacing.xs,
            ),
          ),
          const NowPlayingMoviesSliverContent(),
        ],
      ),
    );
  }
}
