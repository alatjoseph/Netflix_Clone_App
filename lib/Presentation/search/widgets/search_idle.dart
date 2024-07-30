import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/Presentation/search/widgets/view_overview.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/domain/entities/search/search_entitiy.dart';

class SearchIdle extends StatelessWidget {
  List<SearchEntitiy> searchdata;
  SearchIdle({super.key, required this.searchdata});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: Row(
                    children: [
                      Container(
                        height: size.width * .25,
                        width: size.width * .4,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    searchdata[index].backdroppath),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      kwidth,
                      Expanded(
                          child: Text(
                        searchdata[index].title,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                      const CircleAvatar(
                        radius: 25,
                        backgroundColor: kwhite,
                        child: CircleAvatar(
                          radius: 23,
                          backgroundColor: kblack,
                          child: Icon(
                            CupertinoIcons.play_fill,
                            color: kwhite,
                          ),
                        ),
                      )
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return ViewOverview(
                          poster_path:searchdata[index].posterpath ,
                          image: searchdata[index].backdroppath,
                           overview: searchdata[index].overview,
                          rating: searchdata[index].vote_average,
                           release_date: searchdata[index].releasedata,
                          title: searchdata[index].title,
                          
                        );
                      },
                    ));
                  },
                );
              },
              separatorBuilder: (context, index) => kheight,
              itemCount: searchdata.length),
        ),
      ],
    );
  }
}
