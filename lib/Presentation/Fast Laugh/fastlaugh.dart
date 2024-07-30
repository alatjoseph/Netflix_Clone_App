import 'package:flutter/material.dart';
import 'package:netflix/Presentation/Fast%20Laugh/widgets/videoscreen.dart';

class FastLaugh extends StatelessWidget {
  const FastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: PageView(
        scrollDirection: Axis.vertical,
        children: List.generate(
          20,
          (index) {
            return Videoscreen(
              index: index,
            );
          },
        ),
      )),
    );
  }
}
