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

import '../../../api_services/subscription_api.dart';
import '../../../model/subscription_model.dart';

class PackagesScreenController extends GetxController {
  List<SubscriptionModel> data = [];

  // get tranId => null;
  Future<void> subscriptionResponse() async {
    final response = await subscriptionRequest();
    for (var json in response) {
      data.add(SubscriptionModel.fromJson(json));
    }
  }

  Future<void> initialize() async {
    try {
      Future.wait([subscriptionResponse()]);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  void onInit() {
    initialize();
    super.onInit();
  }

  String generateTranId() {
    var now = DateTime.now();
    var rng = Random();
    String id =
        '${now.year}${now.month}${now.day}${now.hour}${now.minute}${now.second}${rng.nextInt(100000)}';
    return id;
  }

  bool isSignUp = false;

  Future<bool> signUp(String trxId, int status, int packageId) async {
    isSignUp = true;
    update();

    final resBody = {
      "subscriber_name": "Muj",
      "subscriber_email": "dev.muj@icloud.com",
      "subscriber_mobile": "0171717171",
      "password": "securepassword",
      "package_id": packageId,
      "trans_id": trxId,
      "status": status,
    };

    final response = await http.post(
        Uri.parse(
          ApiServices.signUp,
        ),
        body: jsonEncode(resBody),
        headers: {'Authorization': 'Application/json'});

    if (response.statusCode == 200 || response.statusCode == 201) {
      isSignUp = false;
      update();
      return true;
    } else {
      isSignUp = false;
      update();
      return false;
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
        signUp(
            trxId, result.status!.toLowerCase() == "failed" ? 0 : 1, packageId);
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
}
