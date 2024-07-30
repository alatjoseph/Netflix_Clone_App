import 'package:netflix/core/strings.dart';
import 'package:netflix/infrastructure/api_key.dart';

const String downloads_link = '$baseUrl/movie/popular?api_key=$apiKey';
const String pastyearLink ='$baseUrl/discover/movie?api_key=$apiKey&primary_release_date.gte=2023-03-01&primary_release_date.lte=2023-12-30';
const String trending_home_link = '$baseUrl/movie/popular?api_key=$apiKey';
const String top10_home_link = '$baseUrl/discover/tv?api_key=$apiKey';
const String DramaLink='$baseUrl/discover/movie?api_key=$apiKey&with_genres=18sort_by=popularity.desc';
const String commingsoonlink='$baseUrl/movie/upcoming?api_key=$apiKey';
const String everyonewatchinglink = '$baseUrl/trending/all/week?api_key=$apiKey';