import 'package:flutter/material.dart';

import '../../../data/app_image.dart';

AppBar buildAppBar() => AppBar(
  actions: [
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Image.asset(AppImage.appLogo),
    ),
  ],
);