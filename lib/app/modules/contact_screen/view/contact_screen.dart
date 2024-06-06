import 'package:flutter/material.dart';

import '../../../../main.dart';
import '../../../data/app_image.dart';
import '../../../data/constant.dart';
import '../../home_screen/component/rajdhani_logo.dart';
import '../../widgets/custom_text_field.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = darkNotifier.value;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: const Text('Contact'),
        centerTitle: true,
        actions: [RajdhaniLogo(img: AppImage.appLogo)],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height / 1.5,
            width: double.infinity,
            decoration: BoxDecoration(
              color: isDark ? null : kPrimaryColor.withOpacity(0.90),
              borderRadius: BorderRadius.circular(20),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomTextField(
                    hint: 'Name',
                  ),
                  const CustomTextField(
                    hint: 'Email',
                  ),
                  const CustomTextField(
                    hint: 'Subject',
                  ),
                  const CustomTextField(
                    hint: 'Message',
                    pad: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: isDark ? kPrimaryColor : Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      height: 60,
                      width: double.infinity,
                      child: const Center(
                        child: Text('Send',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
