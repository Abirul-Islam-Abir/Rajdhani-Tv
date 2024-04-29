import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app/modules/bottom_nav_bar/controller/bottom_nav_controller.dart';
import 'package:untitled/app/modules/home_screen/controller/home_controller.dart';
import 'package:untitled/app/modules/home_screen/view/home_screen.dart';

import '../../../data/constant.dart';
import '../../archive_screen/view/archive_screen.dart';
import '../../home_screen/component/build_appbar.dart';
import '../../home_screen/component/custom_drawer.dart';
import '../../premium_screen/view/premium_screen.dart';

class BottomNav extends StatelessWidget {
    BottomNav({super.key});

  List pages = [
    HomeScreen(),
    const ArchiveScreen(),
    const PremiumScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(builder: (controller) {
      return Scaffold(
        drawer: const CustomDrawer(),
        appBar: controller.showAppbar ? buildAppBar() : null,
        bottomNavigationBar: GetBuilder<BottomNavController>(
          builder: (controller) {
            return CrystalNavigationBar(
              backgroundColor: kPrimaryColor,
              currentIndex: controller.selectedIndex,
              onTap: controller.changeIndex,
              indicatorColor: Colors.white,
              unselectedItemColor: Colors.black45,
              items: [
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
              ],
            );
          },
        ),
        body: GetBuilder<BottomNavController>(
          builder: (controller) => pages[controller.selectedIndex],
        ),
      );
    });
  }
}