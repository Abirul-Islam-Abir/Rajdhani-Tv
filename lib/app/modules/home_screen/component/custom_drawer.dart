import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/app/modules/home_screen/component/primary_text.dart';
import 'package:untitled/app/modules/home_screen/component/rajdhani_logo.dart';

import '../../../../main.dart';
import '../../../data/app_image.dart';
import '../../../data/app_text.dart';
import '../../../data/shared_pref.dart';
import '../../contact_screen/view/contact_screen.dart';
import '../../schedule_screen/view/schedule_screen.dart';
import '../../widgets/common_section_screen.dart';
import '../../widgets/primary_btn.dart';
import '../controller/home_controller.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  Future<void> navigate(int num) async {
    switch (num) {
      case 0:
        Get.to(() =>
            CommonSectionScreen(title: 'About', subtitle: AppString.about));
        break;
      case 1:
        Get.to(() => ContactScreen());
        break;
      case 2:
        Get.to(() =>
            CommonSectionScreen(
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
        Get.to(() =>
            CommonSectionScreen(
                title: 'FAQs', subtitle: AppString.privacyPolicy));
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get
          .find<HomeScreenController>()
          .videoController
          .pause();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            RajdhaniLogo(
                img: darkNotifier.value
                    ? AppImage.appLogoLight
                    : AppImage.appLogo),
            const SizedBox(height: 10),
            GetBuilder<HomeScreenController>(builder: (controller) {
              return SwitchListTile(
                title: Text('Dark Mode'),
                value: darkNotifier.value,
                onChanged:controller.changeDarkMode,
              );
            }),
            Divider(height: 25, color: Colors.grey),
            const SizedBox(height: 30),
            PrimaryText(
              onTap: () {
                navigate(0);
              },
              text: 'About',
            ),
            const SizedBox(height: 10),
            PrimaryText(
              onTap: () {
                navigate(1);
              },
              text: 'Contact',
            ),
            const SizedBox(height: 10),
            PrimaryText(
              onTap: () {
                navigate(2);
              },
              text: 'Privacy Policy',
            ),
            const SizedBox(height: 10),
            PrimaryText(
              onTap: () {
                navigate(3);
              },
              text: 'Terms',
            ),
            const SizedBox(height: 10),
            PrimaryText(
              onTap: () {
                navigate(4);
              },
              text: 'Schedule',
            ),
            const SizedBox(height: 10),
            PrimaryText(
              onTap: () {
                navigate(5);
              },
              text: 'FAQs',
            ),
            const Spacer(),
            PrimaryButton(
              text: 'Log Out',
              onTap: () {},
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
