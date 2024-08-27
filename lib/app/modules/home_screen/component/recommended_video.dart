import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart'; 

import 'get_thumbnail_image.dart';

class RecommendedVideo extends StatelessWidget {
  const RecommendedVideo({
    super.key,
    required this.videoUrl,
    required this.title,
    this.onTap, 
    this.fit = BoxFit.cover,
    this.height = 180,
  });

  final String videoUrl, title;
  final Function()? onTap;
  final BoxFit fit;
  final double height;

  @override
  Widget build(BuildContext context) {
    var url = getThumbnailUrl(videoUrl);
    final width = MediaQuery
        .of(context)
        .size
        .width;
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Ensure left alignment
        children: [  
          Stack(
            children: [
              Center(
                child: SizedBox(
                  height: height,
                  width: width,
                  child: Image.network(url,
                      fit: fit,
                      errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.error)),
                ),
              ),
              Positioned(
                top: 0,
                left: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 50,
                        width: 50,
                        child: Image.asset('assets/icon/Icon.png')),
                    Text(title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal)),
                  ],
                ),
              ),  
              Positioned(
                top: 50,
                left: 0,
                right: 0,
                bottom: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 40,
                      width: 40,
                    ),
                    SvgPicture.asset(
                        'assets/svg/youtube.svg'
                    ), 
                    const SizedBox(
                      height: 40,
                      width: 40,
                    ),
                  ],
                ),
              ),
            ],
          ), 
        ],
      ),
    );
  }
}
