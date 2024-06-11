import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app/api_services/subscriber.dart';
import 'package:untitled/app/data/subscribed_value_change.dart';
import 'package:untitled/app/modules/bottom_nav_bar/view/bottom_nav.dart';

import '../../../data/app_image.dart';
import '../../../data/shared_pref.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    SharedPref.retrieveDarkMode();
    SharedPref.retrieveIsSubscribed(); 
    SharedPref.retrieveSubscriberId();
    checkSubscriptionValidity();
    super.initState();
  }

  checkSubscriptionValidity() async {
    final subId = SharedPref.retrieveSubscriberId();
    print(subId);

    final data = await subscriberDataRequest(subId);
    if (data['remaining_days'] == 0 ||
        data['remaining_days'] <= 1 ||
        data['remaining_days'] == null) {
      await SharedPref.storeIsSubscribed(false);
      subscribed(false);
      Get.off(() => BottomNav());
    } else {
      await SharedPref.storeIsSubscribed(true);
      subscribed(true);
      Future.delayed(const Duration(seconds: 5))
          .then((value) => Get.off(() => BottomNav()));
    }
  }

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
