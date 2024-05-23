import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPref{
 static Future<void> storeIsDarkMode(data)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', data);
  }


}