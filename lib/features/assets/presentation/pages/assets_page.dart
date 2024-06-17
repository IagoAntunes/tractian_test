import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tractian_test/core/widgets/c_text_field.dart';
import 'package:tractian_test/features/assets/domain/entities/asset_entity.dart';
import 'package:tractian_test/features/assets/presentation/controllers/asset_controller.dart';
import 'package:tractian_test/features/assets/presentation/pages/qr_code_page.dart';
import 'package:tractian_test/features/assets/presentation/states/assets_page_state.dart';
import 'package:tractian_test/features/assets/presentation/utils/filters_sensors_status.dart';
import 'package:tractian_test/features/assets/presentation/widgets/asset_item.dart';
import 'package:tractian_test/settings/style/app_style_colors.dart';
import 'package:tractian_test/settings/style/app_style_text.dart';
import '../widgets/asset_expansion_tile_widget.dart';
import '../widgets/item_fitler_asset_widget.dart';
import '../widgets/line_painter_tree.dart';

class AssetsPage extends StatefulWidget {
  const AssetsPage({super.key});

  @override
  State<AssetsPage> createState() => _AssetsPageState();
}

class _AssetsPageState extends State<AssetsPage> {
  final assetsController = Get.find<AssetController>();
  final searchController = TextEditingController();

  final Map<String, dynamic> arguments = Get.arguments;
  @override
  void initState() {
    super.initState();
    assetsController.nameUnit = arguments['unit'];
    assetsController.getData();
  }

  String _formatUnitName(String unitName) {
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
        title: Text(" ${_formatUnitName(assetsController.nameUnit!)} - Assets"),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(const QrCodeView())?.then((value) {
                if (value != null) {
                  searchController.text = value;
                  assetsController.filterByText(value);
                }
              });
            },
            icon: const Icon(Icons.qr_code),
          )
        ],
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
              () => switch (assetsController.state.value) {
                LoadingAssetsState() => _buildLoadingTree(0),
                SuccessAssetsState() => assetsController
                        .state.value.assets.isEmpty
                    ? SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.filter_list,
                              size: 48,
                            ),
                            Text(
                              "Nenhum ativo encontrado",
                              style: AppStyleText.mediumLg.copyWith(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "Refaça os filtros e tente novamente",
                              style: AppStyleText.regularSm.copyWith(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      )
                    : CustomScrollView(
                        slivers: [
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                var asset =
                                    assetsController.state.value.assets[index];
                                return _buildTree(asset, 0);
                              },
                              childCount:
                                  assetsController.state.value.assets.length,
                            ),
                          ),
                        ],
                      ),
                _ => _buildLoadingTree(0),
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTree(Asset asset, int depth) {
    if (assetsController.state is LoadingAssetsState) {
      return _buildLoadingTree(depth);
    }

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

  Widget _buildLoadingTree(int depth) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: _buildLineTile(
        depth: depth,
        child: Shimmer.fromColors(
          baseColor: AppStyleColors.gray200,
          highlightColor: AppStyleColors.gray100,
          child: Column(
            children: List.generate(
              3,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppStyleColors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  width: double.infinity,
                  height: 25.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
