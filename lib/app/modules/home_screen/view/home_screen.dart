import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app/api_services/api_services.dart';
import 'package:untitled/app/modules/home_screen/component/suggested_video_list.dart';
import 'package:untitled/app/modules/home_screen/controller/home_controller.dart';

import '../../bottom_nav_bar/controller/bottom_nav_controller.dart';
import '../../widgets/primary_btn.dart';
import '../../widgets/video_player.dart';
import '../component/all_details.dart';
import '../component/archive_premium_btn.dart';
import '../component/headline_text.dart';
import '../component/slider_videos.dart';
import '../../widgets/headline_title.dart';
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final bottomController = Get.put(BottomNavController());
  final homeController = Get.put(HomeScreenController());

  void archive() => bottomController.changeIndex(1);

  void premium() => bottomController.changeIndex(2);
  final controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller.scrollController,
        child: Column(
          children: [
           Obx(() =>  controller.select == 0
                          ? Container(
                              height: 220,
                              width: double.infinity,
                              color: Colors.black,
                              child: VideoPlay(  ))
                          : controller.select == 1
                              ? SizedBox(height: 280, child: Center(child: Text('Coming Soon Sports TV')))
                              : SizedBox(height: 280, child: Center(child: Text('Coming Soon Islamic TV'))),),
            const SizedBox(height: 10),
             ArchiveAndPremiumButton(), 
            const SizedBox(height: 20),
            const Headline(text: 'Videos'),
            const SizedBox(height: 40),
            Obx(() => SliderVideo(
                  isLoaded: controller.isLoadedData,
                  list: controller.allVideosData,
                )), 
          HeadlineTitle(text: 'Suggested Video'),
            Obx(() => SuggestedVideoList( isLoaded: controller.isLoadedData, 
                  list: controller.suggestedData,
                )),
                 const SizedBox(height: 12),
          HeadlineTitle(text: 'Recommended Video'),
            Obx(() => RecommendedVideoList( isLoaded: controller.isLoadedData,
                  text: 'Recommended Video',
                  list: controller.recommendedData,
                )),
            PrimaryButton(
                text: 'All Videos',
                onTap: () {
                  controller.videoController.pause();
                  Get.find<BottomNavController>().changeIndex(1);
                }),
            const SizedBox(height: 30),
            const AllDetails(),
          ],
        ),
      ),
    );
  }
}
