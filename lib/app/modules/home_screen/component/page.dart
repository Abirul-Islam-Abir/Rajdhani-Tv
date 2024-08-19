import 'package:flutter/material.dart';

import '../../archive_screen/view/archive_screen.dart';
import '../../premium_screen/view/premium_screen.dart';
import '../view/home_screen.dart';

List<Widget> pages = [
  HomeScreen(),
  const ArchiveScreen(),
  PremiumVideosScreen(),
  const PremiumScreen(),
];

class PremiumVideosScreen extends StatelessWidget {
  const PremiumVideosScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:Column(children: [
      Text('hello wolrd')
    ],),);
  }
}
