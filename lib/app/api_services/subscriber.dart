import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled/app/api_services/api_services.dart';

Future subscriberDataRequest(id) async {
  try {
    final response = await http.get(Uri.parse('${ApiServices.subscriber}$id'));
    final decodedResponse = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final resUnsuccess = {
        "remaining_days": 0,
      };

      final data = decodedResponse['success'] == true
          ? decodedResponse['data']
          : resUnsuccess;

      return data;
    } else {
      throw Exception('Failed to load subscription packages');
    }
  } catch (e) {
    throw Exception('Failed to load subscription packages: $e');
  }
}
