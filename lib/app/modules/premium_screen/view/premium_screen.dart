import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app/modules/contact_screen/view/contact_screen.dart';
import 'package:untitled/app/modules/packages_screen/view/packages_screen.dart';
import 'package:untitled/app/routes/app_routes.dart';

import '../../../../main.dart';
import '../../../data/constant.dart';
import '../../home_screen/component/all_details.dart';
import '../../widgets/custom_text_field.dart';

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({super.key});

  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height / 1.5,
            width: double.infinity,
            decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(0.90),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomTextField(
                  hint: 'User Name',
                ),
                const CustomTextField(
                  hint: 'Password',
                ),
                CheckboxListTile(
                  checkColor: Colors.white,
                  title: const Text('Remember me',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: isChecked,
                  onChanged: (value) {
                    isChecked = !isChecked;
                    setState(() {});
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    height: 60,
                    width: double.infinity,
                    child: const Center(
                      child: Text('Submit',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('Don\'t have subscription?',
                        style: TextStyle(color: Colors.white)),
                    InkWell(
                      onTap: () {
                        Get.toNamed(RouteName.packageScreen);
                      },
                      child: const Text(
                        'Subscribe now!',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}