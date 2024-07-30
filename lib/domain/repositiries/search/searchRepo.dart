import 'package:netflix/domain/entities/search/search_entitiy.dart';

abstract class Searchrepo {

  Future<List<SearchEntitiy>> getSearchResultfromDataSource();
}