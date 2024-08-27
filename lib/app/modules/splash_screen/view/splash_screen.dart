import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app/api_services/subscriber.dart';
import 'package:untitled/app/data/subscribed_value_change.dart';
import 'package:untitled/app/data/utils/subscribe_or_unsubscribe_data_push.dart';
import 'package:untitled/app/model/subscriber_model.dart';
import 'package:untitled/app/modules/bottom_nav_bar/view/bottom_nav.dart';
import 'package:untitled/app/modules/premium_screen/controller/premium_screen_controller.dart';

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
    Future.delayed(const Duration(seconds: 5))
        .then((value) => checkSubscriptionValidity());

    super.initState();
  }

 Future checkSubscriptionValidity() async {
    final subId  = await SharedPref.retrieveSubscriberId();
    print(subId);
    final data = await subscriberDataRequest(subId);
    //Set data for login ui when user login
    resBody = data;
    print(data);
    SubscriberModel subscriber = SubscriberModel.fromJson(data);
    if (subscriber.remainingDays == 0 ||
        subscriber.remainingDays! <= 1 ||
        subscriber.remainingDays == null) {
      unSubscribedPushData();
      Get.off(() => BottomNav());
    } else {
      subscribedPushData();
      Get.off(() => BottomNav());
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
              Text('5.0.0', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}
