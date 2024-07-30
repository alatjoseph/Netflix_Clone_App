import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class Mainbottomicon extends StatelessWidget {
  const Mainbottomicon({
    super.key,
    required this.icon,
    required this.name,
    this.iconsize=25,
    this.fontsize=16
  });
  final IconData icon;
  final String name;
  final double iconsize;
  final double fontsize;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kwhite,
          size: iconsize,
        ),
        const SizedBox(height: 5,),
        Text(name, style:  TextStyle(color: kwhite, fontSize: fontsize)),
      ],
    );
  }
}