import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
void showExitDialog() async {
  bool? exitConfirmed = await Get.dialog<bool>(
    ExitDialog(),
    barrierDismissible: false,
  );

  if (exitConfirmed ?? false) {
    exit(0);
  }
}
class ExitDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Are you sure?'),
      content: Text('Are you sure you want to exit the application?'),
      actions: [
        TextButton(
          onPressed: () =>Navigator.of(context).pop(false),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text('Exit'),
        ),
      ],
    );
  }
}