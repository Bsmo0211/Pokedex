import 'package:flutter/material.dart';

class HeaderCurvedContainer extends CustomPainter {
  final Color color;

  HeaderCurvedContainer({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = color;
    Path path = Path()
      ..relativeLineTo(0, size.height - 80)
      ..quadraticBezierTo(
        size.width / 2,
        size.height,
        size.width,
        size.height - 80,
      )
      ..relativeLineTo(0, -(size.height - 80))
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
