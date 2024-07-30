import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netflix/core/strings.dart';
import 'package:netflix/domain/entities/search/search_entitiy.dart';
import 'package:netflix/infrastructure/api_key.dart';
import 'package:netflix/infrastructure/models/search/search_model.dart';

abstract class SearchDatasource {
  Future<List<SearchEntitiy>> getSearchResult(String query);
}

class SearchDatasourceImpl extends SearchDatasource {
  @override
  Future<List<SearchEntitiy>> getSearchResult(String query) async {
    String url = '';
    if (query == '') {
      url = '$baseUrl/movie/popular?api_key=$apiKey';
    } else {
      url = '$baseUrl/search/movie?api_key=$apiKey&query=$query';
    }
    final client = http.Client();
    final response = await client.get(Uri.parse(url));

    try {
      if (response.statusCode == 200) {
        Map<String, dynamic> decodedata = jsonDecode(response.body);
        final List<dynamic> results = decodedata['results'];
        final List<SearchModel> searchdata = results.map((json) {
          if (json is Map<String, dynamic>) {
            return SearchModel.fromJson(json);
          } else {
            
            throw Exception('Expected a Map but got: ${json.runtimeType}');
          }
        }).toList();
        return searchdata;
      } else {
        throw Exception('Expected a Map but got: ${json.runtimeType}');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}

