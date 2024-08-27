import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import 'app/data/constant.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';
import 'app/state_holder_binder/state_holder_binding.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WakelockPlus.enable();
  runApp(
     
    RajdhaniTv(),
  );
}

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
      builder: (BuildContext context, bool isDark, Widget? child) =>
          GetMaterialApp(
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
        getPages: getPages(),
        initialRoute: RouteName.initial,
        initialBinding: StateHolderBinding(),
      ),
    );
  }
}
