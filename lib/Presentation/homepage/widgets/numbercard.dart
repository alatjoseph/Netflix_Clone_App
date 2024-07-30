import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Numbercard extends StatelessWidget {
   Numbercard({super.key, required this.index,required this.image});
  final int index;
  var image;
  @override
  Widget build(BuildContext context) {
  
    String imageUrl=image.poster_path;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              Container(
                height: 290,
                width: 110,
                decoration: BoxDecoration(
                    image:  DecorationImage(
                      fit: BoxFit.cover,
                        image: NetworkImage(
                            imageUrl)),
                    borderRadius: BorderRadius.circular(20)),
              ),
              
            ],
            
          ),
          Positioned(
            left: -8,
            bottom: 15,
            child: BorderedText(
                  strokeWidth: 4.0,
                  strokeColor: Colors.white,
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 95.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
