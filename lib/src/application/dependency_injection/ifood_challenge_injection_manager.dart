import '../../modules/core/core_module.dart';
import '../../modules/home/home_module.dart';

abstract class IFoodChallengeInjectionManager {
  static Future<void> initialize() async {
    await CoreModule.initializeDependencies();
    await HomeModule.initializeDependencies();
  }
}
