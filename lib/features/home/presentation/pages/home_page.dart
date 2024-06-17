import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tractian_test/settings/style/app_style_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/tractian_logo.png',
          width: 160,
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Filtre uma unidade',
                    hintStyle: const TextStyle(
                      color: AppStyleColors.onPrimaryLight,
                      fontWeight: FontWeight.w300,
                    ),
                    suffixIcon: const Icon(Icons.search_outlined),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppStyleColors.backgroundColorDark,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Get.toNamed('/assets');
              },
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppStyleColors.brandPrimaryDefault,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: AppStyleColors.white,
                    child: const Icon(
                      Icons.factory,
                      color: AppStyleColors.brandPrimaryDefault,
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_right),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Jaguar Unit",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppStyleColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
