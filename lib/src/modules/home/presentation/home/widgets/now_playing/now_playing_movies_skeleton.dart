import 'package:flutter/material.dart';
import 'package:ifood_challenge/src/modules/core/presentation/themes/ifood_challenge_theme_extension.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/presentation/tokens/ifood_challenge_spacing.dart';

class NowPlayingMoviesSkeletonSliver extends StatelessWidget {
  static const _itemCount = 3;
  const NowPlayingMoviesSkeletonSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: _itemCount,
        (BuildContext context, int index) {
          return const _MovieSkeleton();
        },
      ),
    );
  }
}

class _MovieSkeleton extends StatelessWidget {
  const _MovieSkeleton();

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Flexible(
            child: Skeleton.leaf(
              child: Card(
                child: ListTile(
                  minTileHeight: 156,
                ),
              ),
            ),
          ),
          const SizedBox(width: IFoodChallengeSpacing.xs),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Bone.text(words: 2, style: context.theme.title),
                const SizedBox(height: IFoodChallengeSpacing.xxxs),
                Bone.text(width: 100, style: context.theme.subTitle),
                const SizedBox(height: IFoodChallengeSpacing.xxxs),
                Bone.text(
                  words: 1,
                  style:
                      context.theme.body.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: IFoodChallengeSpacing.xxxs),
                Bone.text(
                  style: context.theme.body.copyWith(
                    color: context.theme.neutralGray,
                  ),
                ),
                const SizedBox(height: IFoodChallengeSpacing.smallest),
                Bone.text(
                  style: context.theme.body.copyWith(
                    color: context.theme.neutralGray,
                  ),
                ),
                const SizedBox(height: IFoodChallengeSpacing.smallest),
                Bone.text(
                  style: context.theme.body.copyWith(
                    color: context.theme.neutralGray,
                  ),
                ),
                const SizedBox(height: IFoodChallengeSpacing.smallest),
                Bone.text(
                  style: context.theme.body.copyWith(
                    color: context.theme.neutralGray,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
