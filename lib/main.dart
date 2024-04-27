import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:untitled/app/data/app_image.dart';

import 'app/data/constant.dart';
import 'app/modules/home_screen/component/archive_premium_btn.dart';
import 'app/modules/home_screen/component/cerfication.dart';
import 'app/modules/home_screen/component/download_btn.dart';
import 'app/modules/home_screen/component/multi_platform_btn.dart';
import 'app/modules/home_screen/component/primary_text.dart';
import 'app/modules/home_screen/component/rajdhani_logo.dart';
import 'app/modules/home_screen/component/social_btn.dart';
import 'app/modules/home_screen/component/suggested_video.dart';
import 'app/modules/home_screen/component/videos_btn.dart';
import 'app/modules/widgets/responsive.dart';
import 'app/modules/widgets/secondary_btn.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import 'app/modules/widgets/video_player.dart';

void main() {
  runApp(const RajdhaniTv());
}

class RajdhaniTv extends StatefulWidget {
  const RajdhaniTv({super.key});

  @override
  State<RajdhaniTv> createState() => _RajdhaniTvState();
}

class _RajdhaniTvState extends State<RajdhaniTv> {


  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        title: 'Rajdhani Tv',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
          brightness: Brightness.light,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5))),
          ),
        ),
        themeMode: ThemeMode.system,
        home: HomeScreen(),
      );
    });
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  ScrollController controller = ScrollController();
//
  @override
  Widget build(BuildContext context) {
    print('bui.d');
    final width = MediaQuery.of(context).size.width;
    return   Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Image.asset(AppImage.appLogo),
          ),
        ],
      ),
      body: ListView(
        controller: controller,
        children: [
          VideoPlay(),
          SizedBox(height: 10),
          ArchiveAndPremiumButton(archiveTap: () {}, premiumTap: () {}),
          SizedBox(height: 10),
          videosButton(text: 'Videos', tap: () {}),
          SizedBox(height: 10),
          SuggestedVideos(),
          SizedBox(height: 10),
          SecondaryButton(text: 'All Videos', onTap: () {}),
          RajdhaniLogo(img: AppImage.appLogo),
          PrimaryText(text: 'About Us', onTap: () {}),
          PrimaryText(text: 'Privacy Policy', onTap: () {}),
          PrimaryText(text: 'Terms', onTap: () {}),
          SizedBox(height: 10),
          SocialButton(fbTap: () {}, instaTap: () {}, ytTap: () {}),
          DownloadButton(onTap: () {}, text: 'Download'),
          MultiPlatformButton(
              apple: () {}, google: () {}, windows: () {}),
          SizedBox(height: 10),
          Certification()
        ],
      ))
    ;
  }
}