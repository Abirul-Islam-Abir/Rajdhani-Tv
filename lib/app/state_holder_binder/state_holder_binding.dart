import 'package:get/get.dart';
import 'package:untitled/app/modules/bottom_nav_bar/controller/bottom_nav_controller.dart';

import '../modules/home_screen/controller/home_controller.dart';
import '../modules/packages_screen/controller/package_screen_controller.dart';

class StateHolderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavController());
    Get.lazyPut(() => HomeScreenController());
    Get.put(  PackagesScreenController());
  }
}