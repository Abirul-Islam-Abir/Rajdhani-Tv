import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled/app/api_services/api_services.dart';

Future subscriberDataRequest(id) async {
  try {
    final response = await http.get(Uri.parse('${ApiServices.subscriber}$id'));
    final decodedResponse = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final resUnsuccess = {
       
        "subscriber_id": 999999999,
        "subscriber_name": "Expired",
        "subscriber_email": "Expired@example.com",
        "subscriber_mobile": "1234567890",
        "email_verification": null,
        "package_id": 1,
        "package_name": "Expired",
        "price": 000,
        "duration": 0,
        "trans_id": "Expired",
        "reg_date": "2024-06-10 15:38:55",
        "expired_date": "2024-12-31",
        "status": 1,
        "remaining_days": 000
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
