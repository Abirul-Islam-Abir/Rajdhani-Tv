import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app/data/subscribed_value_change.dart';
import 'package:untitled/app/model/all_videos_model.dart';
import 'package:untitled/app/modules/home_screen/component/recommended_video.dart';
import 'package:untitled/app/modules/home_screen/controller/home_controller.dart';
import 'package:untitled/app/modules/packages_screen/view/packages_screen.dart';
import 'package:untitled/app/modules/widgets/suggested_video_shimmer.dart';

import '../../../api_services/api_services.dart';
import '../../youtube_embed_play_screen/view/youtube_embed_play_screen.dart';

class SuggestedVideoList extends StatelessWidget {
  const SuggestedVideoList({
    super.key,
    required this.text, 
    this.onTap,
    required this.list, required this.isLoaded,
  });

  final String text;
  final Function()? onTap;
  final List<EmbedCodes> list;
final bool isLoaded;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          list.length,
          (index) {
            final data = list[index].embed;
            return isLoaded
        ? const SuggestedVideoShimmer()
        : RecommendedVideo(
              title: '',
              text: text,
              videoUrl: '${ApiServices.youtubeBase}$data',
              onTap: () {
                Get.find<HomeScreenController>().videoController.pause();
                    isSubscribed
                          ? Get.to(() => YouTubePlayerScreen(
                                url: data.toString(),
                              ))
                          : Get.to(() => PackagesScreen(),arguments: true);
              },
            );
          },
        ),
      ),
    );
  }
}

class RecommendedVideoList extends StatelessWidget {
  const RecommendedVideoList(
      {super.key,
      required this.text, 
      this.onTap,
      required this.list, required this.isLoaded});

  final String text;
  final Function()? onTap;
  final List<EmbedCodes> list;
final bool isLoaded;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          list.length,
          (index) {final data  = list[index].embed;
            return isLoaded
        ? const SuggestedVideoShimmer()
        :  RecommendedVideo(
              title: '',
              text: text,
              videoUrl: '${ApiServices.youtubeBase}$data',
              onTap: () {
           Get.find<HomeScreenController>().videoController.pause() ;
          Get.to(() => YouTubePlayerScreen(
                                url: data.toString(),
                              ));
              });
          },
        ),
      ),
    );
  }
}
