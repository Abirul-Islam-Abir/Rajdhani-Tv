import 'package:flutter/material.dart';
import 'package:untitled/app/modules/bottom_nav_bar/view/bottom_nav.dart';

import '../../../data/app_image.dart';
import '../../home_screen/view/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5)).then((value) =>
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => BottomNav()),
            (route) => false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              const Spacer(),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: MediaQuery.of(context).size.width / 2.5,
                  child: Image.asset(AppImage.appLogo)),
              const Spacer(),
              Text('Rajdhani Tv', style: const TextStyle(color: Colors.grey)),
              Text('Version: 1.1.0',
                  style: const TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}
