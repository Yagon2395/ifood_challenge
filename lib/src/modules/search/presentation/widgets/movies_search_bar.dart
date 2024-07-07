import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ifood_challenge/src/application/l10n/l10n_extension.dart';
import 'package:ifood_challenge/src/modules/core/presentation/themes/ifood_challenge_theme_extension.dart';
import 'package:ifood_challenge/src/modules/core/presentation/tokens/ifood_challenge_border_size.dart';

import '../cubit/search_cubit.dart';

class MoviesSearchBar extends StatefulWidget {
  const MoviesSearchBar({super.key});

  @override
  State<MoviesSearchBar> createState() => _MoviesSearchBarState();
}

class _MoviesSearchBarState extends State<MoviesSearchBar> {
  Timer? _timer;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) async {
        if (_timer != null) {
          _timer?.cancel();
        }
        _timer = Timer(const Duration(milliseconds: 600), () async {
          BlocProvider.of<SearchCubit>(context).searchMovies(
            keyword: value,
            reset: value.isEmpty,
          );
        });
      },
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          color: context.theme.neutralWhite,
        ),
        contentPadding: const EdgeInsets.all(16),
        label: Text(context.l10n.searchBarLabel),
        labelStyle: context.theme.body.copyWith(
          color: context.theme.neutralGray,
        ),
        floatingLabelStyle: context.theme.body.copyWith(
          color: context.theme.neutralWhite,
          fontWeight: FontWeight.w500,
        ),
        hintText: context.l10n.searchBarHint,
        hintStyle: context.theme.button.copyWith(
          color: context.theme.neutralGray,
          fontWeight: FontWeight.w300,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: context.theme.neutralWhite),
          borderRadius: BorderRadius.circular(IFoodChallengeBorderSize.xs),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: context.theme.primary, width: 2),
          borderRadius: BorderRadius.circular(IFoodChallengeBorderSize.xs),
        ),
      ),
    );
  }
}
