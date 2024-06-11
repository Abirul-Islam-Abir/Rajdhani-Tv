import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app/api_services/api_services.dart';
import 'package:untitled/app/modules/home_screen/component/suggested_video_list.dart';
import 'package:untitled/app/modules/home_screen/controller/home_controller.dart';

import '../../bottom_nav_bar/controller/bottom_nav_controller.dart';
import '../../widgets/primary_btn.dart';
import '../../widgets/video_player.dart';
import '../component/all_details.dart';
import '../component/headline_text.dart';
import '../component/slider_videos.dart';

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
            Container(
                height: 280,
                width: double.infinity,
                color: Colors.black,
                child: VideoPlay(url: ApiServices.liveTv)),
            const SizedBox(height: 10),
            /*  ArchiveAndPremiumButton(),*/
            const SizedBox(height: 20),
            const Headline(text: 'Videos'),
            const SizedBox(height: 40),
            Obx(() => SliderVideo(
                  isLoaded: controller.isLoadedData,
                  list: controller.allVideosData,
                )),
            SuggestedVideoList(
              text: 'Suggested Video',
              videoUrl: '${ApiServices.youtubeBase}VQ1viPcYG80',
              list: const [],
            ),
            SuggestedVideoList(
              text: 'Suggested Video',
              videoUrl: '${ApiServices.youtubeBase}VQ1viPcYG80',
              list: const [],
            ),
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
