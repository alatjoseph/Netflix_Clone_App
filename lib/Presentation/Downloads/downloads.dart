import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/Presentation/Downloads/widgets/appbarWidget.dart';
import 'package:netflix/application/downloads/bloc/downloads_bloc.dart';
import 'package:netflix/core/constants.dart';

class Downloads extends StatelessWidget {
  const Downloads({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Appbarwidget(
              title: "Downloads",
            ),
            kheight,
            const Row(
              children: [
                Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 30,
                ),
                kwidth,
                Text('Smart Downloads',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
              ],
            ),
            kheight,
            kheight,
            kheight,
            const Column(
              children: [
                Text('Introducing Downloads for You',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                kheight,
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      'We\'ll download a personalized selection of\n movies and shows for you,so there\'s\nalways something to watch on your\ndevices',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      )),
                )
              ],
            ),
            kheight,
            kheight,
            BlocBuilder<DownloadsBloc, DownloadsState>(
              builder: (context, state) {
                if (state is DownloadsLoadedState) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Center(
                        child: CircleAvatar(
                          radius: size.width * 0.34,
                          backgroundColor: Colors.grey[900],
                        ),
                      ),
                      Downloadimagewidget(
                        size: size,
                        imageList: state.imageList[0].poster_path,
                        margin: const EdgeInsets.only(right: 140, bottom: 20),
                        angle: -20 * pi / 180,
                      ),
                      Downloadimagewidget(
                        size: size,
                        imageList: state.imageList[1].poster_path,
                        margin: const EdgeInsets.only(left: 140, bottom: 20),
                        angle: 20 * pi / 180,
                      ),
                      Downloadimagewidget(
                        size: size * 1,
                        imageList: state.imageList[2].poster_path,
                        margin: const EdgeInsets.only(top: 30, bottom: 10),
                      ),
                    ],
                  );
                } else if (state is DownloadsErrorState) {
                  return const Text(
                      'Error loading downloads'); // Debug handling for error state
                } else {
                  return const CircularProgressIndicator(
                    color: kwhite,
                  );
                }
              },
            ),
            kheight,
            kheight,
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: blue_btn,
                // ignore: prefer_const_constructors
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('Set Up',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: kwhite,
                      )),
                ),
                onPressed: () {}),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: white_btn,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child: Text('See what you can download',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: kblack,
                          )),
                    ),
                    onPressed: () {}),
              ),
            )
          ],
        ),
      )),
    );
  }
}

class Downloadimagewidget extends StatelessWidget {
  const Downloadimagewidget(
      {super.key,
      required this.size,
      required this.imageList,
      required this.margin,
      this.angle = 0});

  final Size size;
  final String imageList;
  final EdgeInsets margin;
  final double angle;
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: Container(
        margin: margin,
        width: size.width * 0.34,
        height: size.width * 0.58,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(19),
            image: DecorationImage(
                image: NetworkImage(imageList), fit: BoxFit.cover)),
      ),
    );
  }
}
