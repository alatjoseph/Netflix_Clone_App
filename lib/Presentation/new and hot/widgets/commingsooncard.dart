import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netflix/Presentation/homepage/widgets/main_button.dart';
import 'package:netflix/Presentation/new%20and%20hot/widgets/video_widget.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/domain/entities/new&hot/commingsoon_entity.dart';

// ignore: must_be_immutable
class CommingSoonCard extends StatelessWidget {
  List<CommingsoonEntity> commingsoondata;
  CommingSoonCard({super.key, required this.commingsoondata});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          commingsoondata.length,
          (index) {
            final movie = commingsoondata[index];
            DateTime releaseDate = DateTime.parse(movie.release_date);
            String month =DateFormat.MMM().format(releaseDate);
            String day = DateFormat.d().format(releaseDate); 
            
            return Column(
              children: [
                kheight,
                Row(
                  children: [
                    SizedBox(
                      height: size.height / 1.8,
                      width: 60,
                      child: Column(
                        children: [
                          Text(
                            month.toUpperCase(),
                            style: const TextStyle(
                              color: greyclr,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            day,
                            style: const TextStyle(
                                color: kwhite,
                                fontSize: 35,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: size.height / 1.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            VideoWidget(
                                size: size, imageurl: movie.backdrop_path),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      movie.title,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          color: kwhite,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  kwidth,
                                  const Mainbottomicon(
                                    icon: Icons.notifications,
                                    name: 'Remind Me',
                                    fontsize: 15,
                                    iconsize: 22,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  const Mainbottomicon(
                                    icon: Icons.info,
                                    name: 'Info',
                                    fontsize: 15,
                                    iconsize: 22,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(movie.title,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            kheight,
                            Text(
                              movie.overview,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
