import 'package:flutter/material.dart';
import 'package:untitled/app/modules/home_screen/component/primary_text.dart';
import 'package:untitled/app/modules/home_screen/component/rajdhani_logo.dart';
import 'package:untitled/app/modules/home_screen/component/social_btn.dart';

import '../../../data/app_image.dart';
import 'cerfication.dart';

class AllDetails extends StatelessWidget {
  const AllDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RajdhaniLogo(img: AppImage.appLogo),
        const SizedBox(height: 15),
        PrimaryText(text: 'About Us', onTap: () {}),
        PrimaryText(text: 'Privacy Policy', onTap: () {}),
        PrimaryText(text: 'Terms', onTap: () {}),
        const SizedBox(height: 15),
        SocialButton(fbTap: () {}, instaTap: () {}, ytTap: () {}),
        //  DownloadButton(onTap: () {}, text: 'Download'),
        const SizedBox(height: 25),
        //MultiPlatformButton(apple: () {}, google: () {}, windows: () {}),

        const Certification(),
      ],
    );
  }
}