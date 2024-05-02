import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/data/constant.dart';
import 'app/data/state_holder_binding.dart';
import 'app/modules/bottom_nav_bar/view/bottom_nav.dart';
import 'app/modules/home_screen/view/home_screen.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const RajdhaniTv());
}

class RajdhaniTv extends StatefulWidget {
  const RajdhaniTv({super.key});

  @override
  State<RajdhaniTv> createState() => _RajdhaniTvState();
}

class _RajdhaniTvState extends State<RajdhaniTv> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        title: 'Rajdhani Tv',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
          brightness: Brightness.light,
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
                borderSide: BorderSide(),
                borderRadius: BorderRadius.circular(10)),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5))),
          ),
        ),
        themeMode: ThemeMode.system,
        getPages: [GetPage(name: '/', page: () => BottomNav())],
        initialRoute: '/',
        initialBinding: StateHolderBinding(),
      );
    });
  }
}