
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

// ignore: must_be_immutable
class Videoscreen extends StatelessWidget {
  Videoscreen({super.key, required this.index});
  int index;
  @override
  Widget build(BuildContext context) {
    const videourl = 'https://www.youtube.com/watch?v=RY5aH21ohU4';
    return const Stack(
      children: [
        //Videoplayer(onStateChanged:(bool){} ,videoUrl: videourl,),
        Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.black45,
                      child: Icon(
                        Icons.volume_mute,
                        color: kwhite,
                        size: 40,
                      )),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundImage: NetworkImage(
                            'https://image.tmdb.org/t/p/w600_and_h900_bestv2/j886YEkIUsiImY53px5VHKD4lRa.jpg'),
                      ),
                      kheight,
                      VideoScreenItems(
                        icon: Icons.emoji_emotions,
                        title: 'LOL',
                      ),
                      VideoScreenItems(
                        icon: Icons.add,
                        title: 'My List',
                      ),
                      VideoScreenItems(
                        icon: CupertinoIcons.paperplane,
                        title: 'Share',
                      ),
                      VideoScreenItems(
                        icon: Icons.play_arrow,
                        title: 'Play',
                      ),
                    ],
                  )
                ],
              ),
            )),
      ],
    );
  }
}

class VideoScreenItems extends StatelessWidget {
  const VideoScreenItems({
    super.key,
    required this.title,
    required this.icon,
  });
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: kwhite,
            size: 30,
          ),
          kheight,
          Text(title)
        ],
      ),
    );
  }
}
