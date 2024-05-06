import 'package:get/get.dart';

import '../modules/bottom_nav_bar/view/bottom_nav.dart';
import '../modules/packages_screen/view/packages_screen.dart';
import 'app_routes.dart';

List<GetPage<dynamic>> getPages() => [
  GetPage(
    name: RouteName.initial,
    page: () => BottomNav(),
  ), GetPage(
    name: RouteName.packageScreen,
    page: () => PackagesScreen(),
  ),
];