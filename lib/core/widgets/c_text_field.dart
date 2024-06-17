import 'package:flutter/material.dart';
import 'package:tractian_test/settings/style/app_style_colors.dart';
import 'package:tractian_test/settings/style/app_style_text.dart';

class CTextField extends StatelessWidget {
  const CTextField({
    super.key,
    this.hintText,
    required this.onChanged,
    this.enabled = true,
    this.fillColor,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
  });
  final String? hintText;
  final bool enabled;
  final void Function(String)? onChanged;
  final Color? fillColor;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      style: AppStyleText.regularSm.copyWith(color: AppStyleColors.gray500),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon ??
            Icon(
              Icons.search,
              color: AppStyleColors.gray500,
            ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppStyleColors.gray500,
          fontWeight: FontWeight.w400,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppStyleColors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppStyleColors.blue4,
          ),
        ),
        contentPadding: EdgeInsets.zero,
        filled: true,
        enabled: enabled,
        fillColor: fillColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
