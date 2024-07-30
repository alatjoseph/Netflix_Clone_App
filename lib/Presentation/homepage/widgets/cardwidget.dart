import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardWidget extends StatelessWidget {
   CardWidget({super.key,required this.image});
var image;

  @override
  Widget build(BuildContext context) {
    String imageUrl=image.poster_path;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 290,
        width: 110,
        decoration: BoxDecoration(
            image:  DecorationImage(
              fit: BoxFit.cover,
                image: NetworkImage(
                    imageUrl)),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
