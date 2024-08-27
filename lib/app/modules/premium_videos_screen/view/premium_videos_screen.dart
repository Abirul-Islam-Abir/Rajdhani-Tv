import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled/app/api_services/api_services.dart';
import 'package:untitled/app/data/subscribed_value_change.dart';
import 'package:untitled/app/modules/home_screen/controller/home_controller.dart';
import 'package:untitled/app/modules/premium_screen/controller/premium_screen_controller.dart';
import 'package:untitled/app/modules/premium_videos_screen/controller/premium_screen_controller.dart';
import 'package:untitled/app/modules/widgets/video_player.dart';
import 'package:video_player/video_player.dart';

class PremiumVideosScreen extends StatelessWidget {
  PremiumVideosScreen({
    super.key,
  });
  final controller = Get.put(PremiumVideosController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Expanded(
      child: ListView.builder(
        itemCount: controller.premiumVideo.length,
        itemBuilder: (context, index) {
          controller.videoPlayerController(
             'https://'+ '${controller.premiumVideo[index].srcLink}' ??
                  'https://rajdhani.tv/videos/219862_small.mp4');
          return GetBuilder<PremiumVideosController>( 
            builder: (controller) {
              return Stack(
                children: [ 
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                        child: Container(
                            height: 200,
                            width: double.infinity,
                            color: Colors.black,
                            child: VideoPlays()),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          controller.premiumVideo[index].title ?? '',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ), Positioned(
                  top: 20,
                  right: 20,
                  child: isSubscribed?Container(): Lottie.asset('assets/images/prem.json',height: 40,width: 40),
                ),
                ],
              );
            },
          );
        },
      ),
    ));
  }
}
