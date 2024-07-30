part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class LoadSearchResultsEvent extends SearchEvent {
  final String query;

  const LoadSearchResultsEvent({required this.query});

  @override
  List<Object> get props => [query];
}

class SearchidleEvent extends SearchEvent {
  final String query;

  const SearchidleEvent({required this.query});

  @override
  List<Object> get props => [query];
}