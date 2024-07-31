import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/Presentation/homepage/widgets/main_button.dart';
import 'package:netflix/core/constants.dart';

class Idlehome extends StatelessWidget {
  const Idlehome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * .78,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg'),
                  fit: BoxFit.cover)),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Mainbottomicon(
                  icon: Icons.add,
                  name: 'My List',
                ),
                TextButton.icon(
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(kwhite),
                        shape: WidgetStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)))),
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.play_fill,
                      color: Colors.black,
                    ),
                    label: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Play',
                        style: TextStyle(color: Colors.black),
                      ),
                    )),
                const Mainbottomicon(
                  icon: Icons.info,
                  name: 'Info',
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
