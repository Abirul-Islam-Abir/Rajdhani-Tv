import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../data/constant.dart';

class SuggestedVideos extends StatelessWidget {
  const SuggestedVideos({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                height: 200,
                width: width / 1.2,
                child: Image.asset(
                  'assets/images/news.jpg',
                  fit: BoxFit.cover,
                )),
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
              Text('Rahjdhani tv news app',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.normal)),
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
        ), Positioned(
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
        )
      ],
    );
  }
}