import 'package:flutter/material.dart';
import 'package:untitled/app/modules/home_screen/component/circle_tap.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/launch_url.dart';

class SocialButton extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap:  () {
            launchAnyUrl('https://www.facebook.com/groups/rajdhanitv');
          },
          child: const CircleButton(
            imageLogo: 'assets/icon/facebook.png',
            color: Colors.black38,
          ),
        ),
        InkWell(
          onTap:   () {
            launchAnyUrl('https://www.instagram.com/rajdhani.tv/');

          },
          child: const CircleButton(
            imageLogo: 'assets/icon/instagram.png',
            color: Colors.black38,
          ),
        ),
        InkWell(
          onTap:   () {
            launchAnyUrl('https://www.youtube.com/channel/UCxCNOn19CJ6dy4aOL4GCPjw');

          },
          child: const CircleButton(
            imageLogo: 'assets/icon/youtube.png',
            color: Colors.black38,
          ),
        ),
      ],
    );
  }
}
