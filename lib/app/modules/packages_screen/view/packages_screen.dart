import 'package:flutter/material.dart';
import 'package:untitled/app/data/constant.dart';
import 'package:untitled/app/modules/home_screen/component/all_details.dart';

import '../../../data/app_image.dart';
import '../component/packages_card.dart';

class PackagesScreen extends StatelessWidget {
  PackagesScreen({super.key});

  List data = [
    {
      'color': [Colors.blue, Colors.green],
      'price': 150,
      'month': '6 Month',
    },
    {
      'color': [Colors.deepOrangeAccent, Colors.limeAccent],
      'price': 350,
      'month': '1 Month',
    },
    {
      'color': [Colors.blue, Colors.red],
      'price': 500,
      'month': '1 Year',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Image.asset(AppImage.appLogo),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PackagesHeadline(
              text: 'Our Packages',
            ),
            ...List.generate(
                data.length,
                (index) => SubscriptionCard(
                      gradientColors: data[index]['color'],
                      onTap: () {},
                      month: data[index]['month'],
                      price: data[index]['price'],
                    )),
            AllDetails()
          ],
        ),
      ),
    );
  }
}

class PackagesHeadline extends StatelessWidget {
  const PackagesHeadline({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}