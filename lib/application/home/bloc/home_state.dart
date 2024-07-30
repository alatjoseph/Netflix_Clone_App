part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<PastYearEntity> pastyear_image_List;
  final List<TrendingHomeEntities> trending_image_List;
  final List<Top10Entity> top10_image_List;
  final List<DramaEntities> dramaImageLists;

  const HomeLoadedState(
      {required this.pastyear_image_List,
      required this.trending_image_List,
      required this.top10_image_List,
      required this.dramaImageLists});

  @override
  List<Object> get props => [];
}

class HomeErrorState extends HomeState {
  final String message;

  const HomeErrorState({required this.message});

  @override
  List<Object> get props => [];
}
