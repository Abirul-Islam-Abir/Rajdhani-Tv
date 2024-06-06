import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app/api_services/api_services.dart';
import 'package:untitled/app/modules/home_screen/controller/home_controller.dart';
import 'package:untitled/app/modules/youtube_embed_play_screen/view/youtube_embed_play_screen.dart';

import '../../archive_screen/view/archive_screen.dart';
import '../../bottom_nav_bar/controller/bottom_nav_controller.dart';
import '../../widgets/primary_btn.dart';
import '../../widgets/suggested_video_shimmer.dart';
import '../../widgets/video_player.dart';
import '../component/all_details.dart';
import '../component/archive_premium_btn.dart';
import '../component/suggested_video.dart';
import '../component/update_available.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final bottomController = Get.put(BottomNavController());
  final homeController = Get.put(HomeScreenController());

  void archive() => bottomController.changeIndex(1);

  void premium() => bottomController.changeIndex(2);
  final controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return UpdateAvailable(
      packageName: homeController.packageName,
      isUpdate: true,
      child: Scaffold(
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
            ArchiveAndPremiumButton(),
            const SizedBox(height: 20),
            const Headline(text: 'Videos'),
            const SizedBox(height: 40),
            controller.isLoadedData
                ? const SuggestedVideoShimmer()
                : CarouselSlider(
                    items: List.generate(
                      controller.allVideosData.length,
                      (index) {
                        final video = controller.allVideosData[index];
                        final embedCode = video.embedCodes?.isNotEmpty ?? false
                            ? video.embedCodes![0].embed
                            : '';
                        return SuggestedVideos(
                          title: video.name ?? 'No Data',
                          text: controller.categoryData[index].name.toString(),
                          videoUrl: '${ApiServices.youtubeBase}$embedCode',
                          onTap: () {
                            controller.videoController.pause();
                            Get.to(() => YouTubePlayerScreen(
                                  url: embedCode.toString(),
                                ));
                          },
                        );
                      },
                    ),
                    options: CarouselOptions(
                      height: 300,
                      aspectRatio: 16 / 9,
                      viewportFraction: 1.0,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 5),
                      autoPlayAnimationDuration: const Duration(seconds: 4),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.0,
                      onPageChanged: (index, reason) {},
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
            SuggestedVideoList(
              text: 'Suggested Video',
              videoUrl: '${ApiServices.youtubeBase}VQ1viPcYG80',
              list: const [],
              onTap: () {
                controller.videoController.pause();
                Get.to(() => const YouTubePlayerScreen(url: 'VQ1viPcYG80'));
              },
            ),
            SuggestedVideoList(
              text: 'Suggested Video',
              videoUrl: '${ApiServices.youtubeBase}VQ1viPcYG80',
              list: const [],
              onTap: () {
                controller.videoController.pause();
                Get.to(() => const YouTubePlayerScreen(url: 'VQ1viPcYG80'));
              },
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
      )),
    );
  }
}

class SuggestedVideoList extends StatelessWidget {
  const SuggestedVideoList(
      {super.key,
      required this.text,
      required this.videoUrl,
      this.onTap,
      required this.list});

  final String text, videoUrl;
  final Function()? onTap;
  final List list;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            children: List.generate(
          5,
          (index) => RecommendedVideo(
              title: '',
              text: 'Suggested Video ',
              videoUrl: videoUrl,
              onTap: onTap),
        )));
  }
}
