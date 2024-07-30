import 'package:netflix/domain/entities/new&hot/commingsoon_entity.dart';
import 'package:netflix/domain/repositiries/new&hot/commingsoonRepo.dart';
import 'package:netflix/infrastructure/datasources/new&hot/commingSoonDataSource.dart';

class Commingsoonrepoimpl extends Commingsoonrepo{
  Commingsoondatasource commingsoonrepo=CommingsoondatasourceImpl();
  @override
  Future<List<CommingsoonEntity>> getCommingSoonSource() async{
     final commingsoonData=await commingsoonrepo.getCommingSoonfromApi();
     return commingsoonData;
  }
  
}