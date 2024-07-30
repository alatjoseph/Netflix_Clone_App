import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netflix/core/links.dart';
import 'package:netflix/infrastructure/models/home/Homemodel.dart';

abstract class DramaDatasource {
  Future<List<DramaModels>> getDramaFromApi();
}

class DramaDatasourceImpl extends DramaDatasource {
  final client = http.Client();
  @override
  Future<List<DramaModels>> getDramaFromApi() async {
    try {
      final response = await client.get(Uri.parse(DramaLink));

      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedResponse = jsonDecode(response.body);
        final List<dynamic> results = decodedResponse['results'];
        final List<DramaModels> DramaImageList = results.map((json) {
          if (json is Map<String, dynamic>) {
            return DramaModels.fromJson(json);
          } else {
            throw Exception('Expected a Map but got: ${json.runtimeType}');
          }
        }).toList();
        return DramaImageList;
      }
      else {
        throw Exception('Error occurred: ${response.statusCode}');
      }
      
    } catch (e) {
      throw Exception('Error occurred during parsing: $e');
    }
  }
}
