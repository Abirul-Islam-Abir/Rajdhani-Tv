import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:untitled/app/data/app_image.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'app/data/constant.dart';
import 'app/modules/home_screen/component/archive_premium_btn.dart';
import 'app/modules/home_screen/component/cerfication.dart';
import 'app/modules/home_screen/component/download_btn.dart';
import 'app/modules/home_screen/component/multi_platform_btn.dart';
import 'app/modules/home_screen/component/primary_text.dart';
import 'app/modules/home_screen/component/rajdhani_logo.dart';
import 'app/modules/home_screen/component/social_btn.dart';
import 'app/modules/home_screen/component/suggested_video.dart';
import 'app/modules/home_screen/component/videos_btn.dart';
import 'app/modules/widgets/responsive.dart';
import 'app/modules/widgets/secondary_btn.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import 'app/modules/widgets/video_player.dart';

void main() {
  runApp(const RajdhaniTv());
}

class RajdhaniTv extends StatelessWidget {
  const RajdhaniTv({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        title: 'Rajdhani Tv',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
          brightness: Brightness.light,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5))),
          ),
        ),
        themeMode: ThemeMode.system,
        home: HomeScreen(),
      );
    });
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController controller = ScrollController();
  late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;

  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

  final List<String> _ids = [
    'nPt8bK2gbaU',
    'gQDByCdjUXw',
    'iLnmTe5Q2Qw',
    '_WoCV4c6XOE',
    'KmzdUe0RSJo',
    '6jZDSSZZxjQ',
    'p2lYr3vM_1w',
    '7QUtEmBT_-w',
    '34_PXCzGw1M',
  ];

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: _ids.first,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return YoutubePlayerBuilder(
        onExitFullScreen: () {
          // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
          SystemChrome.setPreferredOrientations(DeviceOrientation.values);
        },
        player: YoutubePlayer(
          controller: _controller,
          onReady: () {
            _isPlayerReady = true;
          },
          onEnded: (data) {
            _controller
                .load(_ids[(_ids.indexOf(data.videoId) + 1) % _ids.length]);
          },
        ),
        builder: (context, player) => Scaffold(
              drawer: Drawer(),
              appBar: AppBar(
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Image.asset(AppImage.appLogo),
                  ),
                ],
              ),
              body: ListView(
                controller: controller,
                children: [
                  player,
                  SizedBox(height: 10),
                  ArchiveAndPremiumButton(archiveTap: () {}, premiumTap: () {}),
                  SizedBox(height: 10),
                  videosButton(text: 'Videos', tap: () {}),
                  SizedBox(height: 10),
                  SuggestedVideos(),
                  SizedBox(height: 10),
                  SecondaryButton(text: 'All Videos', onTap: () {}),
                  RajdhaniLogo(img: AppImage.appLogo),
                  PrimaryText(text: 'About Us', onTap: () {}),
                  PrimaryText(text: 'Privacy Policy', onTap: () {}),
                  PrimaryText(text: 'Terms', onTap: () {}),
                  SizedBox(height: 10),
                  SocialButton(fbTap: () {}, instaTap: () {}, ytTap: () {}),
                  DownloadButton(onTap: () {}, text: 'Download'),
                  MultiPlatformButton(
                      apple: () {}, google: () {}, windows: () {}),
                  SizedBox(height: 10),
                  Certification()
                ],
              ),
            ));
  }
}