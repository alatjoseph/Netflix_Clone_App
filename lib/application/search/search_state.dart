part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();
  
  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

class SearchresultLoadedState extends SearchState {
  final List<SearchEntitiy> searchdata;

  const SearchresultLoadedState({required this.searchdata});

}


class SearchidleState extends SearchState {
  final List<SearchEntitiy> searchdata;

  const SearchidleState({required this.searchdata});
}