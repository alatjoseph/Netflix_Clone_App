import 'package:flutter/material.dart';
import 'package:netflix/Presentation/homepage/widgets/numbercard.dart';
class Numbercardlist extends StatelessWidget {
  const Numbercardlist({
    super.key,
    required this.imageList,
    required this.count
  });
final List imageList;
final count;
  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: 200,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(10, (index) {
            return  Numbercard(index: index,image:imageList[index] ,);
          },),
        ),
      ),
    );
  }
}