import 'package:flutter/material.dart';

import '../../../data/constant.dart';

class CustomShapePainter extends CustomPainter {
  final String text;

  CustomShapePainter({required this.text});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = kPrimaryColor // Replace with kPrimaryColor if defined
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0) // Start from the top-left corner
      ..lineTo(size.width - 100, 0) // Top right corner
      ..lineTo(size.width - 80, size.height) // Bottom right corner
      ..lineTo(0, size.height) // Bottom left corner
      ..close(); // Close the path

    canvas.drawPath(path, paint);

    final textStyle = TextStyle(
      color: Colors.white, // Choose any color
      fontSize: 16, // Adjust the font size as needed
      fontWeight: FontWeight.bold,
    );
    final textSpan = TextSpan(
      text: text,
      style: textStyle,
    );

    final textPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );

    final offset = Offset(
      30, // Increase this value to add more padding from the left
      (size.height - textPainter.height) / 2,
    );

    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}