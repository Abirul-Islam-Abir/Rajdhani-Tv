import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app/data/shared_pref.dart';
import 'package:untitled/app/data/subscribed_value_change.dart';
import 'package:untitled/app/data/utils/validate.dart';
import 'package:untitled/app/modules/home_screen/controller/home_controller.dart';
import 'package:untitled/app/modules/premium_screen/controller/premium_screen_controller.dart';
import 'package:untitled/app/modules/widgets/primary_btn.dart';
import 'package:untitled/app/routes/app_routes.dart';

import '../../widgets/custom_text_field.dart';
import '../component/background_box.dart';
import '../component/remember_box.dart';
import '../component/submit_btn.dart';
import '../component/subscribe_btn.dart'; 

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({super.key});

  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  final controller = Get.put(PremiumScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isSubscribed == true
          ? UserInfoBody(
              controller: controller,
            )
          : LoginBody(controller: controller),
    );
  }
}

class UserInfoBody extends StatelessWidget {
  UserInfoBody({super.key, required this.controller});
  final PremiumScreenController controller;

  final homeController = Get.put(HomeScreenController());
  @override
  Widget build(BuildContext context) {
    return BackgroundBox(
      child: Center(
        child: Container(
          margin: EdgeInsets.all(30),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(alignment: Alignment.center,
                child: Text(
                  'User Info',
                  style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold),
                ),
              ),
            SizedBox(height: 10),
              Text('NAME: ${ resBody['subscriber_name']}',
                  style: TextStyle(fontSize: 18)),
              Text('EMAIL: ${ resBody['subscriber_email']}',
                  style: TextStyle(fontSize: 18)),
              Text('MOBILE: ${ resBody['subscriber_mobile']}',
                  style: TextStyle(fontSize: 18)),
              Text('PACKAGE DUration: ${ resBody['package_name']}',
                  style: TextStyle(fontSize: 18)),
              Text(
                  'PACKAGE EXPIRED DATE: ${ resBody['expired_date']}',
                  style: TextStyle(fontSize: 18)),
              SizedBox(height: 40),
              Obx(() => homeController.isLogOut
                  ? Center(child: CircularProgressIndicator())
                  : Center(
                      child: PrimaryButton(
                        text: 'Log Out',
                        onTap: () async {
                          homeController.isLogedOut(true);
                          await SharedPref.unSubscribe().then((value) {
                            homeController.updateMethod();
                            Future.delayed(Duration(seconds: 3)).then((value) {
                              Get.snackbar('Success!', 'Successfully Log Out');
                              homeController.isLogedOut(false);
                              Get.find<HomeScreenController>()
                                  .videoController
                                  .play();
                            });
                          });
                        },
                      ),
                    )),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginBody extends StatelessWidget {
  const LoginBody({
    super.key,
    required this.controller,
  });

  final PremiumScreenController controller;

  @override
  Widget build(BuildContext context) {
    return BackgroundBox(
      child: Form(
        key: controller.key,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                'Sign In',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white),
              ),
              SizedBox(height: 20),
              CustomTextField(
                validator: validateEmail,
                controller: controller.emailController,
                hint: 'Email',
              ),
              CustomTextField(
                validator: validateNumericPassword,
                controller: controller.passController,
                hint: 'Password',
              ),
              Obx(() => RememberBox(
                  value: controller.isChecked, onChanged: controller.isCheck)),
              Obx(() => SubmitButton(
                  isLoading: controller.isLoading, tap: controller.login)),
              SubscribeButton(
                tap: () {
                  Get.toNamed(RouteName.packageScreen);
                },
                title: 'Don\'n have an account',
                btnText: 'Subscribe',
              )
            ],
          ),
        ),
      ),
    );
  }
}
