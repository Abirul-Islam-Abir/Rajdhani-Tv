import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/app/api_services/api_services.dart';

class ContactController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final subController = TextEditingController();
  final queryController = TextEditingController();
  final key = GlobalKey<FormState>();

  RxBool isLoading = false.obs;

  Future<bool> contact() async {
    isLoading.value = true;

    final resBody = {
      "name": nameController.text.trim().toString(),
      "email": emailController.text.trim().toString(),
      "subject": subController.text.trim().toString(),
      "message": queryController.text.trim().toString(),
    };
    final response = await http.post(
        Uri.parse(
          ApiServices.contact,
        ),
        body: jsonEncode(resBody),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200 || response.statusCode == 201) {
      log(response.body);
      isLoading.value = false;
      return true;
    } else {
      log(response.body);
      isLoading.value = false;
      return false;
    }
  }

  void clear() {
    nameController.clear();
    emailController.clear();
    subController.clear();
    queryController.clear();
  }

  void onButtonPressed() async {
    if (key.currentState!.validate()) {
      final isSuccess = await contact();
      if (isSuccess) {
        Get.back();
        clear();
        Get.snackbar('Success', 'Your query has been submitted successfully',
            snackPosition: SnackPosition.TOP);
      } else {
        Get.snackbar('Error', 'Something went wrong',
            snackPosition: SnackPosition.TOP);
      }
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    subController.dispose();
    queryController.dispose();
    super.onClose();
  }
}
