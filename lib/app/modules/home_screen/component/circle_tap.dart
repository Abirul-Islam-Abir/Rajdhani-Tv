import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    super.key,
    required this.imageLogo,
    required this.color,
  });

  final String imageLogo;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: CircleAvatar(
        radius: 20,
        backgroundColor: color,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.asset(imageLogo),
        ),
      ),
    );
  }
}