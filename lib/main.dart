import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/data/constant.dart';
import 'app/modules/home_screen/component/archive_premium_btn.dart';
import 'app/modules/home_screen/component/videos_btn.dart';
import 'app/modules/widgets/secondary_btn.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const RajdhaniTv());
}

class RajdhaniTv extends StatelessWidget {
  const RajdhaniTv({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Rajdhani Tv',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
        ),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(drawer: Drawer(),
      appBar: AppBar(
        actions: [ Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Image.asset('assets/icon/rajdhani_logo.png'),
        ),],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Container(
                height: 250,
                width: width,
                child: Image.asset(
                  'assets/images/news.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ArchiveAndPremiumButton(
              archive: () {},
              premium: () {},
              archiveTxt: 'Archives',
              premiumTxt: 'Premium',
            ),
            videosButton(
              text: 'Videos',
              tap: () {},
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      height: 160,
                      width: width / 1.0,
                      child: Image.asset(
                        'assets/images/news.jpg',
                        fit: BoxFit.cover,
                      )),
                ),
                Positioned(
                  top: 0,
                  left: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 50,
                          width: 50,
                          child: Image.asset('assets/icon/Icon.png')),
                      Text('Rahjdhani tv news app',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal)),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          ))
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
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Icon(
                          Icons.arrow_left,
                          color: Colors.white,
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/svg/youtube.svg',
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Icon(
                          Icons.arrow_right,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SecondaryButton(
              text: 'All Videos',
              onTap: () {},
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0, bottom: 5),
              child: SizedBox(
                  height: 70,
                  width: 70,
                  child: Image.asset(
                    'assets/icon/rajdhani_logo.png',
                    fit: BoxFit.cover,
                  )),
            ),
            Text('About Us'),
            Text('Privacy Policy'),
            Text('Terms'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleButton(
                  imageLogo: 'assets/icon/facebook.png',
                  color: Colors.pink,
                ),
                CircleButton(
                  imageLogo: 'assets/icon/instagram.png',
                  color: Colors.brown,
                ),
                CircleButton(
                    imageLogo: 'assets/icon/youtube.png', color: Colors.grey),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                'Download Now',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  const CircleButton({
    super.key,
    required this.imageLogo,
    required this.color,
  });

  final String imageLogo;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: CircleAvatar(
        radius: 20,
        backgroundColor: color,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.asset(imageLogo),
        ),
      ),
    );
  }
}