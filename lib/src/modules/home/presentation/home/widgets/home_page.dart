import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ifood_challenge/src/application/l10n/l10n_extension.dart';

import '../cubit/home_cubit.dart';
import 'home_content.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<HomeCubit>(
        create: (_) => GetIt.I()..initialize(locale: context.l10n.localeName),
        child: const HomeContent(),
      ),
    );
  }
}
