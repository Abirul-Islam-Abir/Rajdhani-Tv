import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app/modules/create_account_screen/view/create_account_screen.dart';
import 'package:untitled/app/modules/home_screen/component/all_details.dart';

import '../../../data/app_image.dart';
import '../../../dummy_data/subscription_data.dart';
import '../component/package_headline.dart';
import '../component/packages_card.dart';
import '../controller/package_screen_controller.dart';
import 'package:intl/intl.dart';

class PackagesScreen extends StatelessWidget {
  PackagesScreen({super.key});
  final controller = Get.put(PackagesScreenController());
String duration (day){
    DateTime currentDate = DateTime.now();
    DateTime nextDate = currentDate.add(Duration(days: day));
    String formattedNextDate = DateFormat('yyyy-MM-dd').format(nextDate);
    return formattedNextDate;
  }
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
              builder: (controller) => controller.isLoading
                  ? SizedBox(
                      height: 300,
                      child: Center(child: const CircularProgressIndicator()))
                  : Column(
                      children: List.generate(
                        controller.data.length,
                        (index) {
                          final color = subscriptionData[index]['color'];
                          final name = controller.data[index].packageName;
                          final price = controller.data[index].price;
                          final packageId = controller.data[index].id;
final days = controller.data[index].duration;
                          return SubscriptionCard(
                            gradientColors: color,
                            month: '$name',
                            price: price!,
                            subscribeOnTap: () { 
                              final day = duration (days);
                              Get.to(() => CreateAccountScreen(
                                  packageId: packageId!, price: price,duration: day , ));
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
