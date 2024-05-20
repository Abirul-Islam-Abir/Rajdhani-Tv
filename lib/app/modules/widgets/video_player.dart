import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoPlay extends StatefulWidget {
  @override
  State<VideoPlay> createState() => _VideoPlayState();
}

class _VideoPlayState extends State<VideoPlay> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
          'https://cdn.ncare.live/live-orgin/rajdhanitv.stream/playlist.m3u8'),
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) {
      _controller.play();
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool isFullScreen = false;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          VideoPlayer(_controller),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 50),
            reverseDuration: const Duration(milliseconds: 200),
            child: _controller.value.isPlaying
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
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    isFullScreen = true;
                  });
                  pushFullScreenVideo(context, _controller);
                },
                icon: Icon(
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
  }
}

void pushFullScreenVideo(context, controller) {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ],
  );
  Get.to(() => WillPopScope(
        onWillPop: () async {
          setPortraitMode();
         // Get.back();
          return true;
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: false,
          body: StatefulBuilder(builder: (context, setState) {
            return OrientationBuilder(
              builder: (context, orientation) {
                //  var isPortrait = orientation == Orientation.portrait;
                return Center(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      AspectRatio(
                        aspectRatio: controller.value.aspectRatio,
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            VideoPlayer(controller),
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 50),
                              reverseDuration:
                                  const Duration(milliseconds: 200),
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
                                  icon: Icon(
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
                    ],
                  ),
                );
              },
            );
          }),
        ),
      ));
}

void setPortraitMode() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [ SystemUiOverlay.top,SystemUiOverlay.bottom]);
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
}
