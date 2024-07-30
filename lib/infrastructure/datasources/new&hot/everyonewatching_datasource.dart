import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netflix/core/links.dart';
import 'package:netflix/infrastructure/models/new&hot/everyonewatching_model.dart';


abstract class EveryonewatchingDatasource {

  Future<List<EveryonewatchingModel>> getEveryoneWatchingFromApi();
}

class EveryonewatchingDatasourceImpl extends EveryonewatchingDatasource{
  @override
  Future<List<EveryonewatchingModel>> getEveryoneWatchingFromApi() async{
   final client=http.Client();

   try{
        final response=await client.get(Uri.parse(everyonewatchinglink));
        if(response.statusCode==200){

           final Map<String, dynamic> decodedResponse = jsonDecode(response.body);
           
           final List<dynamic>result=decodedResponse['results'];
           final List<EveryonewatchingModel> everyonewatchingdata=result.map((json){
              if(json is Map<String,dynamic>){

                return EveryonewatchingModel.fromJson(json);
              }
              else{
                throw Exception("Error occured");
              }
           }).toList();
           return everyonewatchingdata;
        }
        else{
          throw Exception('Error occurred: ${response.statusCode}');
        }
   }
   catch(e){
    throw Exception(e);
   }
  }
  
}