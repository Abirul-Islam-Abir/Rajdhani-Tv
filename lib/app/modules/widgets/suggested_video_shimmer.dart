import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

import '../home_screen/component/suggested_video.dart';

class SuggestedVideoShimmer extends StatelessWidget {
  const SuggestedVideoShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,width: double.infinity,
      child: Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.white,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: SizedBox(
              height: 200,width: double.infinity,
              child: Image.asset('assets/images/news.jpg',
                  fit: BoxFit.cover),
            ),
          ),
        )
      ),
    );
  }
}
