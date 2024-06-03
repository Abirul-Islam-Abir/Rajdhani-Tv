import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/app/modules/home_screen/controller/home_controller.dart';

import '../../../../main.dart';
import '../../widgets/video_player.dart';
class BottomNavController extends GetxController {
  int selectedIndex = 0;

  void changeIndex(index) {
    if(index==0){
      Get.find<HomeScreenController>().videoController.play();
    }else{
      Get.find<HomeScreenController>().videoController.pause();
      Get.find<HomeScreenController>().isAppbarHide();
    }
    selectedIndex = index;
    update();
  }

  Future  writeIsDarkMode( )async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? data = prefs.getBool('isDarkMode');
    darkNotifier.value = data??false;
    print('${darkNotifier.value}==========================================');
  }
  @override
  void onInit() {
    writeIsDarkMode( );
    setPortraitMode();
    super.onInit();
  }
  @override
  void dispose() {
    super.dispose();
  }
}