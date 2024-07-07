import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ifood_challenge/src/application/l10n/l10n_extension.dart';
import 'package:ifood_challenge/src/modules/core/presentation/themes/ifood_challenge_theme_extension.dart';

import '../../../core/presentation/tokens/ifood_challenge_font_size.dart';
import '../cubit/search_cubit.dart';

class SearchError extends StatelessWidget {
  const SearchError({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.tryAgainMessage,
          style: context.theme.body.copyWith(
            fontSize: IFoodChallengeFontSize.md,
          ),
        ),
        const SizedBox(
          width: IFoodChallengeFontSize.xs,
        ),
        GestureDetector(
          onTap: () => BlocProvider.of<SearchCubit>(context).searchMovies(),
          child: const Icon(Icons.refresh),
        )
      ],
    );
  }
}
