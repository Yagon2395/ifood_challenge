import 'package:flutter/material.dart';

import 'src/application/dependency_injection/ifood_challenge_injection_manager.dart';
import 'src/application/ifood_challenge_app.dart';

void main() async {
  await IFoodChallengeInjectionManager.initialize();
  runApp(const IFoodChallengeApp());
}
