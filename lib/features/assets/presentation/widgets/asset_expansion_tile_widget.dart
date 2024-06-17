import 'package:flutter/material.dart';
import 'package:tractian_test/features/assets/domain/entities/asset_entity.dart';
import 'package:tractian_test/features/assets/presentation/widgets/asset_item.dart';

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
