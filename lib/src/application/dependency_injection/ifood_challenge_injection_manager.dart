import '../../modules/core/core_module.dart';
import '../../modules/home/home_module.dart';
import '../../modules/search/search_module.dart';

abstract class IFoodChallengeInjectionManager {
  static Future<void> initialize() async {
    await CoreModule.initializeDependencies();
    await HomeModule.initializeDependencies();
    await SearchModule.initializeDependencies();
  }
}
