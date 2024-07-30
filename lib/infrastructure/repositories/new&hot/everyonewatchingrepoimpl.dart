import 'package:netflix/domain/entities/new&hot/everonewaching_entity.dart';
import 'package:netflix/domain/repositiries/new&hot/everyonewatching_repo.dart';
import 'package:netflix/infrastructure/datasources/new&hot/everyonewatching_datasource.dart';

class EveryonewatchingRepoImpl extends EveryonewatchingRepo {
  final EveryonewatchingDatasource everyonewatchingDatasource =
      EveryonewatchingDatasourceImpl();
  @override
  Future<List<EveryonewachingEntity>> getEveryoneWatchingDataSource() async {
    final everyonewatchingdata =
        await everyonewatchingDatasource.getEveryoneWatchingFromApi();
    return everyonewatchingdata;
  }
}
