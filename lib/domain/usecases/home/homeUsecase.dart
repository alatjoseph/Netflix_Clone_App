import 'package:netflix/domain/entities/home/dramas.dart';
import 'package:netflix/domain/entities/home/pastyear_entitiy.dart';
import 'package:netflix/domain/entities/home/top10_entity.dart';
import 'package:netflix/domain/entities/home/trending_home_entities.dart';
import 'package:netflix/domain/repositiries/home/home_repo.dart';
import 'package:netflix/infrastructure/repositories/home/HomerepoImpl.dart';

class HomeUsecase{

  HomeRepo homeRepo=HomeRepoimpl();
  Future<List<PastYearEntity> > getPastYearSource() async{
    final pastyearimageList=await homeRepo.getPastYearSource();
    return pastyearimageList;
  }
  
  Future<List<TrendingHomeEntities> > getTrendingDataSource() async{
    final trendingimageList=await homeRepo.getTrendingSource();
    return trendingimageList;
  }

   Future<List<Top10Entity> > getTop10DataSource() async{
    final top10imageList=await homeRepo.getTop10Source();
    return top10imageList;
  }

  Future<List<DramaEntities>> getDramaDataSource() async{
    final dramaImageList=await homeRepo.getDramaSource();
    return dramaImageList;
  }
}