import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app/data/constant.dart';
import 'package:untitled/app/modules/bottom_nav_bar/controller/bottom_nav_controller.dart';
import 'package:untitled/app/modules/home_screen/controller/home_controller.dart';
import 'package:upgrader/upgrader.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

import '../../../data/method.dart';
import '../../home_screen/component/build_appbar.dart';
import '../../home_screen/component/custom_drawer.dart';
import '../../home_screen/component/page.dart';

class BottomNav extends StatelessWidget {
  BottomNav({super.key});

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final controller = Get.put(BottomNavController());
  final iconList = <IconData>[
    Icons.brightness_5,
    Icons.brightness_4,
    Icons.brightness_6,
  ];
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: _backButtonPressed,
      child: GetBuilder<HomeScreenController>(
          builder: (controller) => UpgradeAlert(
                dialogStyle: UpgradeDialogStyle.cupertino,
                showIgnore: false,
                showLater: false,
                showReleaseNotes: true,
                barrierDismissible: false,
                upgrader: Upgrader(
                  durationUntilAlertAgain: const Duration(seconds: 0),
                ),
                cupertinoButtonTextStyle: const TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                child: Scaffold(
                  key: _scaffoldKey,
                  drawer: CustomDrawer(
                    scaffoldKey: _scaffoldKey,
                  ),
                  appBar: controller.showAppbar ? buildAppBar() : null,
                  bottomNavigationBar: GetBuilder<BottomNavController>(
                    builder: (controller) => WaterDropNavBar(
                      waterDropColor: kPrimaryColor,
                      backgroundColor: Colors.white,
                      onItemSelected: controller.changeIndex,
                      selectedIndex: controller.selectedIndex,
                      inactiveIconColor: Colors.black,
                      barItems: <BarItem>[
                        BarItem(
                          filledIcon: Icons.home,
                          outlinedIcon: Icons.home_outlined,
                        ),
                        BarItem(
                            filledIcon: Icons.newspaper_outlined,
                            outlinedIcon: Icons.newspaper_outlined),
                        BarItem(
                          filledIcon: Icons.subscriptions,
                          outlinedIcon: Icons.subscriptions,
                        ),
                      ],
                    ),
                    //other params
                  ),
                  body: GetBuilder<BottomNavController>(
                    builder: (controller) => pages[controller.selectedIndex],
                  ),
                ),
              )),
    );
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
