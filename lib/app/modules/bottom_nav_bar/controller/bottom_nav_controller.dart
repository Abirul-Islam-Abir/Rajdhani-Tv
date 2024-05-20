import 'package:get/get.dart';

import '../../widgets/video_player.dart';
import 'package:wakelock/wakelock.dart';
class BottomNavController extends GetxController {
  int selectedIndex = 0;

  void changeIndex(index) {
    selectedIndex = index;
    update();
  }


  @override
  void onInit() {
    Wakelock.enable();
    super.onInit();
  }
  @override
  void dispose() {
    Wakelock.disable();
    super.dispose();
  }
}