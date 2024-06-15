import 'package:flutter/material.dart';
import 'package:tractian_test/features/home/presentation/pages/home_page.dart';
import 'package:tractian_test/settings/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TRACTIAN',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      home: const HomePage(),
    );
  }
}
