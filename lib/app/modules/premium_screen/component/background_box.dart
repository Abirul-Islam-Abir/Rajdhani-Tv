
import 'package:flutter/material.dart';

import '../../../data/constant.dart';

class BackgroundBox extends StatelessWidget {
  const BackgroundBox({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height / 1.6,
          width: double.infinity,
          decoration: BoxDecoration(
            color: kPrimaryColor.withOpacity(0.90),
            borderRadius: BorderRadius.circular(20),
          ),
          child: child,
        ),
      ),
    );
  }
}