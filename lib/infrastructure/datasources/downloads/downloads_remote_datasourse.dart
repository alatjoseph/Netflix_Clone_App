import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netflix/core/links.dart';
import 'package:netflix/infrastructure/models/downloads/downloads_model.dart';

abstract class DownloadsRemoteDatasourse {
  Future<List<DownloadsModel>> getDownloadsFromApi();
}

class DownloadsRemoteDatasourseImpl implements DownloadsRemoteDatasourse {
  final client = http.Client();

  @override
  Future<List<DownloadsModel>> getDownloadsFromApi() async {
    try {
      final response = await client.get(Uri.parse(downloads_link));

      if (response.statusCode == 200) {
        

        // Decode the JSON response
        final Map<String, dynamic> decodedResponse = jsonDecode(response.body);
  

        // Extract the 'results' list from the decoded JSON
        final List<dynamic> results = decodedResponse['results'];


        // Check if the results are in the expected format
        // Map the JSON list to DownloadsModel
        final List<DownloadsModel> imageList = results.map((json) {
          if (json is Map<String, dynamic>) {
            return DownloadsModel.fromJson(json);
          } else {
            throw Exception('Expected a Map but got: ${json.runtimeType}');
          }
        }).toList();


        return imageList;
            } else {

        throw Exception('Error occurred: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error occurred during parsing: $e');
    }
  }
}
