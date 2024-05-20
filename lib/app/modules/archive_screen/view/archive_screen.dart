import 'package:flutter/material.dart';
import 'package:untitled/app/modules/home_screen/component/all_details.dart';
import 'package:untitled/app/modules/widgets/primary_btn.dart';

import '../../../api_services/api_services.dart';
import '../../../data/constant.dart';
import '../../home_screen/component/suggested_video.dart';
import '../../packages_screen/view/packages_screen.dart';

class ArchiveScreen extends StatelessWidget {
  const ArchiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Headline(
              text: 'NEWS',
            ),
            SuggestedVideos(title: 'title',videoUrl: ApiServices.youtubeBase+'Gbsn-hyeZqs',),
            PrimaryButton(
              text: 'All Videos',
              onTap: () {},
            ),
            Headline(
              text: 'NATOK',
            ),
            SuggestedVideos(title: 'title',videoUrl: ApiServices.youtubeBase+'Gbsn-hyeZqs',),
            PrimaryButton(
              text: 'All Videos',
              onTap: () {},
            ),
            Headline(
              text: 'TALK SHOW',
            ),
            SuggestedVideos(title: 'title',videoUrl: ApiServices.youtubeBase+'Gbsn-hyeZqs',),
            PrimaryButton(
              text: 'All Videos',
              onTap: () {},
            ),
            Headline(
              text: 'ENTERTAINMENT',
            ),
          SuggestedVideos(title: 'title',videoUrl: ApiServices.youtubeBase+'Gbsn-hyeZqs',),
            PrimaryButton(
              text: 'All Videos',
              onTap: () {},
            ),
            SizedBox(height: 50),
            AllDetails()
          ],
        ),
      ),
    );
  }
}

class Headline extends StatelessWidget {
  const Headline({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: kPrimaryColor,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}