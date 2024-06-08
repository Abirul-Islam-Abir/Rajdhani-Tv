import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app/modules/home_screen/component/all_details.dart';
import 'package:untitled/app/modules/home_screen/controller/home_controller.dart';

import '../../../api_services/api_services.dart';
import '../../../data/constant.dart';
import '../../../data/subscribed_value_change.dart';
import '../../all_videos_screen/view/all_videos_screen.dart';
import '../../create_account_screen/view/create_account_screen.dart';
import '../../home_screen/component/recommended_video.dart';
import '../../home_screen/component/suggested_video.dart';
import '../../premium_screen/view/premium_screen.dart';

class ArchiveScreen extends StatelessWidget {
  const ArchiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeScreenController>(builder: (controller) {
        return SingleChildScrollView(
          controller: controller.scrollController,
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.allVideosData.length,
                itemBuilder: (context, index) {
                  final video = controller.allVideosData[index];
                  final embedCode = video.embedCodes?.isNotEmpty ?? false
                      ? video.embedCodes![0].embed
                      : '';
                  return RecommendedVideo(
                    height: 220,
                    fit: BoxFit.fitWidth,
                    title: video.name ?? 'No Data',
                    text: controller.categoryData[index].name.toString(),
                    videoUrl: '${ApiServices.youtubeBase}$embedCode',
                    onTap: () {
                      isSubscribed
                          ? Get.to(
                              () => AllVideoScreen(list: video.embedCodes!))
                          : Get.to(() => PremiumScreen());
                    },
                  );
                },
              ),
              const SizedBox(height: 50),
              const AllDetails()
            ],
          ),
        );
      }),
    );
  }
}
