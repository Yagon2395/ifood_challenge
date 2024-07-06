import 'package:get_it/get_it.dart';

import 'data/datasources/home_datasource.dart';
import 'data/datasources/home_remote_datasource.dart';
import 'data/repositories/home_repository_impl.dart';
import 'domain/repositories/home_repository.dart';
import 'domain/usecases/genres_usecase.dart';
import 'domain/usecases/now_playing_movies_usecase.dart';
import 'domain/usecases/top_rated_movies_usecase.dart';
import 'presentation/home/cubit/home_cubit.dart';

abstract class HomeModule {
  static Future<void> initializeDependencies() async {
    final injector = GetIt.instance;

    // Datasources
    injector.registerSingleton<HomeDatasource>(
      HomeRemoteDatasource(client: injector()),
    );

    // Repositories
    injector.registerFactory<HomeRepository>(
      () => HomeRepositoryImpl(datasource: injector()),
    );

    // UseCases
    injector.registerFactory<TopRatedMoviesUsecase>(
      () => TopRatedMoviesUsecase(repository: injector()),
    );
    injector.registerFactory<NowPlayingMoviesUsecase>(
      () => NowPlayingMoviesUsecase(repository: injector()),
    );
    injector.registerFactory<GenresUsecase>(
      () => GenresUsecase(repository: injector()),
    );

    // Blocs and Cubits
    injector.registerFactory<HomeCubit>(
      () => HomeCubit(
        topRatedMoviesUsecase: injector(),
        nowPlayingMoviesUsecase: injector(),
        genresUsecase: injector(),
      ),
    );
  }
}
