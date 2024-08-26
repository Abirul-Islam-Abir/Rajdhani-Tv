import 'package:flutter/material.dart';
import 'package:glassmorphism_kit/glassmorphism_kit.dart';

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
      child: GlassContainer(
        height: 500,
        width: width,
      alignment: Alignment.centerLeft,
      
        color: Colors.white,
        colorOpacity: 0.1,
        blurStrengthX: 10,
        blurStrengthY: 10,
        borderRadius: BorderRadius.all(
                Radius.circular(15,),),
        child: Column(
          children: [  const SizedBox(
              height: 10
            ),
            SizedBox(
              height: 100,
              width: 100,
              child: Image.asset(AppImage.appLogo),
            ),
            const SizedBox(
              height: 10
            ),
         Align(alignment: Alignment.centerLeft,
              child: Padding(
       padding: const EdgeInsets.only(left: 30.0),
                child: Text(
                  month,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
              ),
            ),  const SizedBox(
              height: 10
            ),
          Align(alignment: Alignment.centerLeft,
              child: Padding(
               padding: const EdgeInsets.only(left: 30.0),
                child: Text(
                  '$price৳',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 60,
                  ),
                ),
              ),
            ),  const SizedBox(
              height: 10
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Divider(height: 2,color: Colors.white,),
            ),
            Align(alignment: Alignment.centerLeft,
              child: Padding(
                       padding: const EdgeInsets.only(left: 30.0),
                child: const Text(
                  '○ All Content Access',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
              Align(alignment: Alignment.centerLeft,
              child: Padding(
               padding: const EdgeInsets.only(left: 30.0),
                child: const Text(
                  '○ Live Support',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    fontSize: 25,
                  ),textAlign: TextAlign.start,
                ),
              ),
            ),
            const SizedBox(
              height: 20
            ),
            MaterialButton(minWidth: 200,height: 50,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              color: kPrimaryColor,
              onPressed: subscribeOnTap,
              child: const Text(
                'Subscribe Now!',
                style: TextStyle(color: Colors.white),
              ),
            ),const SizedBox(
              height: 10
            ),
          ],
        ),
      ),
    );
  }
}
