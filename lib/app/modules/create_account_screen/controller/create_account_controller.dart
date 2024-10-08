import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerz/model/SSLCTransactionInfoModel.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';
import 'package:get/get.dart';
import 'package:untitled/app/api_services/create_account.dart';
import 'package:untitled/app/api_services/login.dart';
import 'package:untitled/app/api_services/subscriber.dart';
import 'package:untitled/app/data/shared_pref.dart';
import 'package:untitled/app/data/utils/subscribe_or_unsubscribe_data_push.dart';
import 'package:untitled/app/model/subscriber_model.dart';
import 'package:untitled/app/modules/packages_screen/view/packages_screen.dart';

import '../../bottom_nav_bar/controller/bottom_nav_controller.dart';

class CreateAccountController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();
  final key = GlobalKey<FormState>();
  bool isPaymentSuccess = false;
  String transactionId = '';
  int status = 1;

  // final RxBool _isLoading = false.obs;
  // final RxBool _isChecked = false.obs;
  // bool get isChecked => _isChecked.value;
  // void isLoaded(isLoad) => _isLoading.value = isLoad;
  // void isCheck(isLoad) => _isChecked.value = isLoad;

  String generateTranId() {
    var now = DateTime.now();
    var rng = Random();
    String id =
        '${now.year}${now.month}${now.day}${now.hour}${now.minute}${now.second}${rng.nextInt(100000)}';
    return id;
  }

  RxBool isLoading = false.obs;

  Future crateAccount(
      {required String trxId,
      required int status,
      required int packageId,
      required int price,
      required String date}) async {
    isLoading.value = true;  
    final resBody = {
      "subscriber_name": nameController.text.trim().toString(),
      "subscriber_email": emailController.text.trim().toString(),
      "subscriber_mobile": mobileController.text.trim().toString(),
      "password": confirmPassController.text.toString(),
      "package_id": packageId,
      "expired_date": date,
      "status": status,
    };
    final response = await createAccountRequest(resBody);
    if (response['success'] == true &&
        response['message'] == 'Registration successful') {
       Get.back();
         Get.back();
        await login();
        Get.find<BottomNavController>().changeIndex(0);
    } else if (response['success'] == false &&
        response['message'] == 'Email already exists') {
      Get.snackbar('', 'Email already exists');
      Get.back();
         Get.back();
        await login();
        Get.find<BottomNavController>().changeIndex(0);
    } else {
      isLoading.value = false;
    }
  }

  Future<void> login() async {
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
      if (subscriber.remainingDays == 0 ||
          subscriber.remainingDays! <= 1 ||
          subscriber.remainingDays == null) {
        unSubscribedPushData();
        Get.to(() => PackagesScreen());
      } else {
        subscribedPushData();
        isLoading.value = false;
        Get.back();
        Get.back();
      }
    } else {
      isLoading.value = false;
      Get.snackbar('inValid!', response['message']);
    }
  }

  Future<void> sslCommerzGeneralCall(
      int price, int packageId,String day) async {
         String trxId = generateTranId();
    Sslcommerz sslcommerz = Sslcommerz(
      initializer: SSLCommerzInitialization(
        //Use the ipn if you have valid one, or it will fail the transaction.
        // ipn_url: "www.ipnurl.com",
        // multi_card_name: formData['multicard'],
        currency: SSLCurrencyType.BDT,
        product_category: "Entertainment",
        sdkType: SSLCSdkType.LIVE,
        store_id: 'rajdhanitv0live',
        store_passwd: '661FA9C73272280103',
        total_amount: double.parse(price.toString()),
        tran_id: trxId,
      ),
    );
    try {
      SSLCTransactionInfoModel result = await sslcommerz.payNow();
      if (result.status!.toLowerCase() == "failed") {
        Get.showSnackbar(const GetSnackBar(
          message: "Transaction is Failed....",
          duration: Duration(seconds: 2),
          backgroundColor: Colors.red,
        ));
      } else if (result.status!.toLowerCase() == "closed") {
        Get.showSnackbar(const GetSnackBar(
          message: "Transaction is Closed....",
          duration: Duration(seconds: 2),
          backgroundColor: Color.fromARGB(255, 229, 206, 204),
        ));
      } else { 
             await crateAccount(
            trxId: trxId,
            status: status,
            packageId: packageId,
            price: price,
            date: day);
        Get.showSnackbar(GetSnackBar(
          message:
              "Transaction is ${result.status} and Amount is ${result.amount}",
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.green,
        ));
       
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void clear() {
    nameController.clear();
    emailController.clear();
    mobileController.clear();
    passController.clear();
    confirmPassController.clear();
  }

  void onButtonPressed(int price, int packageId, String day) async {
    if (key.currentState!.validate()) {
      if (passController.text == confirmPassController.text) {
        String trxId = generateTranId();
       await  sslCommerzGeneralCall(price, packageId,day);
   
      }
    }
  }

  @override
  void onClose() {
    // Dispose of all the TextEditingControllers
    nameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    passController.dispose();
    confirmPassController.dispose();
    // Call super.onClose() to ensure proper cleanup
    super.onClose();
  }
}
