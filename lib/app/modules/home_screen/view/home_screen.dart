import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:untitled/app/api_services/api_services.dart';
import 'package:untitled/app/data/constant.dart';
import 'package:untitled/app/modules/all_videos_screen/view/all_videos_screen.dart';
import 'package:untitled/app/modules/home_screen/controller/home_controller.dart';
import 'package:untitled/app/modules/youtube_embed_play_screen/view/youtube_embed_play_screen.dart';
import '../../../data/app_image.dart';
import '../../../data/method.dart';
import '../../bottom_nav_bar/controller/bottom_nav_controller.dart';
import '../../widgets/primary_btn.dart';
import '../../widgets/secondary_btn.dart';
import '../../widgets/suggested_video_shimmer.dart';
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
          builder: (controller) => SingleChildScrollView( controller: controller.scrollController,
            child: Column(

                  children: [
                    controller.select == 0
                        ? Container(
                            height: 300,width: double.infinity,
                            color: Colors.black,
                            child: VideoPlay(url: ApiServices.liveTv))
                        : controller.select == 1
                            ? SizedBox(height: 250, child: Text('Sports'))
                            : SizedBox(height: 250, child: Text('Islamic')),
                    const SizedBox(height: 10),
                    ArchiveAndPremiumButton(),
                    const SizedBox(height: 10),
                    PrimaryButton(text: 'Videos', onTap: () {}),
                    const SizedBox(height: 30),
                  controller.isLoadedData?SuggestedVideoShimmer():  CarouselSlider(
                      items: List.generate(
                        controller.data.length,
                        (index) {
                          final video = controller.data[index];
                          final embedCode = video.embedCodes?.isNotEmpty ?? false
                              ? video.embedCodes![0].embed
                              : '';
                          return SuggestedVideos(
                            title: video.name ?? 'No Data',
                            videoUrl: ApiServices.youtubeBase + '$embedCode',
                            onTap: () { controller.videoController.pause();
                              Get.to(() => YouTubePlayerScreen(
                                    url: embedCode.toString(),
                                  ));
                            },
                          );
                        },
                      ),
                      options: CarouselOptions(
                        height: 200,
                        aspectRatio: 16 / 9,
                        viewportFraction: 1.0,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 10),
                        autoPlayAnimationDuration: Duration(seconds: 4),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        onPageChanged: (index, reason) {},
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    const SizedBox(height: 30),
                    PrimaryButton(
                        text: 'All Videos',
                        onTap: () {
                          controller.videoController.pause();
                          Get.to(() => AllVideoScreen(list: controller.data));
                        }),
                    const SizedBox(height: 30),
                    const AllDetails()
                  ],
                ),
          )),
    );
  }
}
