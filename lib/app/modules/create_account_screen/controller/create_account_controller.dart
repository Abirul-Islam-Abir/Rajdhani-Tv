import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerz/model/SSLCTransactionInfoModel.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/app/api_services/api_services.dart';
import 'package:untitled/app/api_services/login.dart';
import 'package:untitled/app/api_services/subscriber.dart';
import 'package:untitled/app/data/shared_pref.dart';
import 'package:untitled/app/data/subscribed_value_change.dart';
import 'package:untitled/app/modules/packages_screen/view/packages_screen.dart';

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

  Future signUp(
      {required String trxId,
      required int status,
      required int packageId,
      required int price,
      required String date}) async {
    isLoading.value = true;
    print(date);
    final resBody = {
      "subscriber_name": nameController.text.trim().toString(),
      "subscriber_email": emailController.text.trim().toString(),
      "subscriber_mobile": mobileController.text.trim().toString(),
      "password": confirmPassController.text.toString(),
      "package_id": packageId,
      "expired_date": date,
      "status": status,
    };
    final response = await http.post(
        Uri.parse(
          ApiServices.signUp,
        ),
        body: jsonEncode(resBody),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200 || response.statusCode == 201) {
      await sslCommerzGeneralCall(price, packageId, trxId);
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
      if (data['remaining_days'] == 0 ||
          data['remaining_days'] <= 1 ||
          data['remaining_days'] == null) {
        Get.to(() => PackagesScreen());
      } else {
        await SharedPref.storeIsSubscribed(true);
        subscribed(true);
        isLoading.value = false; 
        Get.back();    Get.back();   
        //Get.offAll(() => BottomNav());
      }
    } else {
      isLoading.value = false;
      Get.snackbar('inValid!', response['message']);
    }
  }

  Future<void> sslCommerzGeneralCall(
      int price, int packageId, String trxId) async {
    Sslcommerz sslcommerz = Sslcommerz(
      initializer: SSLCommerzInitialization(
        //Use the ipn if you have valid one, or it will fail the transaction.
        // ipn_url: "www.ipnurl.com",
        // multi_card_name: formData['multicard'],
        currency: SSLCurrencyType.BDT,
        product_category: "Entertainment",
        sdkType: SSLCSdkType.TESTBOX,
        store_id: 'rajdh65fee33aef616',
        store_passwd: 'rajdh65fee33aef616@ssl',
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
         Get.back();   
        Get.showSnackbar(GetSnackBar(
          message:
              "Transaction is ${result.status} and Amount is ${result.amount}",
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.green,
        ));
         Get.back();
        await login();
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
        await signUp(
            trxId: trxId,
            status: status,
            packageId: packageId,
            price: price,
            date: day);
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
