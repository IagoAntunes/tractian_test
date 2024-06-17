import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tractian_test/features/home/presentation/pages/home_page.dart';
import 'package:tractian_test/settings/bindings/app_bindings.dart';
import 'package:tractian_test/settings/theme/app_theme.dart';

import 'features/assets/presentation/bindings/assets_binding.dart';
import 'features/assets/presentation/pages/assets_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final routes = [
    GetPage(name: '/home', page: () => const HomePage()),
    GetPage(
      name: '/assets',
      page: () => AssetsPage(),
      binding: AssetsBinding(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TRACTIAN',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.light,
      home: const HomePage(),
      initialBinding: AppBindings(),
      getPages: routes,
    );
  }
}
