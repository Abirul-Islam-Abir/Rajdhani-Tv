import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../api_services/subscription_api.dart';
import '../../../model/subscription_model.dart';

class PackagesScreenController extends GetxController {
  List<SubscriptionModel> data = [];
  bool isLoading = false;
  // get tranId => null;
  Future<void> subscriptionResponse() async {
    final response = await subscriptionRequest();
    print(response);
    for (var json in response) {
      data.add(SubscriptionModel.fromJson(json));
    }
  }

  Future<void> initialize() async {
    isLoading = true;
    update();
    try {
      await Future.wait([subscriptionResponse()]);
    } catch (e) {
      throw Exception(e.toString());
    } finally {
      update();
    }
    isLoading = false;
    update();
  }

  @override
  void onInit() {
    initialize();
    super.onInit();
  }
}
