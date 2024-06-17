import 'package:flutter/material.dart';

import '../../../../settings/style/app_style_colors.dart';

class LinePainter extends CustomPainter {
  final int depth;

  LinePainter({required this.depth});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppStyleColors.gray200
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
