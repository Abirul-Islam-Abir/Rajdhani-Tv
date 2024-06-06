import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app/modules/home_screen/component/all_details.dart';
import 'package:untitled/app/modules/home_screen/controller/home_controller.dart';

import '../../../api_services/api_services.dart';
import '../../../data/constant.dart';
import '../../all_videos_screen/view/all_videos_screen.dart';
import '../../home_screen/component/suggested_video.dart';

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
                      Get.to(() => AllVideoScreen(list: video.embedCodes!));
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

class Headline extends StatelessWidget {
  const Headline({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: const BoxDecoration(
        color: kPrimaryColor,
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
