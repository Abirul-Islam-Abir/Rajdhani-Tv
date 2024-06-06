import 'package:flutter/material.dart';

import '../home_screen/component/custom_shape.dart';

class HeadlineTitle extends StatelessWidget {
  const HeadlineTitle({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: CustomPaint(
        size: const Size(280, 50), // Specify the size directly
        painter: CustomShapePainter(text: text),
      ),
    );
  }
}
