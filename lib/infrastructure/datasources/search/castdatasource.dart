 import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netflix/infrastructure/api_key.dart';
import 'package:netflix/infrastructure/models/search/castmodel.dart';
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

