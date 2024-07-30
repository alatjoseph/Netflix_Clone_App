import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:netflix/domain/entities/new&hot/commingsoon_entity.dart';
import 'package:netflix/domain/usecases/new&hot/commingsoonUsecase.dart';

part 'comming_soon_event.dart';
part 'comming_soon_state.dart';

class CommingSoonBloc extends Bloc<CommingSoonEvent, CommingSoonState> {
  CommingSoonBloc() : super(CommingSoonInitial()) {
    on<CommingSoonLoadedEvent>((event, emit) async{
      final commingsoondata=await Commingsoonusecase().getcommmingsoondata();
   
        emit(CommingSoonLoadedState(commingsoondata: commingsoondata));
    });
  }
}
