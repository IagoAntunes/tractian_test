import 'package:flutter/material.dart';
import 'package:tractian_test/core/utils/assets_route.dart';
import 'package:tractian_test/features/assets/domain/entities/asset_entity.dart';
import 'package:tractian_test/features/assets/presentation/utils/assets_sensor_type.dart';
import 'package:tractian_test/features/assets/presentation/utils/assets_status_type.dart';
import 'package:tractian_test/settings/style/app_style_text.dart';

import '../../../../settings/style/app_style_colors.dart';

class AssetItem extends StatelessWidget {
  final Asset asset;
  final int depth;
  final bool isExpandable;
  final bool isExpanded;
  final VoidCallback? onTap;

  const AssetItem({
    super.key,
    required this.asset,
    required this.depth,
    this.isExpandable = false,
    this.isExpanded = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
        child: Row(
          children: [
            if (isExpandable)
              Icon(
                isExpanded ? Icons.expand_less : Icons.expand_more,
                color: AppStyleColors.platformHeader,
              ),
            if (!isExpandable)
              const Icon(
                Icons.lens_sharp,
                color: Colors.transparent,
              ),
            const SizedBox(width: 8),
            Image.asset(
              _getImageByType(asset.assetType),
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      asset.name,
                      style: AppStyleText.bodyRegular
                          .copyWith(color: AppStyleColors.platformHeader),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (asset.status != null) const SizedBox(width: 6),
                  if (asset.status != null) _getWidgetByStatus(),
                  if (asset.sensorType != null) const SizedBox(width: 6),
                  if (asset.sensorType != null) _getWidgetBySensorType(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getWidgetByStatus() {
    switch (asset.status) {
      case AssetsStatusType.alert:
        return Icon(
          Icons.circle,
          color: AppStyleColors.red,
          size: 12,
        );
      case AssetsStatusType.operating:
        return Icon(
          Icons.circle,
          color: AppStyleColors.green,
          size: 12,
        );
      default:
        return Container();
    }
  }

  Widget _getWidgetBySensorType() {
    switch (asset.sensorType) {
      case AssetsSensorType.energy:
        return Icon(
          Icons.bolt,
          color: AppStyleColors.green,
          size: 18,
        );
      case AssetsSensorType.vibration:
        return Icon(
          Icons.vibration,
          color: AppStyleColors.green,
          size: 18,
        );
      default:
        return Icon(Icons.circle, color: AppStyleColors.gray200);
    }
  }

  String _getImageByType(AssetType type) {
    switch (type) {
      case AssetType.location:
        return AssetsRoute.locationIcon;
      case AssetType.component:
        return AssetsRoute.componentIcon;
      case AssetType.asset:
        return AssetsRoute.assetIcon;
      default:
        return AssetsRoute.assetIcon;
    }
  }
}
