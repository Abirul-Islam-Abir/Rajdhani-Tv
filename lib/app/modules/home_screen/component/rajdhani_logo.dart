import 'package:flutter/material.dart';

class RajdhaniLogo extends StatelessWidget {
  const RajdhaniLogo({
    super.key,
    required this.img,
  });

  final String img;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 18.0, bottom: 5),
        child: SizedBox(
            height: 130,
            width: 130,
            child: Image.asset(
              img,
            )));
  }
}