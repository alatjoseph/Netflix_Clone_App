import 'package:netflix/core/strings.dart';
import 'package:netflix/domain/entities/new&hot/commingsoon_entity.dart';

class CommingsoonModel extends CommingsoonEntity {
  const CommingsoonModel(
      {required super.backdrop_path,
      required super.title,
      required super.overview,
      required super.release_date});

  factory CommingsoonModel.fromJson(Map<String, dynamic> json) {
    return CommingsoonModel(
        backdrop_path: '$basebackdropUrl${json['backdrop_path']}',
        overview: "${json['overview']}",
        release_date: "${json['release_date']}",
        title: json['title']);
  }
}
