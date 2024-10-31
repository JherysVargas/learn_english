import 'package:flutter/material.dart';
import 'package:memory_cards_flutter/config/theme.dart';

import 'features/game/presentation/views/views.dart';
import 'init_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initConfig();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learn English',
      theme: AppTheme.theme,
      home: const BoardGame(),
      debugShowCheckedModeBanner: false,
    );
  }
}
