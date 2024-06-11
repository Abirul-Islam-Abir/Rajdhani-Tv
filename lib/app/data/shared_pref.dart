import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/app/data/subscribed_value_change.dart';

import '../../main.dart';

abstract class SharedPref {
  static Future<void> storeIsDarkMode(data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', data);
  }

  static Future<bool?> retrieveDarkMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? data = prefs.getBool('isDarkMode');
    darkNotifier.value = data ?? false;
    return data;
  }

  static Future<void> storeIsSubscribed(data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isSubscribe', data);
  }

  static Future<bool?> retrieveIsSubscribed() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? data = prefs.getBool('isSubscribe');
    subscribed(data ?? false);
    return data;
  }
 static Future<bool?> unSubscribe() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
     await prefs.setBool('isSubscribe', false);
    final bool? data = prefs.getBool('isSubscribe');
    subscribed(data);
    return data;
  }
  static Future<void> storeSubscriberId(data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('subscriber_id', data);
  }

  static Future retrieveSubscriberId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = prefs.getInt('subscriber_id');
    return data;
  }

 

  static Future<void> storeMail(mail) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('mail', mail);
  }

  static Future<String?> retrieveMail( ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? data = prefs.getString('mail');
      return data;
  }

  
}
