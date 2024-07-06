import 'package:flutter/material.dart';
import 'package:ifood_challenge/src/modules/core/presentation/themes/ifood_challenge_theme_extension.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/presentation/tokens/ifood_challenge_font_size.dart';
import '../../../../../core/presentation/tokens/ifood_challenge_spacing.dart';

class TopRatedMoviesSkeleton extends StatelessWidget {
  static const _itemCount = 3;
  const TopRatedMoviesSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [..._buildListByDemand()],
      ),
    );
  }

  List<Widget> _buildListByDemand() {
    List<Widget> children = [];
    for (int i = 0; i < _itemCount; i++) {
      children.add(const _MovieItemSkeleton());
      if (i + 1 < _itemCount) {
        children.add(const SizedBox(width: IFoodChallengeFontSize.xxxs));
      }
    }

    return children;
  }
}

class _MovieItemSkeleton extends StatelessWidget {
  const _MovieItemSkeleton();

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Skeleton.leaf(
              child: Card(
                child: ListTile(
                  minTileHeight: 156,
                ),
              ),
            ),
            const SizedBox(height: IFoodChallengeSpacing.xs),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: IFoodChallengeSpacing.xxxs),
              child: Bone.text(
                words: 2,
                style: context.theme.title,
              ),
            ),
            const SizedBox(height: IFoodChallengeSpacing.xxxs),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: IFoodChallengeSpacing.xxxs),
              child: Bone.text(
                words: 1,
                style: context.theme.subTitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
