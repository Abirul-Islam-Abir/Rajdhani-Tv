import 'package:get/get.dart';
import 'package:untitled/app/modules/packages_screen/controller/package_screen_controller.dart';

// 
class PackageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PackagesScreenController());
  }
}
