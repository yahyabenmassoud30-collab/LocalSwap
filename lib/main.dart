import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'theme/app_theme.dart';

void main() => runApp(const LocalSwapApp());

class LocalSwapApp extends StatelessWidget {
  const LocalSwapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LocalSwap',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light, // Partie B.4 : thème global
      home: const HomeScreen(),
    );
  }
}
