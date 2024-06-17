import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tractian_test/core/widgets/c_text_field.dart';
import 'package:tractian_test/features/assets/domain/entities/asset_entity.dart';
import 'package:tractian_test/features/assets/presentation/controllers/asset_controller.dart';
import 'package:tractian_test/features/assets/presentation/states/assets_page_state.dart';
import 'package:tractian_test/features/assets/presentation/utils/filters_sensors_status.dart';
import 'package:tractian_test/features/assets/presentation/widgets/asset_item.dart';
import 'package:tractian_test/settings/style/app_style_colors.dart';
import '../widgets/asset_expansion_tile_widget.dart';
import '../widgets/item_fitler_asset_widget.dart';
import '../widgets/line_painter_tree.dart';

class AssetsPage extends StatelessWidget {
  AssetsPage({super.key});

  final assetsController = Get.find<AssetController>();

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Assets"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => CTextField(
                    controller: searchController,
                    hintText: 'Buscar Ativo ou Local',
                    onChanged: (value) {
                      assetsController.filterByText(value);
                    },
                    fillColor: AppStyleColors.gray100,
                    enabled:
                        assetsController.state.value is! LoadingAssetsState,
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.clear,
                        color: AppStyleColors.gray500,
                      ),
                      onPressed: () {
                        searchController.clear();
                        assetsController.filterByText('');
                      },
                    ),
                  ),
                ),
                Wrap(
                  spacing: 8.0,
                  children: [
                    for (var status in AssetFiltersSensors.statusList)
                      Obx(
                        () => ItemFilterAsset(
                          text: status.name,
                          icon: status.icon,
                          onSelected: (value) => value
                              ? assetsController.addStatusFilter(status.search)
                              : assetsController
                                  .removeStatusFilter(status.search),
                          enabled: assetsController.state.value
                              is! LoadingAssetsState,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            color: AppStyleColors.divider,
            thickness: 2,
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: assetsController.state.value.assets.length,
                itemBuilder: (context, index) {
                  var asset = assetsController.state.value.assets[index];
                  return _buildTree(asset, 0);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTree(Asset asset, int depth) {
    if (asset.children.isEmpty) {
      return Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: _buildLineTile(
          depth: depth,
          child: AssetItem(
            asset: asset,
            depth: depth,
            isExpandable: false,
          ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: _buildLineTile(
        depth: depth,
        child: AssetExpansionTile(
          asset: asset,
          depth: depth,
          childBuilder: (child) => _buildTree(child, depth + 1),
        ),
      ),
    );
  }

  Widget _buildLineTile({required int depth, required Widget child}) {
    return Stack(
      children: [
        Positioned.fill(
          child: CustomPaint(
            painter: LinePainter(depth: depth),
          ),
        ),
        child,
      ],
    );
  }
}
