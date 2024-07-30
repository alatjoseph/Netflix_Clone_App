import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/Presentation/search/widgets/searchBar.dart';
import 'package:netflix/Presentation/search/widgets/searchTitle.dart';
import 'package:netflix/Presentation/search/widgets/search_idle.dart';
import 'package:netflix/Presentation/search/widgets/searchresult.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/constants.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Searchbar(),
              kheight20,
              Searchtitle(
                title: 'Top Searches',
              ),
              kheight20,
              BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  print(state);
                  if (state is SearchidleState) {
                    return Expanded(
                        child: SearchIdle(
                      searchdata: state.searchdata,
                    ));
                  } else if (state is SearchresultLoadedState) {
                    return Expanded(
                        child: Searchresult(
                      searchdata: state.searchdata,
                    ));
                  } else {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: kwhite,
                    ));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
