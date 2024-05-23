
import 'package:dio/dio.dart';

import 'api_services.dart';

Future<dynamic> subscriptionRequest() async {
  Dio dio = Dio();
  try {
    Response response = await dio.get(ApiServices.subscriptionPackage);
    if (response.statusCode == 200) {
      // The response.data is already parsed JSON
      dynamic responseData = response.data;
      // Access the 'packages' field directly from the responseData map
      return responseData['packages'];
    } else {
      throw Exception('Failed to load subscription packages');
    }
  } catch (e) {
    throw Exception('Failed to load subscription packages: $e');
  }
}