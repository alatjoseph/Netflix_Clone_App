import 'package:flutter/material.dart';
import 'package:netflix/Presentation/homepage/widgets/cardwidget.dart';
class Cardlist extends StatelessWidget {
  const Cardlist({
    super.key,
    required this.image_List,
    required this.count
  });
final List image_List;
final int count;
  @override
  
  @override
  Widget build(BuildContext context) {
    
    return LimitedBox(
      maxHeight: 200,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(count, (index) =>  CardWidget(image:image_List[index] ,),),
        ),
      ),
    );
  }
}