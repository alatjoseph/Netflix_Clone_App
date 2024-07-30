part of 'everyone_watching_bloc.dart';

abstract class EveryoneWatchingEvent extends Equatable {
  const EveryoneWatchingEvent();

  @override
  List<Object> get props => [];
}


class EveryoneWatchingLoadedEvent extends EveryoneWatchingEvent{
  
}