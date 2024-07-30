import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';


class Tabbar extends StatelessWidget {
  const Tabbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: kblack,
      labelStyle:
          const TextStyle(fontSize: 17,fontWeight: FontWeight.bold ),
      unselectedLabelColor: kwhite,
      isScrollable: true,
      tabAlignment: TabAlignment.start ,
      indicator: BoxDecoration(
        shape: BoxShape.rectangle,
        color: kwhite,
        borderRadius: BorderRadius.circular(25),
      ),
      dividerColor: Colors.transparent,
      indicatorWeight: 0.0,
      tabs: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Tab(
            text: '🍿 Comming Soon',
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Tab(
            text: '👀  Everyone\'s Watching',
          ),
        )
      ],
    );
  }
}
