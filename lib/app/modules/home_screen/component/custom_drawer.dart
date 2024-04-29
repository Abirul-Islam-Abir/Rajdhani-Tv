import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app/modules/home_screen/component/primary_text.dart';
import 'package:untitled/app/modules/home_screen/component/rajdhani_logo.dart';

import '../../../data/app_image.dart';
import '../../../data/app_text.dart';
import '../../contact_screen/view/contact_screen.dart';
import '../../schedule_screen/view/schedule_screen.dart';
import '../../widgets/common_section_screen.dart';
import '../../widgets/primary_btn.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  Future<void> navigate(num) async {
    switch (num) {
      case 0:
        Get.to(() =>
            CommonSectionScreen(title: 'About', subtitle: AppString.about));
        break;
      case 1:
        Get.to(() => ContactScreen());
      case 2:
        Get.to(() => CommonSectionScreen(
            title: 'Privacy Policy', subtitle: AppString.privacyPolicy));
        break;
      case 3:
        Get.to(() =>
            CommonSectionScreen(title: 'Terms', subtitle: AppString.terms));
        break;
      case 4:
        Get.to(() => ScheduleScreen());
        break;
      case 5:
        Get.to(() => CommonSectionScreen(
            title: 'FAQs', subtitle: AppString.privacyPolicy));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            RajdhaniLogo(img: AppImage.appLogo),
            const SizedBox(height: 10),
            SwitchListTile(
                title: Text('Dark Mode'), value: false, onChanged: (value) {}),
            Divider(height: 25, color: Colors.grey), const SizedBox(height: 50),
            PrimaryText(
                onTap: () {
                  navigate(0);
                },
                text: 'About'),
            const SizedBox(height: 10),
            PrimaryText(
                onTap: () {
                  navigate(1);
                },
                text: 'Contact'),
            const SizedBox(height: 10),
            PrimaryText(
                onTap: () {
                  navigate(3);
                },
                text: 'Privacy Plicy'),
            const SizedBox(height: 10),
            PrimaryText(
                onTap: () {
                  navigate(4);
                },
                text: 'Terms'),
            const SizedBox(height: 10),
            PrimaryText(
                onTap: () {
                  navigate(5);
                },
                text: 'Schedule'),
            const SizedBox(height: 10),
            PrimaryText(
                onTap: () {
                  navigate(6);
                },
                text: 'FAQs'),
            const Spacer(),
            // If logged in user after change to logout;
            PrimaryButton(text: 'Login', onTap: () {}),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}