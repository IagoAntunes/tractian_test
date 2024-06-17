import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tractian_test/settings/style/app_style_colors.dart';

import '../../../../core/utils/assets_route.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          AssetsRoute.tractianLogo,
          width: 160,
        ),
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
                  "Bem Vindo!",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppStyleColors.white,
                  ),
                ),
                Text(
                  "3 Unidades encontradas",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppStyleColors.white,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Get.toNamed('/assets', arguments: {'unit': 'Jaguar Unit'});
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
                            backgroundColor: AppStyleColors.gray200,
                            child: Icon(
                              Icons.arrow_right,
                              color: AppStyleColors.platformHeader,
                            ),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Jaguar Unit",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: AppStyleColors.platformHeader,
                                ),
                              ),
                            ],
                          ),
                          subtitle: Text(
                            "Jaguar Unit",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppStyleColors.platformHeader,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Divider(
                            color: AppStyleColors.gray200,
                            thickness: 2.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: ExpansionTile(
                            tilePadding: EdgeInsets.zero,
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Status",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppStyleColors.gray500,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: MaterialStateColor.resolveWith(
                                        (states) {
                                      if (true) {
                                        return const Color(
                                          0XFFebf9f2,
                                        );
                                      }
                                    }),
                                  ),
                                  child: const Text(
                                    "Baixado",
                                    style: TextStyle(
                                      color: Color(
                                        0XFF22ad5b,
                                      ),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed('/assets');
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
                            backgroundColor: AppStyleColors.gray200,
                            child: Icon(
                              Icons.arrow_right,
                              color: AppStyleColors.platformHeader,
                            ),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Jaguar Unit",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: AppStyleColors.platformHeader,
                                ),
                              ),
                            ],
                          ),
                          subtitle: Text(
                            "Jaguar Unit",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppStyleColors.platformHeader,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Divider(
                            color: AppStyleColors.gray200,
                            thickness: 2.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: ExpansionTile(
                            tilePadding: EdgeInsets.zero,
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Status",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppStyleColors.gray500,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: MaterialStateColor.resolveWith(
                                        (states) {
                                      if (true) {
                                        return const Color(
                                          0XFFebf9f2,
                                        );
                                      }
                                    }),
                                  ),
                                  child: const Text(
                                    "Baixado",
                                    style: TextStyle(
                                      color: Color(
                                        0XFF22ad5b,
                                      ),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
