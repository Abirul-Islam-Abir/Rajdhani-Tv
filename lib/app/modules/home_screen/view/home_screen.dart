import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:untitled/app/data/constant.dart';
import 'package:untitled/app/modules/home_screen/controller/home_controller.dart';
import '../../../data/app_image.dart';
import '../../../data/method.dart';
import '../../bottom_nav_bar/controller/bottom_nav_controller.dart';
import '../../widgets/secondary_btn.dart';
import '../../widgets/video_player.dart';
import '../component/all_details.dart';
import '../component/archive_premium_btn.dart';
import '../component/cerfication.dart';
import '../component/download_btn.dart';
import '../component/multi_platform_btn.dart';
import '../component/primary_text.dart';
import '../component/rajdhani_logo.dart';
import '../component/social_btn.dart';
import '../component/suggested_video.dart';
import '../component/videos_btn.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final bottomController = Get.put(BottomNavController());

  void archive() => bottomController.changeIndex(1);
  void premium() => bottomController.changeIndex(2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeScreenController>(
          builder: (controller) => ListView(
                controller: controller.scrollController,
                children: [
                  controller.select == 0
                      ? SizedBox(height: 250, child: VideoPlay())
                      : controller.select == 1
                          ? SizedBox(height: 250, child: Text('Sports'))
                          : SizedBox(height: 250, child: Text('Islamic')),
                  const SizedBox(height: 10),
                  ArchiveAndPremiumButton(),
                  const SizedBox(height: 10),
                  videosButton(text: 'Videos', tap: () {}),
                  const SizedBox(height: 10),
                  const SuggestedVideos(),
                  const SizedBox(height: 10),
                  SecondaryButton(text: 'All Videos', onTap: () {}),
                  const SizedBox(height: 10),
                  const AllDetails()
                ],
              )),
    );
  }
}