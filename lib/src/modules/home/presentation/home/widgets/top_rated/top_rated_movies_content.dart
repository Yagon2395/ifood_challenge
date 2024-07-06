import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/home_cubit.dart';
import 'top_rated_movies_empty.dart';
import 'top_rated_movies_error.dart';
import 'top_rated_movies_list.dart';
import 'top_rated_movies_skeleton.dart';

class TopRatedMoviesContent extends StatelessWidget {
  const TopRatedMoviesContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (p, c) => p.topRatedStatus != c.topRatedStatus,
      builder: (context, state) {
        if (state.topRatedStatus == TopRatedStatus.loading) {
          return const TopRatedMoviesSkeleton();
        }

        if (state.topRatedStatus == TopRatedStatus.error) {
          return const TopRatedMoviesError();
        }

        if (state.topRatedStatus == TopRatedStatus.empty) {
          return const TopRatedMoviesEmpty();
        }

        return TopRatedMoviesList(movies: state.topRatedResult.results);
      },
    );
  }
}
