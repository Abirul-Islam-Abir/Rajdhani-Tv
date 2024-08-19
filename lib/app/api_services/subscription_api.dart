

import 'dart:convert';

import 'api_services.dart';
import 'package:http/http.dart' as http;

Future subscriptionRequest() async {
  try {
    final response = await http.get(Uri.parse(ApiServices.subscriptionPackage));
    final decodedResponse = jsonDecode(response.body);
  if (response.statusCode == 200 || response.statusCode == 201) {
      return decodedResponse['packages'];
    } else {
      throw Exception('Failed to load subscription packages');
    }
  } catch (e) {
    throw Exception('Failed to load subscription packages: $e');
  }
}
