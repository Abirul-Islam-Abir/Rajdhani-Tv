import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:untitled/app/api_services/all_premium_videos.dart';
import 'package:untitled/app/data/subscribed_value_change.dart';
import 'package:untitled/app/model/all_premium_model.dart';
import 'package:untitled/app/modules/bottom_nav_bar/controller/bottom_nav_controller.dart';
import 'package:untitled/app/modules/premium_screen/view/premium_screen.dart';
import 'package:untitled/app/modules/widgets/video_player.dart';
import 'package:untitled/app/routes/app_routes.dart';
import 'package:video_player/video_player.dart';

class PremiumVideosController extends GetxController {
  late VideoPlayerController videoController;
  List<AllPremiumModel> premiumVideo = [];
  Future<void> allPremium() async {
    final response = await allPremiumRequest();
    print(response);
    for (var json in response['data']) {
      premiumVideo.add(AllPremiumModel.fromJson(json));
      update();
    }
  }

  dynamic videoPlayerController(src) {
    videoController = VideoPlayerController.networkUrl(
      Uri.parse(src),
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );

    videoController.addListener(() {
      update();
    });
    videoController.setLooping(false);
    videoController.initialize().then((_) {
      videoController.pause();
      update();
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit 
    allPremium();
    super.onInit();
  }
}

class VideoPlays extends StatefulWidget {
  @override
  State<VideoPlays> createState() => _VideoPlaysState();
}

class _VideoPlaysState extends State<VideoPlays> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PremiumVideosController>(builder: (controller) {
      return AspectRatio(
        aspectRatio: controller.videoController.value.aspectRatio,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            VideoPlayer(controller.videoController),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 50),
              reverseDuration: const Duration(milliseconds: 200),
              child: controller.videoController.value.isPlaying
                  ? const SizedBox.shrink()
                  : const ColoredBox(
                      color: Colors.black,
                      child: Center(
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 100.0,
                          semanticLabel: 'Play',
                        ),
                      ),
                    ),
            ),
            GestureDetector(
              onTap: () {
                isSubscribed?
                controller.videoController.value.isPlaying
                    ? controller.videoController.pause()
                    : controller.videoController.play(): Get.toNamed(RouteName.packageScreen);
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  onPressed: () {
                    Get.to(() =>
                        FullVideoPlay(controller: controller.videoController));
                    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                        overlays: [
                          // SystemUiOverlay.bottom,
                          // SystemUiOverlay.top
                        ]);
                    SystemChrome.setPreferredOrientations(
                      [
                        DeviceOrientation.landscapeLeft,
                        DeviceOrientation.landscapeRight,
                      ],
                    );
                  },
                  icon: const Icon(
                    Icons.fullscreen_rounded,
                    size: 35,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
