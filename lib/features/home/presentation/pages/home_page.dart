import 'package:flutter/material.dart';
import 'package:tractian_test/settings/style/app_style_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyleColors.blueDark,
        title: Image.asset(
          'assets/images/tractian_logo.png',
          width: 160,
        ),
      ),
      body: const Column(
        children: [
          //
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //
        },
      ),
    );
  }
}
