import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../widgets/video_player.dart';

class YouTubePlayerScreen extends StatefulWidget {
  final String url;

  const YouTubePlayerScreen({super.key, required this.url});

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
      flags: YoutubePlayerFlags(
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
      child: Scaffold(
        body: Center(
          child: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: false,
            progressIndicatorColor: Colors.blueAccent,
          ),
        ),
      ),
    );
  }
}
