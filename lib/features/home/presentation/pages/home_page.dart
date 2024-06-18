import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tractian_test/core/widgets/banner_offline_data.dart';
import 'package:tractian_test/features/home/presentation/controllers/home_controller.dart';
import 'package:tractian_test/features/home/presentation/states/home_state.dart';
import 'package:tractian_test/settings/style/app_style_colors.dart';
import '../../../../core/language/widgets/select_language.dart';
import '../../../../core/utils/assets_route.dart';
import '../widgets/status_unit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final homeController = Get.find<HomeController>();

  String formatUnitName(String unitName) {
    List<String> parts = unitName.split('_');
    List<String> formattedParts = parts.map((part) {
      if (part.isEmpty) return part;
      return part[0].toUpperCase() + part.substring(1).toLowerCase();
    }).toList();
    return formattedParts.join(' ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          AssetsRoute.tractianLogo,
          width: 160,
        ),
        actions: const [
          SelectLanguageWidget(),
        ],
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 24),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppStyleColors.platformHeader,
            ),
            child: Column(
              children: [
                Text(
                  AppLocalizations.of(context)!.title_welcome,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppStyleColors.white,
                  ),
                ),
                Text(
                  "3 ${AppLocalizations.of(context)!.subtitle_units_found}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppStyleColors.white,
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () => BannerOfflineData(
              isVisible: homeController.state.value is SuccessHomeState
                  ? (homeController.state.value as SuccessHomeState).offlineData
                  : false,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
              child: Obx(
                () => ListView.separated(
                  itemCount: homeController.state.value.unities.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Get.toNamed('/assets', arguments: {
                        'unit': homeController.state.value.unities[index].name
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppStyleColors.gray200,
                          width: 2.0,
                        ),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            trailing: CircleAvatar(
                              backgroundColor: AppStyleColors.gray100,
                              child: Icon(
                                Icons.arrow_right,
                                color: AppStyleColors.platformHeader,
                              ),
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  formatUnitName(homeController
                                      .state.value.unities[index].name),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: AppStyleColors.platformHeader,
                                  ),
                                ),
                              ],
                            ),
                            subtitle: Text(
                              AppLocalizations.of(context)!
                                  .text_unit_information,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppStyleColors.platformHeader,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Divider(
                              color: AppStyleColors.gray200,
                              thickness: 2.0,
                            ),
                          ),
                          StatusUnit(
                            nameUnit:
                                homeController.state.value.unities[index].name,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
