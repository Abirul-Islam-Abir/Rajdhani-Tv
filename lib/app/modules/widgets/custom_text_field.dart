import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.pad = 15, this.controller,
  });

  final String hint;
  final double pad;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            filled: true, hintText: hint, contentPadding: EdgeInsets.all(pad)),
      ),
    );
  }
}
