import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../api_services/api_services.dart';
import '../../../model/all_videos_model.dart';
import '../../home_screen/component/build_appbar.dart';
import '../../home_screen/component/get_thumbnail_image.dart';
import '../../widgets/video_player.dart';
import '../../youtube_embed_play_screen/view/youtube_embed_play_screen.dart';

class AllVideoScreen extends StatefulWidget {
  final List<EmbedCodes> list;

  const AllVideoScreen({super.key, required this.list});

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
          appBar: buildAppBar(),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: widget.list.length,
                  itemBuilder: (context, index) {
                    final video = widget.list[index];
                    final embedCode = video.embed!;
                    var url =
                        getThumbnailUrl(ApiServices.youtubeBase + embedCode);
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: InkWell(
                          onTap: () {
                            Get.to(() =>
                                YouTubePlayerScreen(url: embedCode.toString(),title: widget.list[index].title??'',));
                          },
                          child: Stack(
                            children: [
                              Image.network(url),
                              Positioned(
                                  top: 50,
                                  bottom: 50,
                                  right: 50,
                                  left: 50,
                                  child:
                                      Image.asset('assets/icon/youtube.png')),
                                       Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                  widget.list[index].title??'',
                    style: const TextStyle(
                      fontSize: 24,color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
               
                const SizedBox(height: 10),
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
