import 'package:flutter/material.dart';
import 'package:ifood_challenge/src/application/l10n/l10n_extension.dart';
import 'package:ifood_challenge/src/modules/core/presentation/themes/ifood_challenge_theme_extension.dart';
import 'package:ifood_challenge/src/modules/core/presentation/utils/decimal_precision_extension.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/presentation/tokens/ifood_challenge_border_size.dart';
import '../../../../../core/presentation/tokens/ifood_challenge_spacing.dart';
import '../../../../domain/entities/genre_entity.dart';
import '../../../../domain/entities/now_playing_movie_entity.dart';
import '../../cubit/home_cubit.dart';

class NowPlayingMoviesSliverList extends StatelessWidget {
  final List<NowPlayingMovieEntity> movies;
  final List<GenreEntity> genres;
  final GenresStatus genresStatus;

  const NowPlayingMoviesSliverList({
    super.key,
    required this.movies,
    required this.genres,
    required this.genresStatus,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: movies.length,
        (BuildContext context, int index) {
          final item = movies[index];
          return _Movie(item, genres, genresStatus);
        },
      ),
    );
  }
}

class _Movie extends StatelessWidget {
  final NowPlayingMovieEntity movie;
  final List<GenreEntity> genres;
  final GenresStatus genresStatus;

  const _Movie(
    this.movie,
    this.genres,
    this.genresStatus,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(IFoodChallengeBorderSize.sm),
            ),
            child: Image.network(
              movie.posterUrl,
              fit: BoxFit.cover,
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
              _buildGenre(context),
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

  Widget _buildGenre(BuildContext context) {
    if (genresStatus == GenresStatus.loading) {
      return Skeletonizer(
        enabled: true,
        child: Bone.text(
          words: 1,
          style: context.theme.body.copyWith(fontWeight: FontWeight.w600),
        ),
      );
    }

    if (genresStatus == GenresStatus.success && genres.isNotEmpty) {
      return Text(
        _parseGenresToString(),
        style: context.theme.body.copyWith(fontWeight: FontWeight.w600),
      );
    }

    return const SizedBox.shrink();
  }

  String _parseGenresToString() {
    String parsedGenres = '';
    for (var genre in genres) {
      for (var id in movie.genreIds) {
        if (genre.id == id) {
          parsedGenres += genre.name;
          parsedGenres += ', ';
        }
      }
    }
    return parsedGenres.substring(0, parsedGenres.length - 2);
  }
}
