import 'package:flutter/material.dart';

import '../../archive_screen/view/archive_screen.dart';
import '../../premium_screen/view/premium_screen.dart';
import '../view/home_screen.dart';

List<Widget> pages = [
  HomeScreen(),
  const ArchiveScreen(),
  const PremiumScreen(),
];
