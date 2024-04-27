import 'package:flutter/material.dart';

class MultiPlatformButton extends StatelessWidget {
  const MultiPlatformButton({
    super.key,
    required this.google,
    required this.apple,
    required this.windows,
  });

  final Function() google, apple, windows;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: google,
          child: SizedBox(
              height: 45,
              width: 150,
              child: Image.asset(
                'assets/images/google.png',
                fit: BoxFit.cover,
              )),
        ),
        InkWell(
          onTap: apple,
          child: SizedBox(
              height: 45,
              width: 150,
              child: Image.asset(
                'assets/images/apple.png',
                fit: BoxFit.cover,
              )),
        ),
        InkWell(
          onTap: windows,
          child: SizedBox(
              height: 45,
              width: 150,
              child: Image.asset(
                'assets/images/windows.png',
                fit: BoxFit.cover,
              )),
        ),
      ],
    );
  }
}