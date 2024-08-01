import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/infrastructure/models/search/castmodel.dart';

class CastListWidget extends StatelessWidget {
  final Future<List<Castmodel>> castFuture;

  CastListWidget({required this.castFuture});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Castmodel>>(
      future: castFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No cast information available'));
        } else {
          final castList = snapshot.data!;

          return SizedBox(
            height: 180,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: castList.length,
              itemBuilder: (context, index) {
                final cast = castList[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                     
                      children: [
                        CircleAvatar(
                          radius: 46,
                          backgroundColor: kwhite,
                          child: Center(
                            child: CircleAvatar(
                              radius: 44,
                              backgroundColor: Colors.black,
                              child: ClipOval(
                                child: Image.network(
                                  cast.profile_photo == null
                                      ? 'https://th.bing.com/th/id/OIP.XtNBQjfvbBAcn9g6xkzVJwAAAA?rs=1&pid=ImgDetMain'
                                      : 'https://image.tmdb.org/t/p/w200${cast.profile_photo}',
                                  // Placeholder image if no profile photo
                                  fit: BoxFit.cover,
                                  width: 100,
                                  height: 100,
                                ),
                              ),
                            ),
                          ),
                        ),
                        kheight,
                        Text(
                          "${cast.actorName}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        kheight,
                        // Text(
                        //   '${cast.characterName}',
                        //   style: const TextStyle(
                        //     decoration: TextDecoration.none,
                        //     color: Colors.grey,
                        //     fontSize: 12,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
