import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled/app/data/subscribed_value_change.dart';

import 'get_thumbnail_image.dart';
import 'headline_text.dart';

class SuggestedVideos extends StatelessWidget {
  const SuggestedVideos({
    super.key,
    required this.videoUrl,
    required this.title,
    this.onTap,
    this.text = '',
    this.fit = BoxFit.fill,
    this.height = 200,
  });

  final String videoUrl, title, text;
  final Function()? onTap;
  final BoxFit fit;
  final double height;

  @override
  Widget build(BuildContext context) {
    var url = getThumbnailUrl(videoUrl);
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Stack(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: SizedBox(
                      height: height,
                      width: width,
                      child: Image.network(url,
                          fit: fit,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.error)),
                    ),
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
                top: 5,
                right: 5,
                child:  isSubscribed ? Container(): SizedBox(height:60,width:60,child:  Lottie.asset('assets/images/prem.json',)),
              ) ,
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
                        'assets/svg/youtube.svg',
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
            const SizedBox(
              height: 20,
            ),
            Headline(text: text),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
