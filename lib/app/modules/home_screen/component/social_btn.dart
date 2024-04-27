import 'package:flutter/material.dart';
import 'package:untitled/app/modules/home_screen/component/circle_tap.dart';

import '../../../data/constant.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.fbTap,
    required this.instaTap,
    required this.ytTap,
  });

  final Function() fbTap, instaTap, ytTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: fbTap,
          child: CircleButton(
            imageLogo: 'assets/icon/facebook.png',
            color: Colors.black38,
          ),
        ),
        InkWell(
          onTap: instaTap,
          child: CircleButton(
            imageLogo: 'assets/icon/instagram.png',
            color: Colors.black38,
          ),
        ),
        InkWell(
          onTap: ytTap,
          child: CircleButton(
            imageLogo: 'assets/icon/youtube.png',
            color: Colors.black38,
          ),
        ),
      ],
    );
  }
}