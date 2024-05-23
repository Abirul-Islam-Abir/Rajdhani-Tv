
import 'package:flutter/material.dart';

import '../../data/constant.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    required this.onTap,   this.color = kPrimaryColor,
  });
  final String text;
  final Function() onTap;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 200,
      child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: color),
          onPressed: onTap,
          child: Text(text, style: TextStyle(color: Colors.white, fontSize: 11))),
    );
  }
}