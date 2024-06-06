import 'package:get/get.dart';
import 'package:untitled/app/modules/home_screen/view/home_screen.dart';
import 'package:untitled/app/modules/splash_screen/view/splash_screen.dart';

import '../modules/bottom_nav_bar/view/bottom_nav.dart';
import '../modules/packages_screen/view/packages_screen.dart';
import 'app_routes.dart';

List<GetPage<dynamic>> getPages() => [
      GetPage(
        name: RouteName.initial,
        page: () => const SplashScreen(),
      ),
      GetPage(
        name: RouteName.bottomNav,
        page: () => BottomNav(),
      ),
      GetPage(
        name: RouteName.packageScreen,
        page: () => const PackagesScreen(),
      ),
      GetPage(
        name: RouteName.bottomNav,
        page: () => BottomNav(),
      ),
      GetPage(
        name: RouteName.homeScreen,
        page: () => HomeScreen(),
      ),
    ];
