import 'package:flutter/material.dart';
import 'package:ifood_challenge/src/application/l10n/l10n_extension.dart';
import 'package:ifood_challenge/src/modules/core/presentation/themes/ifood_challenge_theme_extension.dart';

import '../../../../../core/presentation/tokens/ifood_challenge_border_size.dart';
import '../../../../../core/presentation/tokens/ifood_challenge_spacing.dart';
import '../../../../domain/entities/top_rated_movie_entity.dart';

class TopRatedMoviesList extends StatelessWidget {
  final List<TopRatedMovieEntity> movies;
  const TopRatedMoviesList({required this.movies, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: IntrinsicHeight(
        child: Row(
          children: [..._buildListByDemand()],
        ),
      ),
    );
  }

  List<Widget> _buildListByDemand() {
    List<Widget> children = [];
    for (int i = 0; i < movies.length; i++) {
      final item = movies[i];
      children.add(_MovieItem(item));
      if (i + 1 < movies.length) {
        children.add(const SizedBox(width: IFoodChallengeSpacing.xxs));
      }
    }

    return children;
  }
}

class _MovieItem extends StatelessWidget {
  final TopRatedMovieEntity movie;
  const _MovieItem(this.movie);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - IFoodChallengeSpacing.md,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(IFoodChallengeBorderSize.sm),
            ),
            child: Image.network(
              movie.backdropUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: IFoodChallengeSpacing.xs),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: IFoodChallengeSpacing.xxxs),
            child: Text(
              movie.title,
              maxLines: 2,
              style: context.theme.title,
            ),
          ),
          const SizedBox(height: IFoodChallengeSpacing.smallest),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: IFoodChallengeSpacing.xxxs),
            child: Text.rich(
              TextSpan(
                  text: context.l10n.topRatedRatingText,
                  children: [TextSpan(text: '${movie.voteAverage}')]),
              style: context.theme.subTitle,
            ),
          ),
        ],
      ),
    );
  }
}
