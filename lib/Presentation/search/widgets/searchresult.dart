import 'package:flutter/material.dart';
import 'package:netflix/Presentation/search/widgets/maincard.dart';
import 'package:netflix/domain/entities/search/search_entitiy.dart';

class Searchresult extends StatelessWidget {
  List<SearchEntitiy> searchdata;

  Searchresult({super.key, required this.searchdata});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 2 / 2.9,
        children: List.generate(
          searchdata.length,
          (index) {
            return MainCard(
              posterpath: searchdata[index].posterpath,
              backdrop_path: searchdata[index].backdroppath,
               overview:  searchdata[index].overview,
               rating:  searchdata[index].vote_average,
               release_date:  searchdata[index].releasedata,
              title:  searchdata[index].title,
              movieId: searchdata[index].movieid,
            );
          },
        ));
  }
}
