import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            const PackagesHeadline(text: 'Our Packages'),
            GetBuilder<PackagesScreenController>(
              builder: (controller) => Column(
                children: List.generate(
                  controller.data.length,
                  (index) {
                    final color = subscriptionData[index]['color'];
                    final name = controller.data[index].packageName;
                    final price = controller.data[index].price!;
                    final packageId = controller.data[index].id;

                    return SubscriptionCard(
                      gradientColors: color,
                      month: '$name',
                      price: price,
                      subscribeOnTap: () {
                        //TODO: Add subscription logic
                        controller.sslCommerzGeneralCall(price, packageId!);
                        // log(controller.generateTranId().toString());
                        // Get.to(() => CreateAccountScreen());
                      },
                    );
                  },
                ),
              ),
            ),
            const AllDetails()
          ],
        ),
      ),
    );
  }
}
