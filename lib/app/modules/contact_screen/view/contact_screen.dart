import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app/data/utils/validate.dart';
import 'package:untitled/app/modules/contact_screen/controller/contact_controller.dart';

import '../../../../main.dart';
import '../../../data/app_image.dart';
import '../../../data/constant.dart';
import '../../home_screen/component/rajdhani_logo.dart';
import '../../widgets/custom_text_field.dart';

class ContactScreen extends StatelessWidget {
  ContactScreen({super.key});
  final controller = Get.put(ContactController());
  @override
  Widget build(BuildContext context) {
    bool isDark = darkNotifier.value;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: const Text('Contact'),
        centerTitle: true,
        actions: [RajdhaniLogo(img: AppImage.appLogo)],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height / 1.5,
            width: double.infinity,
            decoration: BoxDecoration(
              color: isDark ? null : kPrimaryColor.withOpacity(0.90),
              borderRadius: BorderRadius.circular(20),
            ),
            child: SingleChildScrollView(
              child: Form(
                key: controller.key,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextField(
                      validator: validateName,
                      controller: controller.nameController,
                      hint: 'Name',
                    ),
                    CustomTextField(
                      validator: validateEmail,
                      controller: controller.emailController,
                      hint: 'Email',
                    ),
                    CustomTextField(
                      validator: validateText,
                      controller: controller.subController,
                      hint: 'Subject',
                    ),
                    CustomTextField(
                      validator: validateText,
                      controller: controller.queryController,
                      hint: 'Message',
                      maxLines: 4,
                    ),
                    Obx(() {
                      return controller.isLoading.value
                          ? const CircularProgressIndicator()
                          : InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: () {
                                controller.onButtonPressed();
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color:
                                          isDark ? kPrimaryColor : Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  height: 60,
                                  width: double.infinity,
                                  child: const Center(
                                    child: Text('Send',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                ),
                              ),
                            );
                    })
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
