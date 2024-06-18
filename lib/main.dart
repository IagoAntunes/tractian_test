import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tractian_test/features/home/presentation/pages/home_page.dart';
import 'package:tractian_test/settings/bindings/app_bindings.dart';
import 'package:tractian_test/settings/theme/app_theme.dart';

import 'core/language/controller/language_controller.dart';
import 'features/assets/presentation/bindings/assets_binding.dart';
import 'features/assets/presentation/pages/assets_page.dart';
import 'features/home/presentation/binding/home_binding.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppBindings().dependencies();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final routes = [
    GetPage(
      name: '/home',
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: '/assets',
      page: () => const AssetsPage(),
      binding: AssetsBinding(),
    ),
  ];
  final controller = Get.find<LanguageController>();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TRACTIAN',
      locale: controller.currentLocale.value,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.light,
      initialBinding: AppBindings(),
      getPages: routes,
      initialRoute: '/home',
    );
  }
}
