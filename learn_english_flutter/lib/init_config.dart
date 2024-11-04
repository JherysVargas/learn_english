import 'package:firebase_core/firebase_core.dart';
import 'package:learn_english_flutter/core/di/injector.dart';

Future<void> initConfig() async {
  await Firebase.initializeApp();
  configureDependencies();
}
