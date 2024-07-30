part of 'everyone_watching_bloc.dart';

// ignore: must_be_immutable
sealed class EveryoneWatchingState extends Equatable {
  var everyonewatchingdata;

   EveryoneWatchingState();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
final class EveryoneWatchingInitial extends EveryoneWatchingState {}



// ignore: must_be_immutable
class EveryoneWatchingLoadedState extends EveryoneWatchingState {
  final List<EveryonewachingEntity> everyonewatchingdata;

   EveryoneWatchingLoadedState({required this.everyonewatchingdata});


}


// ignore: must_be_immutable
class EveryoneWatchingErrorState extends EveryoneWatchingState{

  final String messege;

   EveryoneWatchingErrorState({required this.messege});

}