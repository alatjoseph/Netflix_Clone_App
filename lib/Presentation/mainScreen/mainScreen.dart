import 'package:flutter/material.dart';
import 'package:netflix/Presentation/Downloads/downloads.dart';
import 'package:netflix/Presentation/homepage/homepg.dart';
import 'package:netflix/Presentation/mainScreen/widgets/bottom_nav_widget.dart';
import 'package:netflix/Presentation/new%20and%20hot/new&hot.dart';
import 'package:netflix/Presentation/search/search_Screen.dart';

class Mainscreen extends StatelessWidget {
  Mainscreen({super.key});
  final pages = [
    Homepg(),
    const New_and_hot(),
    const SearchScreen(),
    const Downloads(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
          valueListenable: indexNotifier,
          builder: (context, int value, _) {
            return pages[value];
          },
        ),
        bottomNavigationBar: const Bottom_Nav_Widget());
  }
}
