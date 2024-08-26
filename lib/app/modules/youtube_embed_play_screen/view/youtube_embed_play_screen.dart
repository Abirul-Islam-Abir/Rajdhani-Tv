import 'package:flutter/material.dart';
import 'package:untitled/app/modules/home_screen/component/build_appbar.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../widgets/video_player.dart';

class YouTubePlayerScreen extends StatefulWidget {
  final String url;
 final String? title;
  const YouTubePlayerScreen({super.key, required this.url, this.title});

  @override
  _YouTubePlayerScreenState createState() => _YouTubePlayerScreenState();
}

class _YouTubePlayerScreenState extends State<YouTubePlayerScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.url, // Replace with your video ID
      flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
          hideControls: false,
          controlsVisibleAtStart: false,
          showLiveFullscreenButton: false),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        setPortraitMode();
        return true;
      },
      child: SafeArea(
        child: Scaffold(
         // appBar: buildAppBar(),
          body: SingleChildScrollView(physics: NeverScrollableScrollPhysics(),
            child: Column(mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
            
              children: [
                YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: false,
                  progressIndicatorColor: Colors.blueAccent,
                ),
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.title??'',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
               
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
