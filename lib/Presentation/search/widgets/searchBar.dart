import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/constants.dart';

class Searchbar extends StatelessWidget {
  Searchbar({super.key});

  final TextEditingController _searchcontroller = TextEditingController();
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      backgroundColor: Colors.grey[800],
      controller: _searchcontroller,
      prefixIcon: const Icon(
        CupertinoIcons.search,
        color: Colors.grey,
        size: 23,
      ),
      suffixIcon: const Icon(
        CupertinoIcons.xmark_circle_fill,
        color: Colors.grey,
        size: 20,
      ),
      onSuffixTap: () {
        BlocProvider.of<SearchBloc>(context)
            .add(const SearchidleEvent(query: ''));

            _searchcontroller.text='';
      },
      style: const TextStyle(color: kwhite, fontSize: 20),
      onChanged: (value) {
        String query = _searchcontroller.text;
        BlocProvider.of<SearchBloc>(context)
            .add(LoadSearchResultsEvent(query: query));
      },
    );
  }
}
