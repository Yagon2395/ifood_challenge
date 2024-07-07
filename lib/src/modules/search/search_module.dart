import 'package:get_it/get_it.dart';

import 'data/datasources/search_datasource.dart';
import 'data/datasources/search_remote_datasource.dart';
import 'data/repositories/search_repository_impl.dart';
import 'domain/repositories/search_repository.dart';
import 'domain/usecases/search_movies_usecase.dart';
import 'presentation/cubit/search_cubit.dart';

abstract class SearchModule {
  static Future<void> initializeDependencies() async {
    final injector = GetIt.instance;

    // Datasources
    injector.registerSingleton<SearchDatasource>(
      SearchRemoteDatasource(client: injector()),
    );

    // Repositories
    injector.registerFactory<SearchRepository>(
      () => SearchRepositoryImpl(datasource: injector()),
    );

    // UseCases
    injector.registerFactory<SearchMoviesUsecase>(
      () => SearchMoviesUsecase(repository: injector()),
    );

    // Blocs and Cubits
    injector.registerFactory<SearchCubit>(
      () => SearchCubit(
        searchMoviesUsecase: injector(),
        localeUsecase: injector(),
      ),
    );
  }
}
