import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app/data/subscribed_value_change.dart';
import 'package:untitled/app/modules/home_screen/component/suggested_video.dart';
import 'package:untitled/app/modules/packages_screen/view/packages_screen.dart';

import '../../../api_services/api_services.dart';
import '../../../model/all_videos_model.dart';
import '../../widgets/suggested_video_shimmer.dart';
import '../../youtube_embed_play_screen/view/youtube_embed_play_screen.dart';
import '../controller/home_controller.dart';

class SliderVideo extends StatelessWidget {
  const SliderVideo({super.key, required this.isLoaded, required this.list});

  final bool isLoaded;

  final List<AllVideosModel> list;

  @override
  Widget build(BuildContext context) {
    return isLoaded
        ? const SuggestedVideoShimmer()
        : CarouselSlider(
            items: List.generate(
              list.length,
              (index) {
                final video = list[index];
                final embedCode = video.embedCodes?.isNotEmpty ?? false
                    ? video.embedCodes![0].embed
                    : '';
                return InkWell(
                  onTap: () {},
                  child: SuggestedVideos(
                    title: video.name ?? 'No Data',
                    text: list[index].name.toString(),
                    videoUrl: '${ApiServices.youtubeBase}$embedCode',
                    onTap: () {
                      Get.find<HomeScreenController>().videoController.pause();
                      isSubscribed
                          ? Get.to(() => YouTubePlayerScreen(
                                url: embedCode.toString(),
                              ))
                          : Get.to(() => PackagesScreen(),arguments: true);
                    },
                  ),
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
          );
  }
}
