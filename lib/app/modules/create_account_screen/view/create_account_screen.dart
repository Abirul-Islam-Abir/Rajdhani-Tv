import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app/modules/create_account_screen/controller/create_account_controller.dart';
import 'package:untitled/app/modules/home_screen/component/build_appbar.dart';

import '../../../routes/app_routes.dart';
import '../../packages_screen/component/package_headline.dart';
import '../../premium_screen/component/background_box.dart';
import '../../premium_screen/component/remember_box.dart';
import '../../premium_screen/component/submit_btn.dart';
import '../../premium_screen/component/subscribe_btn.dart';
import '../../widgets/custom_text_field.dart';

class CreateAccountScreen extends StatelessWidget {
  CreateAccountScreen({super.key});

  final controller = Get.put(CreateAccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: BackgroundBox(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text('Sign Up',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),),   SizedBox(height: 20),
              CustomTextField(
                controller: controller.nameController,
                hint: 'Email',
              ),
              CustomTextField(
                controller: controller.passController,
                hint: 'Password',
              ),
              CustomTextField(
                controller: controller.passController,
                hint: 'Confirm Password',
              ),
              Obx(() => SubmitButton(
                    isLoading: controller.isLoading,
                    tap: () {},
                  )),
              SubscribeButton(tap: () {
                Get.back();
                Get.back();
              },title: 'Already have an account',btnText: 'Log In',)
            ],
          ),
        ),
      ),
    );
  }
}
