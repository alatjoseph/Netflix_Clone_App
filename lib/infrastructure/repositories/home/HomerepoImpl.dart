import 'package:netflix/domain/entities/home/pastyear_entitiy.dart';
import 'package:netflix/domain/entities/home/top10_entity.dart';
import 'package:netflix/domain/entities/home/trending_home_entities.dart';
import 'package:netflix/domain/repositiries/home/home_repo.dart';
import 'package:netflix/infrastructure/datasources/home/drama_dataSource.dart';
import 'package:netflix/infrastructure/datasources/home/pastyear_datasource.dart';
import 'package:netflix/infrastructure/datasources/home/top10datasource.dart';
import 'package:netflix/infrastructure/datasources/home/trending_datasource.dart';
import 'package:netflix/infrastructure/models/home/Homemodel.dart';

class HomeRepoimpl implements HomeRepo{
  PastyearDatasource pastyearData=PastyearDatasourceImpl();
  TrendingDatasource trendingDatasource=TrendingDatasourceImpl();
  Top10datasource top10datasource=Top10datasourceImpl();
  DramaDatasource dramasource=DramaDatasourceImpl();
  @override
  Future<List<PastYearEntity>> getPastYearSource()async {
   
    final PastyearImageList=await pastyearData.getPastyearfromApi();
    return PastyearImageList;

  }
    Future<List<TrendingHomeEntities>> getTrendingSource()async {
   
    final trendingImageList=await trendingDatasource.getTrendingfromApi();
    return trendingImageList;

  }

  @override
  Future<List<Top10Entity>> getTop10Source() async{
    final top10imageList=await top10datasource.getTop10fromApi();
    return top10imageList;
  }

  @override
  Future<List<DramaModels>> getDramaSource() async{
   final dramaImageList=await dramasource.getDramaFromApi();
   return dramaImageList;
  }

   
  
}