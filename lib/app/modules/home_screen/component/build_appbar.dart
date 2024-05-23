import 'package:flutter/material.dart';

import '../../../../main.dart';
import '../../../data/app_image.dart';

AppBar buildAppBar() {
  return AppBar(
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Image.asset(darkNotifier.value ?AppImage.appLogoLight: AppImage.appLogo ),
      ),
    ],
  );
}
