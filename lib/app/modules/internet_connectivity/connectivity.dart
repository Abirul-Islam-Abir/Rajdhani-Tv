import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkController extends GetxController {
  //this variable 0 = No Internet, 1 = connected to WIFI ,2 = connected to Mobile Data.
  static int connectionType = 0;
  StreamSubscription<List<ConnectivityResult>>? subscription;
  @override
  void onInit() {
    super.onInit();
      subscription = Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> result) {
      // Received changes in available connectivity types!
      internet();
    });
  }

Future internet()async{
  final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult.contains(ConnectivityResult.mobile)) {
    if (Get.isSnackbarOpen) {
      Get.closeAllSnackbars();
      Get.back(closeOverlays: true);
    }
    connectionType = 2;
  } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
    if (Get.isSnackbarOpen) {
      Get.closeAllSnackbars();
      Get.back(closeOverlays: true);
    }
    connectionType = 1;
  } else if (connectivityResult.contains(ConnectivityResult.ethernet)) {
    showNetworkSnackBar();
    connectionType = 0;
  } else if (connectivityResult.contains(ConnectivityResult.vpn)) {
    showNetworkSnackBar();
    connectionType = 0;
  } else if (connectivityResult.contains(ConnectivityResult.bluetooth)) {
    showNetworkSnackBar();
    connectionType = 0;
  } else if (connectivityResult.contains(ConnectivityResult.other)) {
    showNetworkSnackBar();
    connectionType = 0;
  } else if (connectivityResult.contains(ConnectivityResult.none)) {
    showNetworkSnackBar();
    connectionType = 0;
  }
}
  @override
  void onClose() {
    subscription!.cancel();
  }
}

void showNetworkSnackBar() {
  Get.dialog(
    PopScope(canPop: false, onPopInvoked: (didPop) {}, child: Container()),
    barrierDismissible: false,
  );
  Get.showSnackbar(const GetSnackBar(
    title: 'No Internet!',
    message: 'Please check your internet connection!',
    isDismissible: false,
    backgroundColor: Colors.black,
    showProgressIndicator: true,
  ));

}