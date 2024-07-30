import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:netflix/domain/entities/search/search_entitiy.dart';
import 'package:netflix/domain/usecases/search/search_usecase.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<LoadSearchResultsEvent>((event, emit) async {
      emit(SearchInitial());
      try {
        final searchData = await SearchUsecase().getSearchResultFromApi(event.query);
       
        emit(SearchresultLoadedState(searchdata: searchData));
      } catch (e) {
        
        emit(SearchInitial());
      }
    },
    
    );

      on<SearchidleEvent>((event, emit) async {
      emit(SearchInitial()); 
      try {
        final searchData = await SearchUsecase().getSearchResultFromApi(event.query);
        emit(SearchidleState(searchdata: searchData));
      } catch (e) {
        emit(SearchInitial()); 
      }
    },
    
    );
  }
}

// LoadSearchResultsEvent
// SearchidleEvent

// SearchidleState
// SearchresultLoadedState