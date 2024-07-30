import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:netflix/Presentation/search/widgets/castlist.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/infrastructure/api_key.dart';
import 'package:netflix/infrastructure/models/search/castmodel.dart';

class ViewOverview extends StatelessWidget {
  ViewOverview(
      {super.key,
      required this.title,
      required this.image,
      required this.overview,
      required this.rating,
      required this.release_date,
      required this.poster_path,
      required this.movieId});
  String title;
  String image;
  String overview;
  String release_date;
  double rating;
  String poster_path;
  int movieId;
  @override
  Widget build(BuildContext context) {
    Future<List<Castmodel>>? castFuture;
    castFuture = fetchMovieCast(movieId);

    String formattedRating = rating.toStringAsFixed(1);
    DateTime parsedDate = DateTime.parse(release_date);
    String formattedDate = DateFormat('dd-MM-yyyy').format(parsedDate);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(11.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width / 1.8,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black,
                      image: DecorationImage(
                        image: NetworkImage(image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: -1,
                    left: -10,
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.black38,
                            child: Icon(
                              CupertinoIcons.back,
                              size: 35,
                              color: Colors.white,
                            ))),
                  )
                ],
              ),
              kheight20,
              Text(
                '⭐ Rating : $formattedRating /10',
                style: const TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              kheight20,
              Text(
                title,
                style: const TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 26,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              kheight20,
              Row(
                children: [
                  const Icon(
                    Icons.calendar_month,
                    color: greyclr,
                  ),
                  kwidth,
                  Text(
                    formattedDate,
                    style: const TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              kheight20,
              const Text(
                'Overview',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
              kheight,
              Text(
                overview,
                style: const TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              kheight20,
              const Text(
                'Cast',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 23,
                  color: Colors.white,
                ),
              ),
              kheight,
              CastListWidget(
                castFuture: castFuture,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<Castmodel>> fetchMovieCast(int movieId) async {
    final response = await http.get(
      Uri.parse(
          'https://api.themoviedb.org/3/movie/$movieId/credits?api_key=$apiKey'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final castList = data['cast'];
      List<Castmodel> castModels = [];

      for (var cast in castList) {
        castModels.add(Castmodel(
            actorName: cast['name'],
            characterName: cast['character'],
            profile_photo: cast['profile_path']));
      }

      return castModels;
    } else {
      return [];
    }
  }
}
