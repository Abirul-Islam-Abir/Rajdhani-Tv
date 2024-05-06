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
}