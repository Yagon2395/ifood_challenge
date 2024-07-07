import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'data/datasources/logger_interceptor.dart';
import 'data/datasources/tmdb_authentication_interceptor.dart';

abstract class CoreModule {
  static Future<void> initializeDependencies() async {
    final injector = GetIt.instance;

    // Dio client
    final dioClient = Dio();
    dioClient.interceptors.add(TMDBAuthenticationInterceptor());
    dioClient.interceptors.add(LoggerInterceptor());
    injector.registerSingleton<Dio>(dioClient);
  }
}
