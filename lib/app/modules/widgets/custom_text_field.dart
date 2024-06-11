import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.pad = 15,
    this.controller,
    this.validator,
    this.maxLines = 1,
  });

  final String hint;
  final double pad;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        maxLines: maxLines,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
            filled: true, hintText: hint, contentPadding: EdgeInsets.all(pad)),
      ),
    );
  }
}
