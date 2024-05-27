
import 'package:dio/dio.dart';
import 'package:untitled/app/api_services/api_services.dart';

Future categoryRequest() async {
  Dio dio = Dio();
  try {
    Response response = await dio.get(ApiServices.categoryUrl);
    if (response.statusCode == 200) {
      var responseData = response.data;
      print(responseData['categories']);
      return responseData['categories'];
    } else {
      throw Exception('Failed to load subscription packages');
    }
  } catch (e) {
    throw Exception('Failed to load subscription packages: $e');
  }
}
