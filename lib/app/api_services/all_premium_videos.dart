import 'dart:convert';

import 'package:untitled/app/api_services/api_services.dart';
import 'package:http/http.dart' as http;

Future allPremiumRequest() async {
  try {
    final response = await http.get(Uri.parse(ApiServices.allVideos));
    final decodedResponse = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return decodedResponse;
    } else {
      throw Exception('Failed to load subscription packages');
    }
  } catch (e) {
    throw Exception('Failed to load subscription packages: $e');
  }
}
