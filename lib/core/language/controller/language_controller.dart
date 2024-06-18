import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  Rx<Locale> currentLocale = const Locale('pt').obs;

  void changeLocale() {
    if (currentLocale.value.languageCode == 'pt') {
      currentLocale.value = const Locale('en');
    } else {
      currentLocale.value = const Locale('pt');
    }
    Get.updateLocale(currentLocale.value);
  }
}
