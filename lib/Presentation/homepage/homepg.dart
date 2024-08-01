import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/Presentation/homepage/widgets/cardlist.dart';
import 'package:netflix/Presentation/homepage/widgets/idlehome.dart';
import 'package:netflix/Presentation/homepage/widgets/numbercardlist.dart';
import 'package:netflix/application/home/bloc/home_bloc.dart';
import 'package:netflix/core/constants.dart';

// ignore: must_be_immutable
class Homepg extends StatelessWidget {
  Homepg({super.key});

  ValueNotifier<bool> scrollnotifier = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ValueListenableBuilder(
        valueListenable: scrollnotifier,
        builder: (context, value, child) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;

              if (direction == ScrollDirection.reverse) {
                scrollnotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollnotifier.value = true;
              }
              return true;
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        if (state is HomeLoadedState) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Idlehome(),
                              const Maincardtitle(
                                title: 'Released in the past year',
                              ),
                              kheight,
                              Cardlist(
                                image_List: state.pastyear_image_List,
                                count: state.pastyear_image_List.length,
                              ),
                              const Maincardtitle(
                                title: 'Trending Now',
                              ),
                              kheight,
                              Cardlist(
                                image_List: state.trending_image_List,
                                count: state.trending_image_List.length,
                              ),
                              const Maincardtitle(
                                title: 'Top 10 TV Shows in India Today',
                              ),
                              Numbercardlist(
                                imageList: state.top10_image_List,
                                count: state.top10_image_List.length,
                              ),
                              kheight,
                              const Maincardtitle(
                                title: 'Tense Dramas',
                              ),
                              kheight,
                              Cardlist(
                                image_List: state.dramaImageLists,
                                count: state.trending_image_List.length,
                              ),
                            ],
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(
                            color: kwhite,
                          ),
                        );
                      },
                    ),
                    scrollnotifier.value == true
                        ? AnimatedContainer(
                            duration: const Duration(milliseconds: 1000),
                            child: Container(
                              height: 90,
                              width: double.infinity,
                              color: Colors.black.withOpacity(.5),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image(
                                           image:
                                          NetworkImage(
                                            'https://static.vecteezy.com/system/resources/previews/022/101/069/original/netflix-logo-transparent-free-png.png',
                                          ),
                                          width: 50,
                                          height: 50,
                                        ),
                                        Spacer(),
                                        Icon(
                                          Icons.cast,
                                          color: Colors.white,
                                          size: 27,
                                        ),
                                        kwidth,
                                      ],
                                    ),
                                    kheight,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          'TV Shows',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Movies',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Categories',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        : kheight
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Maincardtitle extends StatelessWidget {
  const Maincardtitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
    );
  }
}
