import 'package:netflix/core/strings.dart';
import 'package:netflix/domain/entities/search/search_entitiy.dart';

class SearchModel extends SearchEntitiy {

  const SearchModel({
 
    required super.posterpath,
    required super.title,
    required super.backdroppath,
    required super.overview,
    required super.releasedata,
     super.vote_average=0,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    //print(json);
             print(json['vote_average']); 

    return SearchModel(
        posterpath: '$basePosterUrl${json['poster_path']}',
        title: json['title'],
        backdroppath: '$basebackdropUrl${json['backdrop_path']}',
         overview: json['overview'],
         releasedata: json['release_date'],
        vote_average: json['vote_average'] != null ? (json['vote_average'] as num).toDouble() : 0.0,
        );
  }
}
