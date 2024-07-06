import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/home_cubit.dart';
import 'now_playing_movies_empty.dart';
import 'now_playing_movies_error.dart';
import 'now_playing_movies_skeleton.dart';
import 'now_playing_movies_sliver_list.dart';

class NowPlayingMoviesSliverContent extends StatelessWidget {
  const NowPlayingMoviesSliverContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (p, c) =>
          p.nowPlayingStatus != c.nowPlayingStatus ||
          (p.genresStatus != c.genresStatus),
      builder: (context, state) {
        if (state.nowPlayingStatus == NowPlayingStatus.loading) {
          return const NowPlayingMoviesSkeletonSliver();
        }

        if (state.nowPlayingStatus == NowPlayingStatus.error) {
          return const SliverToBoxAdapter(
            child: NowPlayingMoviesError(),
          );
        }

        if (state.nowPlayingStatus == NowPlayingStatus.empty) {
          return const SliverToBoxAdapter(
            child: NowPlayingMoviesEmpty(),
          );
        }

        return NowPlayingMoviesSliverList(
          movies: state.nowPlayingResult.results,
          genres: state.genres,
          genresStatus: state.genresStatus,
        );
      },
    );
  }
}
