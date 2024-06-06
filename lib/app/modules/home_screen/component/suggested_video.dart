import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../archive_screen/view/archive_screen.dart';
import '../../widgets/headline_title.dart';

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
                      const SizedBox(
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
                      const SizedBox(
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

class RecommendedVideo extends StatelessWidget {
  const RecommendedVideo({
    super.key,
    required this.videoUrl,
    required this.title,
    this.onTap,
    this.text = '',
    this.fit = BoxFit.cover,
    this.height = 180,
  });

  final String videoUrl, title, text;
  final Function()? onTap;
  final BoxFit fit;
  final double height;

  @override
  Widget build(BuildContext context) {
    var url = getThumbnailUrl(videoUrl);
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Ensure left alignment
        children: [
          const SizedBox(height: 12),
          HeadlineTitle(text: text),
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
          const SizedBox(height: 12),
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
