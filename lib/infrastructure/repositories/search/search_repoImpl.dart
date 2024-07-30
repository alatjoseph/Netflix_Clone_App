import 'package:netflix/domain/entities/search/search_entitiy.dart';
import 'package:netflix/domain/repositiries/search/searchRepo.dart';
import 'package:netflix/infrastructure/datasources/search/search_datasource.dart';

class SearchrepoImpl extends Searchrepo {
  SearchrepoImpl({required this.query});
  String query;
  SearchDatasource searchDatasource = SearchDatasourceImpl();
  @override
  Future<List<SearchEntitiy>> getSearchResultfromDataSource() async {
    List<SearchEntitiy> searchdata =
        await searchDatasource.getSearchResult(query);
    return searchdata;
  }
}
