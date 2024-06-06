import 'package:flutter/material.dart';

class RememberBox extends StatelessWidget {
  const RememberBox({
    super.key,
    required this.value,
    this.onChanged,
  });

  final bool value;
  final Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      checkColor: Colors.white,
      fillColor: const MaterialStatePropertyAll(Colors.red),
      title: const Text('Remember me',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
      controlAffinity: ListTileControlAffinity.leading,
      value: value,
      onChanged: onChanged,
    );
  }
}
