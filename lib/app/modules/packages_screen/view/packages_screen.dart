import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app/data/constant.dart';
import 'package:untitled/app/modules/home_screen/component/all_details.dart';

import '../../../data/app_image.dart';
import '../../../dummy_data/subscription_data.dart';
import '../component/package_headline.dart';
import '../component/packages_card.dart';
import '../controller/package_screen_controller.dart';

class PackagesScreen extends StatelessWidget {
  const PackagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            PackagesHeadline(text: 'Our Packages'),
            GetBuilder<PackagesScreenController>(
              builder: (controller) => Column(
                children: List.generate(
                  controller.data.length,
                  (index) => SubscriptionCard(
                      gradientColors: subscriptionData[index]['color'],
                      onTap: () {},
                      month: '${controller.data[index].packageName}',
                      price: controller.data[index].price!),
                ),
              ),
            ),
            AllDetails()
          ],
        ),
      ),
    );
  }
}