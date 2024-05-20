import 'package:dio/dio.dart';
import 'package:untitled/app/api_services/api_services.dart';

Future allVideosRequest() async {
  Dio dio = Dio();
  Response response = await dio.get(ApiServices.allVideos);
  if(response.statusCode == 200){
    var responseData = response.data;
    print(responseData['categories']);
    return responseData;
  }
}
