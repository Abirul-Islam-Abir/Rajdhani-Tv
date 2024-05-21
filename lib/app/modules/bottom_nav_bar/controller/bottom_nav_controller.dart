import 'package:get/get.dart';
import 'package:untitled/app/modules/home_screen/controller/home_controller.dart';

import '../../widgets/video_player.dart';
import 'package:wakelock/wakelock.dart';
class BottomNavController extends GetxController {
  int selectedIndex = 0;

  void changeIndex(index) {
    if(index==0){
      Get.find<HomeScreenController>().videoController.play();
    }else{
      Get.find<HomeScreenController>().videoController.pause();
    }
    selectedIndex = index;
    update();
  }


  @override
  void onInit() {
    Wakelock.enable();
    setPortraitMode();
    super.onInit();
  }
  @override
  void dispose() {
    Wakelock.disable();
    super.dispose();
  }
}