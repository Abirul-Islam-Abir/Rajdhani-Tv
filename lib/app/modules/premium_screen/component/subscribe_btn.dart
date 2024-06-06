import 'package:flutter/material.dart';

class SubscribeButton extends StatelessWidget {
  const SubscribeButton({
    super.key,
    this.tap,
  });

  final Function()? tap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text('Don\'t have subscription?',
            style: TextStyle(color: Colors.white)),
        InkWell(
          onTap: tap,
          child: const Text(
            'Subscribe now!',
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