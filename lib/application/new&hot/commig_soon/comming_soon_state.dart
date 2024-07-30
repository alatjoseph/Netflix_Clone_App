part of 'comming_soon_bloc.dart';

sealed class CommingSoonState extends Equatable {
  const CommingSoonState();
  
  @override
  List<Object> get props => [];
}

final class CommingSoonInitial extends CommingSoonState {}

final class CommingSoonLoadedState extends CommingSoonState {
  final List<CommingsoonEntity> commingsoondata;

  const CommingSoonLoadedState({required this.commingsoondata});


}

class CommingsoonErrorState extends CommingSoonState {
  final String message;

  const CommingsoonErrorState({required this.message});

  @override
  List<Object> get props => [];
}