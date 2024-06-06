import 'package:flutter/material.dart';

import '../../../data/constant.dart';

class Certification extends StatelessWidget {
  const Certification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      color: kPrimaryColor,
      height: 100,
      width: width,
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Rajdhani Television is Approved by the Government of People’s Republic of Bangladesh.',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Copyright 2024',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(width: 10),
                Text(
                  'All rights reserved.',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
