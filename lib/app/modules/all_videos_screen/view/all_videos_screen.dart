import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../api_services/api_services.dart';
import '../../../model/all_videos_model.dart';
import '../../home_screen/component/suggested_video.dart';
import '../../widgets/video_player.dart';
import '../../youtube_embed_play_screen/view/youtube_embed_play_screen.dart';

class AllVideoScreen extends StatefulWidget {
  final List<AllVideosModel> list;

  AllVideoScreen({super.key, required this.list});

  @override
  _AllVideoScreenState createState() => _AllVideoScreenState();
}

class _AllVideoScreenState extends State<AllVideoScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
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
          body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.list.length,
              itemBuilder: (context, index) {
                final video = widget.list[index];
                final embedCode = video.embedCodes?.isNotEmpty ?? false
                    ? video.embedCodes![0].embed
                    : '';
                var url = getThumbnailUrl(ApiServices.youtubeBase + '$embedCode');
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: InkWell(
                      onTap: () {
                        Get.to(() =>
                            YouTubePlayerScreen(url: embedCode.toString()));
                      },
                      child: Stack(
                        children: [

                          Image.network('$url'), Positioned(

                              top: 50,bottom: 50,right: 50,left: 50,
                              child: Image.asset('assets/icon/youtube.png')),
                        ],
                      )),
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}