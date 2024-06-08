import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app/modules/create_account_screen/controller/create_account_controller.dart';
import 'package:untitled/app/modules/home_screen/component/build_appbar.dart';

import '../../premium_screen/component/background_box.dart';
import '../../premium_screen/component/submit_btn.dart';
import '../../premium_screen/component/subscribe_btn.dart';
import '../../widgets/custom_text_field.dart';

class CreateAccountScreen extends StatelessWidget {
  CreateAccountScreen(
      {super.key, required this.price, required this.packageId});

  final controller = Get.put(CreateAccountController());

  final int price;
  final int packageId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: BackgroundBox(
        height: 1.3,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Sign Up',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: controller.nameController,
                hint: 'Name',
              ),
              CustomTextField(
                controller: controller.emailController,
                hint: 'Email',
              ),
              CustomTextField(
                controller: controller.mobileController,
                hint: 'Mobile Number',
              ),
              CustomTextField(
                controller: controller.passController,
                hint: 'Password',
              ),
              CustomTextField(
                controller: controller.confirmPassController,
                hint: 'Confirm Password',
              ),
              Obx(() => SubmitButton(
                    isLoading: controller.isLoading.value,
                    tap: () {
                      controller.onButtonPressed(price, packageId);
                    },
                  )),
              SubscribeButton(
                tap: () {
                  Get.back();
                  Get.back();
                },
                title: 'Already have an account',
                btnText: 'Log In',
              )
            ],
          ),
        ),
      ),
    );
  }
}
