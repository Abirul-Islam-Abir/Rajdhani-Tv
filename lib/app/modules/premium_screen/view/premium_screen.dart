import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app/data/utils/validate.dart';
import 'package:untitled/app/modules/premium_screen/controller/premium_screen_controller.dart';
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
      body: BackgroundBox(
        child: Form(key: controller.key,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [   SizedBox(height: 20),
                Text('Sign In',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),),   SizedBox(height: 20),
                CustomTextField(validator: validateEmail,
                  controller: controller.emailController,
                  hint: 'Email',
                ),
                CustomTextField(validator: validateNumericPassword,
                  controller: controller.passController,
                  hint: 'Password',
                ),
                Obx(() => RememberBox(
                    value: controller.isChecked, onChanged: controller.isCheck)),
                Obx(() => SubmitButton(
                    isLoading: controller.isLoading, tap: controller.login)),
                SubscribeButton(tap: () {
                  Get.toNamed(RouteName.packageScreen);
                },title: 'Don\'n have an account',btnText: 'Subscribe',)
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}
