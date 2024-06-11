import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled/app/api_services/subscriber.dart';
import 'package:untitled/app/data/shared_pref.dart';
import 'package:untitled/app/data/utils/subscribe_or_unsubscribe_data_push.dart';
import 'package:untitled/app/model/subscriber_model.dart';
import 'package:untitled/app/modules/packages_screen/view/packages_screen.dart';

import '../../../api_services/login.dart';
import '../../bottom_nav_bar/controller/bottom_nav_controller.dart';

Map resBody = {};

class PremiumScreenController extends GetxController {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final RxBool _isLoading = false.obs;
  final RxBool _isChecked = false.obs;
  final bool isPrem = Get.arguments ?? false;
  bool get isChecked => _isChecked.value;
  bool get isLoading => _isLoading.value;
  void isLoaded(isLoad) => _isLoading.value = isLoad;
  void isCheck(isLoad) => _isChecked.value = isLoad;

  final key = GlobalKey<FormState>();
  Future<void> login() async {
    if (key.currentState!.validate()) {
      isLoaded(true);
      try {
        final response = await loginRequest(
            name: emailController.text.toString(),
            pass: passController.text.toString());
        if (response['success'] == true) {
          //  Get.snackbar('Success!', response['message']);
          await SharedPref.storeMail(emailController.text.toString());
          await SharedPref.storeSubscriberId(response['subscriber_id']);
          await SharedPref.storeMail(emailController.text.toString());

          //! New API call
          final data = await subscriberDataRequest(response['subscriber_id']);
          SubscriberModel subscriber = SubscriberModel.fromJson(data);
          resBody = data;
          if (subscriber.remainingDays == 0 ||
              subscriber.remainingDays! <= 1 ||
              subscriber.remainingDays == null) {
            unSubscribedPushData();
            Get.to(() => PackagesScreen());
          } else {
            subscribedPushData();
            Get.find<BottomNavController>().changeIndex(0);
          }
        } else {
          Get.snackbar('inValid!', response['message']);
        }
      } catch (e) {
        Get.snackbar('inValid!', '$e');
      } finally {
        isLoaded(false);
      }
    }
  }

  void setMail() async {
    print(isPrem);
    final data = await SharedPref.retrieveMail();
    emailController.text = data ?? '';
  }

  @override
  void onInit() {
    setMail();
    super.onInit();
  }

  @override
  void onClose() {
    // Dispose of TextEditingController instances
    emailController.dispose();
    passController.dispose();
    super.onClose();
  }
}
