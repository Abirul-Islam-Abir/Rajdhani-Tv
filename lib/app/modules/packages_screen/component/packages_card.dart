import 'package:flutter/material.dart';

import '../../../data/app_image.dart';
import '../../../data/constant.dart';

class SubscriptionCard extends StatelessWidget {
  const SubscriptionCard({
    super.key,
    required this.month,
    required this.price,
    required this.subscribeOnTap,
    this.gradientColors = const [Colors.green, Colors.pink],
  });

  final String month;
  final Function() subscribeOnTap;
  final List<Color> gradientColors;
  final int price;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Container(
        height: 500,
        width: width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.red.withOpacity(0.5),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
          color: Colors.red,
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: gradientColors,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: Image.asset(AppImage.appLogo),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              month,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.white,
                fontSize: 40,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'BDT.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 50,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Text(
                    '$price৳',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 50,
                    ),
                  ),
                ),
              ],
            ),
            const Text(
              '✔ All Content Access',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            const Text(
              '✔ Live Support',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              color: kPrimaryColor,
              onPressed: subscribeOnTap,
              child: const Text(
                'Subscribe Now!',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
