import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

abstract class CoreModule {
  static Future<void> initializeDependencies() async {
    final injector = GetIt.instance;
    // Dio client
    injector.registerSingleton<Dio>(Dio());
  }
}
