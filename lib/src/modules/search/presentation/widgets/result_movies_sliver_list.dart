import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ifood_challenge/src/application/l10n/l10n_extension.dart';
import 'package:ifood_challenge/src/modules/core/presentation/themes/ifood_challenge_theme_extension.dart';
import 'package:ifood_challenge/src/modules/core/presentation/utils/decimal_precision_extension.dart';

import '../../../core/presentation/tokens/ifood_challenge_border_size.dart';
import '../../../core/presentation/tokens/ifood_challenge_spacing.dart';
import '../../domain/entities/search_movie_entity.dart';
import '../cubit/search_cubit.dart';

class ResultMoviesSliverList extends StatelessWidget {
  final List<SearchMovieEntity> movies;

  const ResultMoviesSliverList({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: movies.length,
        (BuildContext context, int index) {
          if (movies.length - 5 == index) {
            BlocProvider.of<SearchCubit>(context).searchMovies();
          }
          final item = movies[index];
          return _Movie(item);
        },
      ),
    );
  }
}

class _Movie extends StatelessWidget {
  final SearchMovieEntity movie;

  const _Movie(
    this.movie,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          fit: FlexFit.tight,
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(IFoodChallengeBorderSize.sm),
            ),
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/no-image.png',
              image: movie.posterUrl,
              fit: BoxFit.cover,
              imageErrorBuilder: (context, error, stackTrace) {
                return Image.asset('assets/no-image.png');
              },
            ),
          ),
        ),
        const SizedBox(width: IFoodChallengeSpacing.xs),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                movie.title,
                style: context.theme.title,
              ),
              Text.rich(
                TextSpan(text: context.l10n.topRatedRatingText, children: [
                  TextSpan(
                    text: '${movie.voteAverage.toPrecision(1)}',
                    style: context.theme.subTitle.copyWith(
                      color: context.theme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ]),
                style: context.theme.subTitle,
              ),
              Text(
                movie.overview,
                style: context.theme.body
                    .copyWith(color: context.theme.neutralGray),
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
