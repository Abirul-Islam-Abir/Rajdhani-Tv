import 'package:flutter/material.dart';
import 'package:untitled/app/modules/widgets/primary_btn.dart';

import '../../../data/app_image.dart';
import '../../../data/constant.dart';
import '../../home_screen/component/rajdhani_logo.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: Text('Contact'),
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
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Shadow color
                  spreadRadius: 5, // Spread radius
                  blurRadius: 7, // Blur radius
                  offset: Offset(0, 3), // Offset in x and y direction
                ),
              ],
              color: kPrimaryColor.withOpacity(0.90),
              borderRadius: BorderRadius.circular(20),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextField(
                    hint: 'Name',
                  ),
                  CustomTextField(
                    hint: 'Email',
                  ),
                  CustomTextField(
                    hint: 'Subject',
                  ),
                  CustomTextField(
                    hint: 'Message',
                    pad: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      height: 60,
                      width: double.infinity,
                      child: Center(
                        child: Text('Send',
                            style: TextStyle(fontWeight: FontWeight.bold)),
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

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.pad = 15,
  });

  final String hint;
  final double pad;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: hint, contentPadding: EdgeInsets.all(pad)),
      ),
    );
  }
}