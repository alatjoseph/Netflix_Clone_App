

import 'package:flutter/material.dart';
import 'package:netflix/Presentation/search/widgets/view_overview.dart';

class MainCard extends StatelessWidget {
  String posterpath;
  String backdrop_path;
  String overview;
  String release_date;
  String title;
  double rating;
  MainCard(
      {super.key,
      required this.posterpath,
      required this.backdrop_path,
       required this.overview,
       required this.release_date,
      required this.title,
      required this.rating
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(posterpath),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10)),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return ViewOverview(
              image: backdrop_path,
              poster_path: posterpath,
               overview: overview,
              rating: rating,
               release_date: release_date,
              title: title,
            );
          },
        ));
      },
    );
  }
}
