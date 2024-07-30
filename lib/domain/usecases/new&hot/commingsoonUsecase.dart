import 'package:netflix/domain/entities/new&hot/commingsoon_entity.dart';
import 'package:netflix/domain/repositiries/new&hot/commingsoonRepo.dart';
import 'package:netflix/infrastructure/repositories/new&hot/commingsoonRepoImpl.dart';

class Commingsoonusecase {

Commingsoonrepo commingsoonrepo=Commingsoonrepoimpl();
Future<List<CommingsoonEntity>> getcommmingsoondata() async{
  final commingsoondata=await commingsoonrepo.getCommingSoonSource();
  return commingsoondata;
}

}