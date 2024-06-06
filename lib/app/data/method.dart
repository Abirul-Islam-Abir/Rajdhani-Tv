import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showExitDialog() async {
  bool? exitConfirmed = await Get.dialog<bool>(
    const ExitDialog(),
    barrierDismissible: false,
  );

  if (exitConfirmed ?? false) {
    exit(0);
  }
}

class ExitDialog extends StatelessWidget {
  const ExitDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Are you sure?'),
      content: const Text('Are you sure you want to exit the application?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('Exit'),
        ),
      ],
    );
  }
}
