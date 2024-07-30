import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/Presentation/new%20and%20hot/widgets/commingsooncard.dart';
import 'package:netflix/Presentation/new%20and%20hot/widgets/everyone_watching_widget.dart';
import 'package:netflix/Presentation/new%20and%20hot/widgets/tabbar.dart';
import 'package:netflix/application/new&hot/commig_soon/comming_soon_bloc.dart';
import 'package:netflix/application/new&hot/everyone_watching/everyone_watching_bloc.dart';
import 'package:netflix/core/constants.dart';

class New_and_hot extends StatelessWidget {
  const New_and_hot({super.key});

  @override
  

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'New & Hot',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: kwhite),
          ),
          actions: const [
            Icon(
              Icons.cast,
              color: Colors.white,
              size: 27,
            ),
          SizedBox(width: 30,)
          ],
          bottom: const PreferredSize(
              preferredSize: Size.fromHeight(50), child: Tabbar()),
        ),
        body: TabBarView(children: [
          BlocBuilder<CommingSoonBloc, CommingSoonState>(
              builder: (context, state) {
            if (state is CommingSoonLoadedState) {
              return build_comming_soon(context, state);
            } else if (state is CommingsoonErrorState) {
              return const Text('Error occured');
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: kwhite,
                ),
              );
            }
          }),
          BlocBuilder<EveryoneWatchingBloc, EveryoneWatchingState>(
            builder: (context, state) {
              if (state is EveryoneWatchingLoadedState) {
                return build_Everyone_Watching(context, state);
              } else if (state is CommingsoonErrorState) {
                return const Text('Error occured');
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    color: kwhite,
                  ),
                );
              }
            },
          ),
        ]),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
build_comming_soon(BuildContext context, CommingSoonLoadedState state) {
  return CommingSoonCard(
    commingsoondata: state.commingsoondata,
  );
}

// ignore: non_constant_identifier_names
build_Everyone_Watching(
    BuildContext context, EveryoneWatchingLoadedState state) {
  return EveryoneWatchingWidget(
      everyonewatchingdata: state.everyonewatchingdata);
}
