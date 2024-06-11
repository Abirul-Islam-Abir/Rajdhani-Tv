import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/primary_btn.dart';
import '../controller/home_controller.dart';

// ignore: must_be_immutable
class ArchiveAndPremiumButton extends StatelessWidget {
  ArchiveAndPremiumButton({
    super.key,
  });

  List list = ['TV', 'SPORTS', 'ISLAMIC'];

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          list.length,
          (index) => Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetBuilder<HomeScreenController>(builder: (controller) {
                return PrimaryButton(
                  color: controller.select == index ? Colors.red : Colors.grey,
                  onTap: () {
                    controller.tvChange(index);
                  },
                  text: list[index],
                );
              }),
            ),
          ),
        ));
  }
}
