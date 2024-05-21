import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../data/constant.dart';

class SuggestedVideos extends StatelessWidget {
  const SuggestedVideos({
    super.key,
    required this.videoUrl,
    required this.title,
    this.onTap,
  });
  final String videoUrl, title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    var url = getThumbnailUrl(videoUrl);
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: SizedBox(
                height: 200,
                width: width,
                child: Image.network(url,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        Icon(Icons.error)),
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
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.normal)),
                /* IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ))*/
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
                Container(
                  height: 40,
                  width: 40,
                  /*
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Icon(
                    Icons.arrow_left,
                    color: Colors.white,
                  ),*/
                ),
                SvgPicture.asset(
                  'assets/svg/youtube.svg',
                ),
                Container(
                  height: 40,
                  width: 40,
                  /*  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Icon(
                    Icons.arrow_right,
                    color: Colors.white,
                  ),*/
                ),
              ],
            ),
          ),
          /*Positioned(
            bottom: 0,
            right: 30,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {
                },
                icon: Icon(
                  Icons.fullscreen_rounded,
                  size: 35,
                  color: Colors.white,
                ),
              ),
            ),
          )*/
        ],
      ),
    );
  }
}

String getThumbnailUrl(videoUrl) {
  // Extract the video ID from the URL
  final uri = Uri.parse(videoUrl);
  String? videoId;

  if (uri.host.contains('youtube.com')) {
    videoId = uri.queryParameters['v'];
  } else if (uri.host.contains('youtu.be')) {
    videoId = uri.pathSegments.first;
  }

  if (videoId == null) {
    throw Exception('Invalid YouTube URL');
  }

  // Construct the thumbnail URL
  return 'https://img.youtube.com/vi/$videoId/hqdefault.jpg';
}
