import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app/modules/home_screen/component/primary_text.dart';
import 'package:untitled/app/modules/home_screen/component/rajdhani_logo.dart';
import 'package:untitled/app/modules/home_screen/component/social_btn.dart';
import 'package:untitled/app/modules/home_screen/controller/home_controller.dart';

import '../../../../main.dart';
import '../../../data/app_image.dart';
import '../../../data/app_text.dart';
import '../../widgets/common_section_screen.dart';
import 'cerfication.dart';

class AllDetails extends StatelessWidget {
  const AllDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
        builder: (controller) => Column(
              children: [
                RajdhaniLogo(
                    img: darkNotifier.value
                        ? AppImage.appLogoLight
                        : AppImage.appLogo),
                const SizedBox(height: 15),
                PrimaryText(
                    text: 'About Us',
                    onTap: () {
                      Get.to(() => CommonSectionScreen(
                          title: 'About', subtitle: AppString.about));
                    }),
                PrimaryText(text: 'Privacy Policy', onTap: () {Get.to(() => CommonSectionScreen(
                    title: 'Privacy Policy', subtitle: AppString.privacyPolicy));}),
                PrimaryText(text: 'Terms', onTap: () { Get.to(() =>
                    CommonSectionScreen(title: 'Terms', subtitle: AppString.terms));}),
                const SizedBox(height: 15),
                SocialButton(fbTap: () {}, instaTap: () {}, ytTap: () {}),
                //  DownloadButton(onTap: () {}, text: 'Download'),
                const SizedBox(height: 25),
                //MultiPlatformButton(apple: () {}, google: () {}, windows: () {}),
                const Certification(),
              ],
            ));
  }
}
