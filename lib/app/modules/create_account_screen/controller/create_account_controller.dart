import 'dart:convert';
import 'dart:developer' as dev;
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
import 'package:untitled/app/data/shared_pref.dart';
import 'package:untitled/app/data/subscribed_value_change.dart';
import 'package:untitled/app/modules/bottom_nav_bar/view/bottom_nav.dart';

class CreateAccountController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();

  bool isPaymentSuccess = false;
  String transactionId = '';
  int status = 0;
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

  Future<bool> signUp(String trxId, int status, int packageId) async {
    isLoading.value = true;
    update();
    dev.log('signUp called1');
    final resBody = {
      "subscriber_name": nameController.text.trim().toString(),
      "subscriber_email": emailController.text.trim().toString(),
      "subscriber_mobile": mobileController.text.trim().toString(),
      "password": confirmPassController.text.toString(),
      "package_id": packageId,
      "trans_id": trxId,
      "status": status,
    };
    dev.log('signUp called2');
    final response = await http.post(
        Uri.parse(
          ApiServices.signUp,
        ),
        body: jsonEncode(resBody),
        headers: {'Content-Type': 'application/json'});
    dev.log('signUp called3');
    dev.log(response.statusCode.toString());
    if (response.statusCode == 200 || response.statusCode == 201) {
      dev.log('signUp called4');
      dev.log(response.body);
      // isLoading.value = false;
      // update();
      Future.delayed(const Duration(seconds: 1), () async {
        login();
      });

      return true;
    } else {
      isLoading.value = false;
      update();
      return false;
    }
  }

  Future<void> login() async {
    // isLoading.value = true;
    // update();
    final response = await loginRequest(
        name: emailController.text, pass: passController.text);
    if (response['success'] == true) {
      Get.snackbar('Success!', response['message']);
      await SharedPref.storeMail(nameController.text.toString());
      await SharedPref.storeToken(response['token']);
      subscribed(true);
      isLoading.value = false;
      update();
      Get.offAll(() => BottomNav());
    } else {
      Get.snackbar('inValid!', response['message']);
      isLoading.value = false;
      update();
    }
  }

  Future<void> sslCommerzGeneralCall(int price, int packageId) async {
    String trxId = generateTranId();
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
          backgroundColor: Colors.red,
        ));
      } else {
        dev.log(result.tranId ?? 'no tranId');
        isPaymentSuccess = true;
        transactionId = result.tranId!;
        status = 1;
        update();

        Get.showSnackbar(GetSnackBar(
          message:
              "Transaction is ${result.status} and Amount is ${result.amount}",
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.green,
        ));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void clear() {
    nameController.clear();
    emailController.clear();
    mobileController.clear();
    passController.clear();
    confirmPassController.clear();
  }

  onButtonPressed(int price, int packageId) async {
    if (nameController.text.isEmpty) {
      Get.snackbar('Error', 'Name is required',
          backgroundColor: Colors.redAccent.withOpacity(.3));
    } else if (emailController.text.isEmpty) {
      Get.snackbar('Error', 'Email is required',
          backgroundColor: Colors.redAccent.withOpacity(.3));
    } else if (mobileController.text.isEmpty) {
      Get.snackbar('Error', 'Mobile is required',
          backgroundColor: Colors.redAccent.withOpacity(.3));
    } else if (passController.text.isEmpty) {
      Get.snackbar('Error', 'Password is required',
          backgroundColor: Colors.redAccent.withOpacity(.3));
    } else if (confirmPassController.text.isEmpty) {
      Get.snackbar('Error', 'Confirm Password is required',
          backgroundColor: Colors.redAccent.withOpacity(.3));
    } else if (passController.text != confirmPassController.text) {
      Get.snackbar('Error', 'Password and Confirm Password must be same',
          backgroundColor: Colors.redAccent.withOpacity(.3));
    } else {
      await sslCommerzGeneralCall(price, packageId).then((_) async {
        if (isPaymentSuccess) await signUp(transactionId, status, packageId);
      });
    }
  }
}
