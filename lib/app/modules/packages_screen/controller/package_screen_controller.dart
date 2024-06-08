import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerz/model/SSLCTransactionInfoModel.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';
import 'package:get/get.dart';

import '../../../api_services/subscription_api.dart';
import '../../../model/subscription_model.dart';

class PackagesScreenController extends GetxController {
  List<SubscriptionModel> data = [];
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

  Future<void> sslCommerzGeneralCall() async {
    Sslcommerz sslcommerz = Sslcommerz(
      initializer: SSLCommerzInitialization(
        //Use the ipn if you have valid one, or it will fail the transaction.
        // ipn_url: "www.ipnurl.com",
        // multi_card_name: formData['multicard'],
        currency: SSLCurrencyType.BDT,
        product_category: "Food",
        sdkType: SSLCSdkType.TESTBOX,

        store_id: 'rajdh65fee33aef616',
        store_passwd: 'rajdh65fee33aef616@ssl',
        total_amount: 10,
        tran_id: "mmm",
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
        log(result.tranId ?? 'no tranId');
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
