import 'package:netflix/domain/entities/downloads/downloads_entities.dart';

class DownloadsModel extends DownloadsEntities {
  static const String baseUrl = "https://image.tmdb.org/t/p/w500";
  DownloadsModel({required poster_path}) : super(poster_path: poster_path);

  factory DownloadsModel.fromJson(Map<String, dynamic> json) {
    
    return DownloadsModel( poster_path: '$baseUrl${json['poster_path']}');
  }
}
