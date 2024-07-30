import 'package:netflix/domain/entities/new&hot/everonewaching_entity.dart';
import 'package:netflix/domain/repositiries/new&hot/everyonewatching_repo.dart';
import 'package:netflix/infrastructure/repositories/new&hot/everyonewatchingrepoimpl.dart';

class EveryonewatchingUsecase {

final EveryonewatchingRepo everyonewatchingRepo=EveryonewatchingRepoImpl();

Future<List<EveryonewachingEntity>> getEveryOneWatchingDataFromSource() async{

  final everyonewatchingdata= await everyonewatchingRepo.getEveryoneWatchingDataSource();
  return everyonewatchingdata;
}

}