import 'package:flutter/material.dart';

class SubscribeButton extends StatelessWidget {
  const SubscribeButton({
    super.key,
    this.tap, required this.title, required this.btnText,
  });

  final Function()? tap;
final String title;
final String btnText;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
          Text(title,
            style: TextStyle(color: Colors.white)),
        InkWell(
          onTap: tap,
          child:   Text(
            btnText,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}