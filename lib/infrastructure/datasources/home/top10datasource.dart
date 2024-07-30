
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netflix/core/links.dart';
import 'package:netflix/infrastructure/models/home/Homemodel.dart';

abstract class Top10datasource {
  Future<List<Top10Model>> getTop10fromApi();
}

class Top10datasourceImpl implements Top10datasource{
   final client = http.Client();
  @override
  Future<List<Top10Model>> getTop10fromApi() async{
    try{
        final response = await client.get(Uri.parse(top10_home_link));
        if(response.statusCode==200){
         
          final Map<String,dynamic> decodeRespose=jsonDecode(response.body);
          final List<dynamic> results=decodeRespose['results'];

          final List<Top10Model> top10ImageList = results.map((json) {
          if (json is Map<String, dynamic>) {
            return Top10Model.fromJson(json);
          } else {
            throw Exception('Expected a Map but got: ${json.runtimeType}');
          }
        }).toList();
        return top10ImageList;
        }
        else {
        throw Exception('Error occurred: ${response.statusCode}');
      }
    }
    catch(e){
       throw Exception('Error occurred during parsing: $e');
    }
  }
  
}

