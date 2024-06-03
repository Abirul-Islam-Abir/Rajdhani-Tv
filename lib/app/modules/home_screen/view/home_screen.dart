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
import '../../archive_screen/view/archive_screen.dart';
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
import '../component/update_available.dart';
import '../component/videos_btn.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final bottomController = Get.put(BottomNavController());

  void archive() => bottomController.changeIndex(1);

  void premium() => bottomController.changeIndex(2);
  String appName = packageInfo.appName;
  String packageName = packageInfo.packageName;
  String version = packageInfo.version;
  String buildNumber = packageInfo.buildNumber;
  @override
  Widget build(BuildContext context) {
    return UpdateAvailable(
      packageName: ' $applicationId com.codewave.rajdhanitv',
      isUpdate: true,
      child: Scaffold(
        body: GetBuilder<HomeScreenController>(
            builder: (controller) => SingleChildScrollView(
                  controller: controller.scrollController,
                  child: Column(
                    children: [
                      controller.select == 0
                          ? Container(
                              height: 280,
                              width: double.infinity,
                              color: Colors.black,
                              child: VideoPlay(url: ApiServices.liveTv))
                          : controller.select == 1
                              ? SizedBox(height: 250, child: Text('Sports'))
                              : SizedBox(height: 250, child: Text('Islamic')),
                      const SizedBox(height: 10),
                      ArchiveAndPremiumButton(),
                      const SizedBox(height: 20),
                      Headline(text: 'Videos'),
                      const SizedBox(height: 40),
                      controller.isLoadedData
                          ? SuggestedVideoShimmer()
                          : CarouselSlider(
                              items: List.generate(
                                controller.allVideosData.length,
                                (index) {
                                  final video = controller.allVideosData[index];
                                  final embedCode =
                                      video.embedCodes?.isNotEmpty ?? false
                                          ? video.embedCodes![0].embed
                                          : '';
                                  return SuggestedVideos(
                                    title: video.name ?? 'No Data',
                                    text: controller.categoryData[index].name
                                        .toString(),
                                    videoUrl:
                                        ApiServices.youtubeBase + '$embedCode',
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
                                autoPlayInterval: Duration(seconds: 5),
                                autoPlayAnimationDuration: Duration(seconds: 4),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enlargeCenterPage: true,
                                enlargeFactor: 0.0,
                                onPageChanged: (index, reason) {},
                                scrollDirection: Axis.horizontal,
                              ),
                            ),
                      SingleChildScrollView(scrollDirection: Axis.horizontal,
                        child: Row(children: List.generate(
                          5,
                              (index) => RecommendedVideo(
                            title: '',
                            text: 'Recommended Video ',
                            videoUrl: ApiServices.youtubeBase + 'VQ1viPcYG80',
                            onTap: () {
                              controller.videoController.pause();
                              Get.to(() => YouTubePlayerScreen(
                                url: 'VQ1viPcYG80',
                              ));
                            },
                          ),
                        ))
                      ),
                      SingleChildScrollView(scrollDirection: Axis.horizontal,
                          child: Row(children: List.generate(
                            5,
                                (index) => RecommendedVideo(
                              title: '',
                              text: 'Suggested Video ',
                              videoUrl: ApiServices.youtubeBase + 'VQ1viPcYG80',
                              onTap: () {
                                controller.videoController.pause();
                                Get.to(() => YouTubePlayerScreen(
                                  url: 'VQ1viPcYG80',
                                ));
                              },
                            ),
                          ))
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
      ),
    );
  }
}

class HeadlineTitle extends StatelessWidget {
  const HeadlineTitle({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: CustomPaint(
        size: Size(280, 50), // Specify the size directly
        painter: CustomShapePainter(text: text),
      ),
    );
  }
}

class CustomShapePainter extends CustomPainter {
  final String text;

  CustomShapePainter({required this.text});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = kPrimaryColor // Replace with kPrimaryColor if defined
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0) // Start from the top-left corner
      ..lineTo(size.width - 100, 0) // Top right corner
      ..lineTo(size.width - 80, size.height) // Bottom right corner
      ..lineTo(0, size.height) // Bottom left corner
      ..close(); // Close the path

    canvas.drawPath(path, paint);

    final textStyle = TextStyle(
      color: Colors.white, // Choose any color
      fontSize: 16, // Adjust the font size as needed
      fontWeight: FontWeight.bold,
    );
    final textSpan = TextSpan(
      text: text,
      style: textStyle,
    );

    final textPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );

    final offset = Offset(
      30, // Increase this value to add more padding from the left
      (size.height - textPainter.height) / 2,
    );

    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
