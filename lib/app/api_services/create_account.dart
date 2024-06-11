 
  
  
  
  import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled/app/api_services/api_services.dart';
Future createAccountRequest( resBody) async { 
    
    final response = await http.post(
        Uri.parse(
          ApiServices.signUp,
        ),
        body: jsonEncode(resBody),
        headers: {'Content-Type': 'application/json'});
        final decodedBody = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return decodedBody;
    }else   {
        return decodedBody;
    }  
  }
