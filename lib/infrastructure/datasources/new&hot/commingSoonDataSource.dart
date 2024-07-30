import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netflix/core/links.dart';
import 'package:netflix/infrastructure/models/new&hot/commingsoon_model.dart';

abstract class Commingsoondatasource {
  Future<List<CommingsoonModel>> getCommingSoonfromApi();
}

class CommingsoondatasourceImpl extends Commingsoondatasource {
  @override
  Future<List<CommingsoonModel>> getCommingSoonfromApi() async {
    final client = http.Client();
    try {
      final response = await client.get(Uri.parse(commingsoonlink));
      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedResponse = jsonDecode(response.body);
        final List<dynamic> results = decodedResponse['results'];
        final List<CommingsoonModel> commingsoondata = results.map((json) {
          if (json is Map<String, dynamic>) {
            return CommingsoonModel.fromJson(json);
          } else {
            throw Exception('Expected a Map but got: ${json.runtimeType}');
          }
        }).toList();
        
        return commingsoondata;
      }
       else {
        throw Exception('Error occurred: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
