import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:untitled/app/data/subscribed_value_change.dart';
import 'package:untitled/app/model/all_videos_model.dart';
import 'package:untitled/app/model/category_model.dart';
import 'package:video_player/video_player.dart';

import '../../../../main.dart';
import '../../../api_services/all_videos.dart';
import '../../../api_services/api_services.dart';
import '../../../api_services/category_name.dart';
import '../../../data/shared_pref.dart';

class HomeScreenController extends GetxController {
  ScrollController scrollController = ScrollController();
  late VideoPlayerController videoController;
  bool showAppbar = true;
  bool isScrollingDown = false;
  double bottomBarHeight = 75;
  RxInt select = 0.obs;
  RxBool _isLogOut = false.obs;
  bool get isLogOut => _isLogOut.value;
  RxBool _isLoadedData = true.obs;
  bool get isLoadedData => _isLoadedData.value;
  void isLoad(value) {
    _isLoadedData.value = value;
  }

  void isLogedOut(value) {
    _isLogOut.value = value;
  }

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

  void isAppbarHide() {
    showAppbar = true;
    update();
  }

  void tvChange(index) {
    if (index == 0) {
      videoController.play();
    } else {
      videoController.pause();
    }
    select.value = index; 
  }

  changeDarkMode(value) async {
    darkNotifier.value = value;
    await SharedPref.storeIsDarkMode(value);
    update();
  }

  void updateMethod() {
    subscribed(false);
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

  List<AllVideosModel> allVideosData = [];
  List<CategoryModel> categoryData = [];
  List<EmbedCodes> suggestedData = [];
  List<EmbedCodes> recommendedData = [];

  Future<void> allVideos() async {
    final response = await allVideosRequest();
    List categories = response['categories'];
    List suggest = response['categories'][2]['embed_codes']; 
    List recommend = response['categories'][5]['embed_codes']; 
    for (var json in categories) {  
      allVideosData.add(AllVideosModel.fromJson(json));  
      print(json);
    }
    for (var json in suggest) { 
      // Parse and add to allVideosData 
      suggestedData.add(EmbedCodes.fromJson(json));   print(json);
    }
     for (var json in recommend) { 
      // Parse and add to allVideosData 
      recommendedData.add(EmbedCodes.fromJson(json));   print(json);
    }
  }

  Future<void> category() async {
    final response = await categoryRequest();
    for (var json in response) {
      categoryData.add(CategoryModel.fromJson(json));
    }
  }

  Future<void> initialize() async {
    try {
      await Future.wait([allVideos(), category()]);
    } catch (e) {
      throw Exception(e.toString());
    } finally {
      isLoad(false);
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
  void onClose() {
    videoController.dispose();
    super.onClose();
  }
}
