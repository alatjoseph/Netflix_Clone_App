import 'package:netflix/domain/entities/home/pastyear_entitiy.dart';
import 'package:netflix/domain/entities/home/top10_entity.dart';
import 'package:netflix/domain/entities/home/trending_home_entities.dart';
import 'package:netflix/infrastructure/models/home/Homemodel.dart';

abstract class HomeRepo {
  Future<List<PastYearEntity>> getPastYearSource();
  Future<List<TrendingHomeEntities>> getTrendingSource();
  Future<List<Top10Entity>> getTop10Source();
  Future<List<DramaModels>> getDramaSource();
}
