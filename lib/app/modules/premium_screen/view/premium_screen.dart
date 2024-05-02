import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app/modules/Subcribe_screen/view/Subcribe_screen.dart';

import '../../home_screen/component/AllDetails.dart';
import '../component/RememberMeCheckBox.dart';
import '../component/Subscribe_button.dart';
import '../component/loginText.dart';
import '../component/slider_degin.dart';
import '../component/submitButton.dart';
import '../component/textfield.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 1.2,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 1.7,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white70,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3), // Offset
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          const side_degisn(
                            top: -65,
                            left: -20,
                            angle: -1 * (2.35),
                            color: Colors.pinkAccent,
                          ),
                          side_degisn(
                            top: -65,
                            right: -20,
                            angle: -1 * (7.1),
                            color: Colors.blue.shade500,
                          ),
                          const side_degisn(
                            bottom: -65,
                            right: -20,
                            angle: -1 * (2.35),
                            color: Colors.purpleAccent,
                          ),
                          const side_degisn(
                            bottom: -65,
                            left: -20,
                            angle: -1 * (3.95),
                            color: Colors.orange,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 25,
                                ),
                                loginText(),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height / 2.4,
                                  width: MediaQuery.of(context).size.width / 2,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    children: [
                                      const textfield(
                                        controller: null,
                                        labelText: 'Username',
                                      ),
                                      const textfield(
                                        controller: null,
                                        labelText: 'password',
                                      ),
                                      RememberMeCheckbox(
                                        initialValue: isChecked,
                                        onChanged: (bool newValue) {
                                          setState(() {
                                            isChecked = newValue;
                                          });
                                        },
                                      ),
                                      submitButton(
                                        onPressed: () {},
                                      ),
                                      Subscribe_button(
                                        onTap: () {
                                          Get.to(Subscribe_Screen());
                                        },
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const AllDetails()
          ],
        ),
      ),
    );
  }
}
