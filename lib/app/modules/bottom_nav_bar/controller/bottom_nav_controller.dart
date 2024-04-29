import 'package:get/get.dart';

class BottomNavController extends GetxController {
  int selectedIndex = 0;
  void changeIndex(index) {
    selectedIndex = index;
    update();
  }
}