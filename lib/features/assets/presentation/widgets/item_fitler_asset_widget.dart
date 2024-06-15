import 'package:flutter/material.dart';
import 'package:tractian_test/settings/style/app_style_colors.dart';

enum ItemFilterAssetState {
  selected,
  unselected,
}

class ItemFilterAsset extends StatefulWidget {
  const ItemFilterAsset({
    super.key,
    required this.onSelected,
    required this.text,
    required this.icon,
    this.enabled = true,
  });
  final Function(bool)? onSelected;
  final String text;
  final IconData icon;
  final bool enabled;
  @override
  State<ItemFilterAsset> createState() => _ItemFilterAssetState();
}

class _ItemFilterAssetState extends State<ItemFilterAsset> {
  ItemFilterAssetState state = ItemFilterAssetState.unselected;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      selected: state == ItemFilterAssetState.selected,
      onSelected: widget.enabled
          ? (value) {
              if (state == ItemFilterAssetState.selected) {
                state = ItemFilterAssetState.unselected;
              } else {
                state = ItemFilterAssetState.selected;
              }
              setState(() {
                //
              });
              widget.onSelected!(value);
            }
          : null,
      color: MaterialStateProperty.resolveWith(
        (states) {
          switch (state) {
            case ItemFilterAssetState.unselected:
              return Colors.transparent;
            case ItemFilterAssetState.selected:
              return AppStyleColors.brandPrimaryDefault;
          }
        },
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side: const BorderSide(
          color: Color(0xffD8DFE6),
        ),
      ),
      showCheckmark: false,
      avatar: Icon(
        widget.icon,
        color: state == ItemFilterAssetState.selected
            ? Colors.white
            : const Color(0xff77818C),
      ),
      label: Text(
        widget.text,
        style: TextStyle(
          color: state == ItemFilterAssetState.selected
              ? Colors.white
              : const Color(0XFF77818C),
          fontWeight: FontWeight.w500,
          fontSize: 14,
          height: 1.20,
        ),
      ),
    );
  }
}
