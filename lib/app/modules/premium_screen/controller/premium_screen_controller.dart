import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:untitled/app/data/shared_pref.dart';
import 'package:untitled/app/data/subscribed_value_change.dart';
import 'package:untitled/app/modules/bottom_nav_bar/view/bottom_nav.dart';
import 'package:untitled/app/routes/app_routes.dart';

import '../../../api_services/login.dart';
import '../../bottom_nav_bar/controller/bottom_nav_controller.dart';
import '../../home_screen/view/home_screen.dart';

class PremiumScreenController extends GetxController {
  final nameController = TextEditingController(text: "apitest@mail.com");
  final passController = TextEditingController(text: '12345678');
RxBool _isLoading = false.obs;
RxBool _isChecked = false.obs;
bool get isChecked=> _isChecked.value;
bool get isLoading=> _isLoading.value;
void isLoaded(isLoad)=>_isLoading.value = isLoad;
void isCheck(isLoad)=>_isChecked.value = isLoad;

  Future<void> login() async {
    isLoaded(true);
    final response = await loginRequest(name: nameController.text,pass: passController.text);
    if (response['success'] == true) {
      Get.snackbar('Success!', response['message']);
     await SharedPref.storeIsSubscribed(true);
      subscribed(true);
      isLoaded(false);
      Get.find<BottomNavController>().changeIndex(0);
    } else {
      Get.snackbar('inValid!', response['message']);
      isLoaded(false);
    }
  }
}
