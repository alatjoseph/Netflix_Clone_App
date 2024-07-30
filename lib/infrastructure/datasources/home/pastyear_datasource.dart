import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netflix/core/links.dart';
import 'package:netflix/infrastructure/models/home/Homemodel.dart';


abstract class PastyearDatasource {
  Future<List<PastyearModel>> getPastyearfromApi();
}

class PastyearDatasourceImpl implements PastyearDatasource {
  final client = http.Client();
  @override
  Future<List<PastyearModel>> getPastyearfromApi() async {
    try {
      final response = await client.get(Uri.parse(pastyearLink));

      if (response.statusCode == 200) {
        // Decode the JSON response
        final Map<String, dynamic> decodedResponse = jsonDecode(response.body);

        // Extract the 'results' list from the decoded JSON
        final List<dynamic> results = decodedResponse['results'];

        // Map the JSON list to DownloadsModel
        final List<PastyearModel> pastyearImageList = results.map((json) {
          if (json is Map<String, dynamic>) {
            return PastyearModel.fromJson(json);
          } else {
            throw Exception('Expected a Map but got: ${json.runtimeType}');
          }
        }).toList();

        return pastyearImageList;
      } else {
        throw Exception('Error occurred: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error occurred during parsing: $e');
    }
  }
  
 
}
