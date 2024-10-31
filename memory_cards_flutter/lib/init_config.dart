import 'package:firebase_core/firebase_core.dart';
import 'package:memory_cards_flutter/core/di/injector.dart';

Future<void> initConfig() async {
  await Firebase.initializeApp();
  configureDependencies();
}
