import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class CreateAccountController extends GetxController {
 final nameController = TextEditingController();
 final passController = TextEditingController();
 final RxBool _isLoading = false.obs;
 final RxBool _isChecked = false.obs;
 bool get isChecked => _isChecked.value;
 bool get isLoading => _isLoading.value;
 void isLoaded(isLoad) => _isLoading.value = isLoad;
 void isCheck(isLoad) => _isChecked.value = isLoad;


}