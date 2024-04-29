import 'dart:io';

import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app/modules/bottom_nav_bar/controller/bottom_nav_controller.dart';
import 'package:untitled/app/modules/home_screen/controller/home_controller.dart';
import 'package:untitled/app/modules/home_screen/view/home_screen.dart';

import '../../../data/constant.dart';
import '../../../data/method.dart';
import '../../archive_screen/view/archive_screen.dart';
import '../../home_screen/component/build_appbar.dart';
import '../../home_screen/component/custom_drawer.dart';
import '../../home_screen/component/page.dart';
import '../../premium_screen/view/premium_screen.dart';

class BottomNav extends StatelessWidget {
  BottomNav({super.key});

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final controller = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: _backButtonPressed,
      child: GetBuilder<HomeScreenController>(builder: (controller) => Scaffold(
          key: _scaffoldKey,
          drawer: const CustomDrawer(),
          appBar: controller.showAppbar ? buildAppBar() : null,
          bottomNavigationBar: GetBuilder<BottomNavController>(
            builder: (controller) => CrystalNavigationBar(
                backgroundColor: kPrimaryColor,
                currentIndex: controller.selectedIndex,
                onTap: controller.changeIndex,
                indicatorColor: Colors.white,
                unselectedItemColor: Colors.black45,
                items: buildItems(),
              ),
          ),
          body: GetBuilder<BottomNavController>(
            builder: (controller) => pages[controller.selectedIndex],
          ),
        )),
    );
  }

  List<CrystalNavigationBarItem> buildItems() {
    return [
                CrystalNavigationBarItem(
                  icon: Icons.home_outlined,
                  unselectedIcon: Icons.home_outlined,
                  selectedColor: Colors.white,
                ),
                CrystalNavigationBarItem(
                    icon: Icons.file_copy_rounded,
                    unselectedIcon: Icons.file_copy_rounded,
                    selectedColor: Colors.white),
                CrystalNavigationBarItem(
                    icon: Icons.video_settings,
                    unselectedIcon: Icons.video_settings,
                    selectedColor: Colors.white),
              ];
  }

  void _backButtonPressed(v) {
    _scaffoldKey.currentState?.closeDrawer();
    if (controller.selectedIndex == 0) {
      showExitDialog();
    } else {
      controller.changeIndex(0);
    }
  }
}