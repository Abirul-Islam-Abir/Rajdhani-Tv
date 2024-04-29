import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app/modules/home_screen/controller/home_controller.dart';
import '../../../data/app_image.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeScreenController>(builder: (controller) {
        return ListView(
          controller: controller.scrollController,
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
        );
      }),
    );
  }
}