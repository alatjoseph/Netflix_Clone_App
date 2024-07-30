import 'package:netflix/domain/entities/downloads/downloads_entities.dart';
import 'package:netflix/domain/repositiries/downloads/downloads_repo.dart';
import 'package:netflix/infrastructure/repositories/downloads/download_repo_implimentation.dart';

class DownloadsUsecases{
    DownloadsRepo downloadRepo=DownloadRepoImplimentation();

  Future<List<DownloadsEntities> > getDownloadsFromDataSource() async{
    final imageList=await downloadRepo.getDownloadsFromDataSource();
    return imageList;
  }
}