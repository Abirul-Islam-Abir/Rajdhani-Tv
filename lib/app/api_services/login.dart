import 'dart:convert';

import 'api_services.dart';
import 'package:http/http.dart' as http;

Future loginRequest({name, pass}) async {
   final response = await http.post(Uri.parse(ApiServices.loginUrl),
        body: {"subscriber_email": name, "password": pass},
        headers: {'Authorization': 'application/json'});
    final decodedResponse = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return decodedResponse;
    } else {
      return decodedResponse;
    }
}
