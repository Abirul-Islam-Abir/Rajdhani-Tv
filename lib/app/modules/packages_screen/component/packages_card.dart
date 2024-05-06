import 'package:flutter/material.dart';

import '../../../data/app_image.dart';
import '../../../data/constant.dart';

class SubscriptionCard extends StatelessWidget {
  const SubscriptionCard({
    Key? key,
    required this.month,
    required this.price,
    required this.onTap,
    this.gradientColors = const [Colors.green, Colors.pink],
  }) : super(key: key);

  final String month;
  final Function() onTap;
  final List<Color> gradientColors;
  final int price;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
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
              offset: Offset(0, 3),
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
            SizedBox(
              height: 30,
            ),
            Text(
              month,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.white,
                fontSize: 40,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
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
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 50,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              '✔ All Content Access',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            Text(
              '✔ Live Support',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              color: kPrimaryColor,
              onPressed: onTap,
              child: Text(
                'Subscribe',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}