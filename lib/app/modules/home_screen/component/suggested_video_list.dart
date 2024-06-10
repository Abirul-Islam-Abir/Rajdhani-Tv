import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app/data/subscribed_value_change.dart';
import 'package:untitled/app/modules/home_screen/component/recommended_video.dart';
import 'package:untitled/app/modules/home_screen/controller/home_controller.dart';

import '../../premium_screen/view/premium_screen.dart';
import '../../youtube_embed_play_screen/view/youtube_embed_play_screen.dart';

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
              onTap: () {
           Get.find<HomeScreenController>().videoController.pause() ;
               isSubscribed? Get.to(() => const YouTubePlayerScreen(url: 'VQ1viPcYG80')):Get.to(() => PremiumScreen());;
              }),
        ),
      ),
    );
  }
}
