import 'package:flutter/material.dart';
import 'package:upgrader/upgrader.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdateAvailable extends StatelessWidget {
  const UpdateAvailable(
      {super.key,
        required this.child,
        required this.isUpdate,
        this.packageName});

  final Widget child;
  final bool isUpdate;
  final String? packageName;

  void launchPlayStore() async {
    String playStoreUrl = 'https://play.google.com/store/apps/details?id=$packageName';
    final uri = Uri.parse(playStoreUrl);
    await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    return UpgradeAlert(
      shouldPopScope: () {
        return false;
      },
      onUpdate: () {
        launchPlayStore();
        return true;
      },
      upgrader: Upgrader(
        debugDisplayAlways: isUpdate,
        debugLogging: true,
        debugDisplayOnce: false,
        durationUntilAlertAgain: const Duration(seconds: 5),
        countryCode: '+880',
      ),
      child: child,
    );
  }
}
