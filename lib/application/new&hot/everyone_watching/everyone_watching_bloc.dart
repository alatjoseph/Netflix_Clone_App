import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:netflix/domain/entities/new&hot/everonewaching_entity.dart';
import 'package:netflix/domain/usecases/new&hot/everyonewatching_usecase.dart';

part 'everyone_watching_event.dart';
part 'everyone_watching_state.dart';

class EveryoneWatchingBloc extends Bloc<EveryoneWatchingEvent, EveryoneWatchingState> {
  EveryoneWatchingBloc() : super(EveryoneWatchingInitial()) {
    on<EveryoneWatchingLoadedEvent>((event, emit) async{
    
     final everyonewatchingdata= await EveryonewatchingUsecase().getEveryOneWatchingDataFromSource();
      emit( EveryoneWatchingLoadedState(everyonewatchingdata: everyonewatchingdata));
    });
  }
}
