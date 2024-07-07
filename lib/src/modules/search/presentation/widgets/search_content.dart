import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ifood_challenge/src/application/l10n/l10n_extension.dart';
import 'package:ifood_challenge/src/modules/core/presentation/themes/ifood_challenge_theme_extension.dart';

import '../../../core/presentation/tokens/ifood_challenge_spacing.dart';
import '../cubit/search_cubit.dart';
import 'movies_search_bar.dart';
import 'result_movies_sliver_list.dart';
import 'search_empty.dart';
import 'search_error.dart';

class SearchContent extends StatelessWidget {
  const SearchContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(IFoodChallengeSpacing.xs),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            titleSpacing: 0,
            title: Text(
              context.l10n.searchAppBarTitle,
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
            child: MoviesSearchBar(),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: IFoodChallengeSpacing.sm),
          ),
          BlocBuilder<SearchCubit, SearchState>(
            buildWhen: (p, c) =>
                (p.searchMoviesStatus != c.searchMoviesStatus) ||
                (p.searchMoviesResult != c.searchMoviesResult),
            builder: (context, state) {
              if (state.searchMoviesStatus == SearchMoviesStatus.error) {
                return const SliverToBoxAdapter(child: SearchError());
              }

              if (state.searchMoviesStatus == SearchMoviesStatus.empty) {
                return const SliverToBoxAdapter(child: SearchEmpty());
              }

              return ResultMoviesSliverList(
                movies: state.searchMoviesResult.results,
              );
            },
          ),
        ],
      ),
    );
  }
}
