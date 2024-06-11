import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled/app/api_services/api_services.dart';

Future subscriberDataRequest(id) async {
  try {
    final response = await http.get(Uri.parse('${ApiServices.subscriber}$id'));
    final decodedResponse = jsonDecode(response.body);
    if (response.statusCode == 200|| response.statusCode == 201) {
      return decodedResponse['data'];
    } else {
      throw Exception('Failed to load subscription packages');
    }
  } catch (e) {
    throw Exception('Failed to load subscription packages: $e');
  }
}
