import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app/modules/bottom_nav_bar/view/bottom_nav.dart';
import 'package:untitled/app/modules/home_screen/controller/home_controller.dart';

import '../../../data/app_image.dart';
import '../../../data/shared_pref.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    SharedPref.retrieveDarkMode();
    SharedPref.retrieveIsSubscribed();
    //TODO token can be retrieved from shared pref
    SharedPref.retrieveToken();
    Future.delayed(const Duration(seconds: 5)).then((value) =>
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => BottomNav()),
            (route) => false));
    super.initState();
  }

  final controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
              const Spacer(),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: MediaQuery.of(context).size.width / 2.5,
                  child: Image.asset(AppImage.appLogo)),
              const Spacer(),
              Text('Rajdhani Tv', style: TextStyle(color: Colors.grey)),
              Text('1.0.0', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}
