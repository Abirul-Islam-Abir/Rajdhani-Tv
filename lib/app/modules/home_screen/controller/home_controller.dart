import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController{
  ScrollController scrollController = ScrollController();
  bool showAppbar = true;
  bool isScrollingDown = false;
  double bottomBarHeight = 75;
  int select = 0;
void tvChange(index){

    select = index;
  update();

}
  void myScroll() async {
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
  @override
  void onInit() {
    myScroll();
    super.onInit();
  }
}