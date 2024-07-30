import 'package:netflix/domain/entities/search/search_entitiy.dart';
import 'package:netflix/infrastructure/datasources/search/search_datasource.dart';

class SearchUsecase {
  
  SearchUsecase();
  final SearchDatasource searchDatasource = SearchDatasourceImpl();

  Future<List<SearchEntitiy>> getSearchResultFromApi(String query) {
    return searchDatasource.getSearchResult(query);
  }
}
