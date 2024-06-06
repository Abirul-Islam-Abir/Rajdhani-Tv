import 'dart:convert';

import 'api_services.dart';
import 'package:http/http.dart' as http;

Future loginRequest({name, pass}) async {
  try {
    final response = await http.post(Uri.parse(ApiServices.loginUrl),
        body: {"subscriber_email": name, "password": pass},
        headers: {'Authorization': 'Application/json'});
    final decodedResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return decodedResponse;
    } else {
      return decodedResponse;
    }
  } catch (e) {
    throw Exception('Failed to load subscription packages: $e');
  }
}
