import 'package:flutter/material.dart';

import '../../settings/style/app_style_colors.dart';
import '../../settings/style/app_style_text.dart';

class BannerOfflineData extends StatelessWidget {
  const BannerOfflineData({
    super.key,
    required this.isVisible,
  });
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: SizedBox(
        child: Card(
          color: AppStyleColors.gray100,
          margin: EdgeInsets.zero,
          elevation: 0.0,
          shape: const RoundedRectangleBorder(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.wifi_off,
                  color: AppStyleColors.blue4,
                ),
                const SizedBox(width: 8),
                Text(
                  "Modo offline",
                  style: AppStyleText.regularSm.copyWith(
                    color: AppStyleColors.gray500,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
