import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tractian_test/features/assets/domain/entities/asset_entity.dart';
import 'package:tractian_test/features/assets/external/datasources/asset_datasource.dart';
import 'package:tractian_test/features/assets/infra/repositories/asset_repository.dart';
import 'package:tractian_test/features/assets/presentation/controllers/asset_controller.dart';
import 'package:tractian_test/features/assets/presentation/states/assets_page_state.dart';
import '../widgets/item_fitler_asset_widget.dart';

class AssetsPage extends StatelessWidget {
  AssetsPage({super.key});

  final assetsController = AssetController(
    assetRepository: AssetRepository(
      dataSource: AssetDataSource(),
    ),
  );

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
                  () => TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color(0xff8E98A3),
                      ),
                      hintText: "Busca Ativo ou Local",
                      hintStyle: const TextStyle(
                        color: Color(0xff8E98A3),
                        fontWeight: FontWeight.w400,
                      ),
                      contentPadding: EdgeInsets.zero,
                      filled: true,
                      enabled:
                          assetsController.state.value is! LoadingAssetsState,
                      fillColor: const Color(0xffEAEFF3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                Wrap(
                  children: [
                    Obx(
                      () => ItemFilterAsset(
                        text: 'Sensor de Energia',
                        icon: Icons.bolt_outlined,
                        onSelected: (p0) {
                          //logica
                        },
                        enabled:
                            assetsController.state.value is! LoadingAssetsState,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Obx(
                      () => ItemFilterAsset(
                        text: 'Crítico',
                        icon: Icons.error_outline,
                        onSelected: (p0) {
                          //logica
                        },
                        enabled:
                            assetsController.state.value is! LoadingAssetsState,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            color: Color(0xffD0D7DE),
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
                color: Colors.black,
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
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        height: 1.22,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (asset.status != null) const SizedBox(width: 6),
                  if (asset.status != null) _getWidgetByStatus(),
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
      case 'alert':
        return const Icon(
          Icons.circle,
          color: Colors.red,
          size: 12,
        );
      case 'energy':
        return const Icon(
          Icons.bolt,
          color: Colors.green,
          size: 12,
        );
      default:
        return _getWidgetBySensorType();
    }
  }

  Widget _getWidgetBySensorType() {
    switch (asset.sensorType) {
      case 'energy':
        return const Icon(
          Icons.bolt,
          color: Colors.green,
          size: 18,
        );
      case 'vibration':
        return const Icon(
          Icons.vibration,
          color: Colors.green,
          size: 18,
        );
      default:
        return const Icon(Icons.circle, color: Colors.grey);
    }
  }

  String _getImageByType(AssetType type) {
    switch (type) {
      case AssetType.location:
        return 'assets/images/location_icon.png';
      case AssetType.component:
        return 'assets/images/component_icon.png';
      case AssetType.asset:
        return 'assets/images/asset_icon.png';
      default:
        return 'assets/images/asset_icon.png';
    }
  }
}

class AssetExpansionTile extends StatefulWidget {
  final Asset asset;
  final int depth;
  final Widget Function(Asset) childBuilder;

  const AssetExpansionTile({
    super.key,
    required this.asset,
    required this.depth,
    required this.childBuilder,
  });

  @override
  // ignore: library_private_types_in_public_api
  _AssetExpansionTileState createState() => _AssetExpansionTileState();
}

class _AssetExpansionTileState extends State<AssetExpansionTile> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AssetItem(
          asset: widget.asset,
          depth: widget.depth,
          isExpandable: true,
          isExpanded: _expanded,
          onTap: () {
            setState(() {
              _expanded = !_expanded;
            });
          },
        ),
        if (_expanded)
          Column(
            children: widget.asset.children.map(widget.childBuilder).toList(),
          ),
      ],
    );
  }
}

class LinePainter extends CustomPainter {
  final int depth;

  LinePainter({required this.depth});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xffD0D7DE)
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    if (depth > 0) {
      double x = 8.0 * (0.5);
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
