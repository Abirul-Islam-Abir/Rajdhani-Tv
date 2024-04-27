import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:untitled/app/modules/widgets/common_section_screen.dart';
import 'package:untitled/app/modules/widgets/primary_btn.dart';

import '../../../data/app_image.dart';
import '../../../data/app_text.dart';
import '../../schedule_screen/view/schedule_screen.dart';
import '../../widgets/secondary_btn.dart';
import '../../widgets/video_player.dart';
import '../component/archive_premium_btn.dart';
import '../component/cerfication.dart';
import '../component/download_btn.dart';
import '../component/multi_platform_btn.dart';
import '../component/primary_text.dart';
import '../component/rajdhani_logo.dart';
import '../component/social_btn.dart';
import '../component/suggested_video.dart';
import '../component/videos_btn.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    myScroll();
    super.initState();
  }

  ScrollController _scrollBottomBarController = ScrollController();
  bool _showAppbar = true;
  bool isScrollingDown = false;
  double bottomBarHeight = 75;

  void myScroll() async {
    _scrollBottomBarController.addListener(() {
      if (_scrollBottomBarController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          _showAppbar = false;
          print('scrool Up');
          setState(() {});
        }
      }
      if (_scrollBottomBarController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          _showAppbar = true;
          print('scrool down');
          setState(() {});
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build widget=======================');
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        drawer: CustomDrawer(),
        appBar: _showAppbar ? buildAppBar() : null,
        body: SafeArea(
          child: ListView(
            controller: _scrollBottomBarController,
            children: [
              SizedBox(height: 250, child: VideoPlay()),
              const SizedBox(height: 10),
              ArchiveAndPremiumButton(archiveTap: () {}, premiumTap: () {}),
              const SizedBox(height: 10),
              videosButton(text: 'Videos', tap: () {}),
              const SizedBox(height: 10),
              const SuggestedVideos(),
              const SizedBox(height: 10),
              SecondaryButton(text: 'All Videos', onTap: () {}),
              const SizedBox(height: 10),
              RajdhaniLogo(img: AppImage.appLogo),
              const SizedBox(height: 10),
              PrimaryText(text: 'About Us', onTap: () {}),
              PrimaryText(text: 'Privacy Policy', onTap: () {}),
              PrimaryText(text: 'Terms', onTap: () {}),
              const SizedBox(height: 10),
              SocialButton(fbTap: () {}, instaTap: () {}, ytTap: () {}),
              DownloadButton(onTap: () {}, text: 'Download'),
              const SizedBox(height: 10),
              MultiPlatformButton(apple: () {}, google: () {}, windows: () {}),
              const SizedBox(height: 10),
              const Certification()
            ],
          ),
        ));
  }
}

AppBar buildAppBar() => AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Image.asset(AppImage.appLogo),
        ),
      ],
    );

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
        Get.to(() =>
            CommonSectionScreen(title: 'Contact', subtitle: AppString.contact));
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