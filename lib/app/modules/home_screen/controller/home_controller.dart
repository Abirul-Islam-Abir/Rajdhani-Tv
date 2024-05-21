import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:untitled/app/model/all_videos_model.dart';
import 'package:video_player/video_player.dart';

import '../../../api_services/all_videos.dart';
import '../../../api_services/api_services.dart';

class HomeScreenController extends GetxController {
  ScrollController scrollController = ScrollController();
  late VideoPlayerController videoController;
  bool showAppbar = true;
  bool isScrollingDown = false;
  double bottomBarHeight = 75;
  int select = 0;
  videoPlayerController() {
    videoController = VideoPlayerController.networkUrl(
      Uri.parse(ApiServices.liveTv),
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );

    videoController.addListener(() {
      update();
    });
    videoController.setLooping(false);
    videoController.initialize().then((_) {
      videoController.play();
      update();
    });
  }

  void tvChange(index) {
    if (index == 0) {
      videoController.play();
    } else {
      videoController.pause();
    }
    select = index;
    update();
  }

  Future<void> scrollControll() async {
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          showAppbar = false;
          update();
        }
      }
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          showAppbar = true;
          print('scrool down');
          update();
        }
      }
    });
  }

  List<AllVideosModel> data = [];

  Future<void> allVideos() async {
    final response = await allVideosRequest();
    for (var json in response) {
      data.add(AllVideosModel.fromJson(json));
    }
  }

  Future<void> initialize() async {
    try {
      await Future.wait([allVideos()]);
    } catch (e) {
      throw Exception(e.toString());
    } finally {
      update();
    }
  }

  @override
  void onInit() {
    initialize();
    scrollControll();
    videoPlayerController();
    super.onInit();
  }

  @override
  void dispose() {
    videoController.dispose();
    super.dispose();
  }
}
