import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tractian_test/core/language/controller/language_controller.dart';
import 'package:tractian_test/core/utils/assets_route.dart';

import '../../../../../l10n/l10n.dart';

class SelectLanguageWidget extends StatefulWidget {
  const SelectLanguageWidget({super.key});

  @override
  State<SelectLanguageWidget> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguageWidget> {
  late ValueNotifier selectedLanguage = ValueNotifier(const Locale('pt'));

  var controller = Get.find<LanguageController>();
  @override
  void initState() {
    super.initState();
    if (controller.currentLocale.value.languageCode == 'pt') {
      selectedLanguage = ValueNotifier(L10n.pt);
    } else if (controller.currentLocale.value.languageCode == 'en') {
      selectedLanguage = ValueNotifier(L10n.en);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedLanguage,
      builder: (context, value, child) {
        return GestureDetector(
          onTap: () {
            controller.changeLocale();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 32,
              width: 32,
              child: Image.asset(
                controller.currentLocale.value.languageCode == 'pt'
                    ? AssetsRoute.brFLag
                    : AssetsRoute.enFlag,
                fit: BoxFit.fill,
              ),
            ),
          ),
        );
      },
    );
  }
}
