import 'package:netflix/domain/entities/downloads/downloads_entities.dart';

abstract class DownloadsRepo {
  Future<List<DownloadsEntities>> getDownloadsFromDataSource();
}