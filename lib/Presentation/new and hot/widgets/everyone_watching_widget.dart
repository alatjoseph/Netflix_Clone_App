import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/Presentation/homepage/widgets/main_button.dart';
import 'package:netflix/Presentation/new%20and%20hot/widgets/video_widget.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/domain/entities/new&hot/everonewaching_entity.dart';

class EveryoneWatchingWidget extends StatelessWidget {
  List<EveryonewachingEntity> everyonewatchingdata;
  EveryoneWatchingWidget({super.key, required this.everyonewatchingdata});

  @override
  Widget build(BuildContext context) {
  
    Size size = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: ListView(
          children: List.generate(
            everyonewatchingdata.length,
            (index) {
              return Column(
                children: [
                  SizedBox(
                    height: size.height / 1.59,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        kheight,
                        Text(everyonewatchingdata[index].title,
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)),
                        kheight,
                        Text(everyonewatchingdata[index].overview,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 15,
                                color: greyclr,
                                fontWeight: FontWeight.bold)),
                        kheight,
                        Expanded(
                          child: VideoWidget(
                            size: size,
                            imageurl: everyonewatchingdata[index].backdrop_path,
                          ),
                        ),
                        kheight20,
                        const Padding(
                          padding: EdgeInsets.only(right: 8,bottom: 14),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Mainbottomicon(
                                icon: CupertinoIcons.paperplane,
                                name: 'Share',
                              ),
                              kwidth,
                              Mainbottomicon(
                                icon: Icons.add,
                                name: 'My List',
                              ),
                              kwidth,
                              Mainbottomicon(
                                icon: CupertinoIcons.play_fill,
                                name: 'Play',
                              ),
                              kwidth,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ));
  }
}
