import 'package:netflix/domain/entities/downloads/downloads_entities.dart';
import 'package:netflix/domain/repositiries/downloads/downloads_repo.dart';
import 'package:netflix/infrastructure/datasources/downloads/downloads_remote_datasourse.dart';

class DownloadRepoImplimentation implements DownloadsRepo{
     DownloadsRemoteDatasourse downloadsRemoteDatasourse=DownloadsRemoteDatasourseImpl();

  @override
  Future<List<DownloadsEntities>> getDownloadsFromDataSource() async{
    final imageList=await downloadsRemoteDatasourse.getDownloadsFromApi();
       
    return imageList;
  }
  

  
}