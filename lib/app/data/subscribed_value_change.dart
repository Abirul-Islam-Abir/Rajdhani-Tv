import 'package:get/get.dart';

RxBool _isSubscribed = false.obs;
bool get isSubscribed =>_isSubscribed.value;
void subscribed(value)=>_isSubscribed.value = value;