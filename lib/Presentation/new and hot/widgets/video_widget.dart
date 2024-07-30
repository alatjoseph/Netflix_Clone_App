import 'package:flutter/material.dart';


class VideoWidget extends StatelessWidget {
  const VideoWidget({
    super.key,
    required this.size,
     this.imageurl='',
  });

  final Size size;
  final String imageurl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: size.width / 1.75,
        width: double.infinity,
        decoration:  BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    imageurl),
                fit: BoxFit.contain)),
      ),
    );
  }
}
