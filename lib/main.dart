import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/data/constant.dart';
import 'app/data/state_holder_binding.dart';
import 'app/modules/bottom_nav_bar/view/bottom_nav.dart';
import 'app/modules/home_screen/view/home_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:device_preview/device_preview.dart';

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const RajdhaniTv(), // Wrap your app
      ),
    );
final darkNotifier = ValueNotifier<bool>(false);

class RajdhaniTv extends StatefulWidget {
  const RajdhaniTv({super.key});

  @override
  State<RajdhaniTv> createState() => _RajdhaniTvState();
}

class _RajdhaniTvState extends State<RajdhaniTv> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: darkNotifier,
        builder: (BuildContext context, bool isDark, Widget? child) {
          return GetMaterialApp(
            title: 'Rajdhani Tv',
            debugShowCheckedModeBanner: false,
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
            darkTheme: ThemeData.dark(),
            theme: ThemeData(
              primarySwatch: Colors.red,
              brightness: Brightness.light, 
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
            ),
            getPages: [GetPage(name: '/', page: () => BottomNav())],
            initialRoute: '/',
            initialBinding: StateHolderBinding(),
          );
        });
  }
}