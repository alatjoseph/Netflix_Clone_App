import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Searchtitle extends StatelessWidget {
   Searchtitle({super.key,required this.title});
  String title;
  @override
  Widget build(BuildContext context) {
    return Text(title,style:const TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold
    ),);
  }
}