import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class Appbarwidget extends StatelessWidget {
  final String title;
  Appbarwidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        const Icon(
          Icons.cast,
          color: Colors.white,
        ),
        kwidth,
      ],
    );
  }
}
