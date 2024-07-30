import 'package:netflix/core/strings.dart';
import 'package:netflix/domain/entities/home/dramas.dart';
import 'package:netflix/domain/entities/home/pastyear_entitiy.dart';
import 'package:netflix/domain/entities/home/top10_entity.dart';
import 'package:netflix/domain/entities/home/trending_home_entities.dart';
class PastyearModel extends PastYearEntity{
  PastyearModel({required poster_path}): super(poster_path: poster_path);

   factory PastyearModel.fromJson(Map<String, dynamic> json) {
    
    return PastyearModel( poster_path: '$basePosterUrl${json['poster_path']}');
  }
  
}



class TrendingModel extends TrendingHomeEntities{
  TrendingModel({required poster_path}) : super(poster_path: poster_path);

  factory TrendingModel.fromJson(Map<String, dynamic> json) {
    
    return TrendingModel( poster_path: '$basePosterUrl${json['poster_path']}');
  }
  
}

class Top10Model extends Top10Entity{

  Top10Model({required poster_path}) : super(poster_path: poster_path);
  factory Top10Model.fromJson(Map<String, dynamic> json) {
    
    return Top10Model( poster_path: '$basePosterUrl${json['poster_path']}');
  }
  
}

class DramaModels extends DramaEntities{
  DramaModels({required poster_path}) : super(poster_path: poster_path);
  factory DramaModels.fromJson (Map<String, dynamic> json){

    return DramaModels(poster_path: '$basePosterUrl${json['poster_path']}');
  }

}