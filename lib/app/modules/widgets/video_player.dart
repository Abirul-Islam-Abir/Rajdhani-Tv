import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:untitled/app/modules/home_screen/controller/home_controller.dart';
import 'package:video_player/video_player.dart';

class VideoPlay extends StatefulWidget {
  final String url;

  const VideoPlay({super.key, required this.url});

  @override
  State<VideoPlay> createState() => _VideoPlayState();
}

class _VideoPlayState extends State<VideoPlay> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(builder: (controller) {
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
                controller.videoController.value.isPlaying
                    ? controller.videoController.pause()
                    : controller.videoController.play();
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

class FullVideoPlay extends StatelessWidget {
  const FullVideoPlay({
    super.key,
    required this.controller,
  });

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        setPortraitMode();
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: false,
        body: StatefulBuilder(builder: (context, setState) {
          return OrientationBuilder(
            builder: (context, orientation) {
              //  var isPortrait = orientation == Orientation.portrait;
              return Center(
                child:
                    AspectRatio(
                      aspectRatio: 16 / 9.5,
                      child: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          VideoPlayer(controller),
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 50),
                            reverseDuration: const Duration(milliseconds: 200),
                            child: controller.value.isPlaying
                                ? const SizedBox.shrink()
                                : const ColoredBox(
                                    color: Colors.black26,
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
                              controller.value.isPlaying
                                  ? controller.pause()
                                  : controller.play();
                              setState(() {});
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: IconButton(
                                onPressed: () {
                                  setPortraitMode();
                                  Navigator.of(context).pop();
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
                    )
              );
            },
          );
        }),
      ),
    );
  }
}

void setPortraitMode() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
}
