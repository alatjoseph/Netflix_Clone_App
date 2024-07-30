import 'package:netflix/domain/entities/new&hot/everonewaching_entity.dart';

abstract class EveryonewatchingRepo{

  Future<List<EveryonewachingEntity>> getEveryoneWatchingDataSource();

}