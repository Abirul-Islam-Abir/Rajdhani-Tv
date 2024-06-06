import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/app/data/subscribed_value_change.dart';

import '../../main.dart';

abstract class SharedPref{
 static Future<void> storeIsDarkMode(data)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', data);
  }

 static Future<bool?>  retrieveDarkMode()async{
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   final bool? data = prefs.getBool('isDarkMode');
   darkNotifier.value = data ?? false;
   return data;
 }
 static Future<void> storeIsSubscribed(data)async{
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   await prefs.setBool('isSubscribe', data);
 }

 static Future<bool?>  retrieveIsSubscribed()async{
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   final bool? data = prefs.getBool('isSubscribe');
   subscribed(data??false);
   return data;
 }
}