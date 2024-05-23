import 'package:flutter/material.dart';

import '../../../data/constant.dart';

class VideosButton extends StatelessWidget {
  final Function() tap;
  final String text;

  const VideosButton({super.key, required this.tap, required this.text});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: tap,
        child: Container(
          height: 40,
          width: width,
          decoration: BoxDecoration(
            color: kSecondary,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Center(
              child: Text(text,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold))),
        ),
      ),
    );
  }
}