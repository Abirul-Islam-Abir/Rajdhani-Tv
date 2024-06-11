import 'package:get/get.dart';
import 'package:untitled/app/modules/bottom_nav_bar/controller/bottom_nav_controller.dart';
import 'package:untitled/app/modules/premium_screen/controller/premium_screen_controller.dart';

import '../modules/create_account_screen/controller/create_account_controller.dart';
import '../modules/home_screen/controller/home_controller.dart';
import '../modules/internet_connectivity/connectivity.dart';
import '../modules/packages_screen/controller/package_screen_controller.dart';
class StateHolderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavController(), fenix: true);
    Get.lazyPut(() => CreateAccountController(), fenix: true);
    Get.lazyPut(() => HomeScreenController(), fenix: true);
      Get.lazyPut(() => PremiumScreenController(), fenix: true); 
    Get.put(PackagesScreenController(), permanent: true);
    Get.put(NetworkController(), permanent: true);
  }
}

