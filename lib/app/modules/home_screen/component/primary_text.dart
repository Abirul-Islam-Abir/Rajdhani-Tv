import 'package:flutter/material.dart';

class PrimaryText extends StatelessWidget {
  const PrimaryText({
    super.key,
    required this.onTap,
    required this.text,
  });

  final Function() onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Center(
            child: Text(text,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20))));
  }
}
