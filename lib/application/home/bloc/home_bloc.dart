import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:netflix/domain/entities/home/dramas.dart';
import 'package:netflix/domain/entities/home/pastyear_entitiy.dart';
import 'package:netflix/domain/entities/home/top10_entity.dart';
import 'package:netflix/domain/entities/home/trending_home_entities.dart';
import 'package:netflix/domain/usecases/home/homeUsecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeLoadedEvent>((event, emit) async {
      try {
        final imageList = await HomeUsecase().getPastYearSource();
        final trendingImageList = await HomeUsecase().getTrendingDataSource();
        final top10ImageList = await HomeUsecase().getTop10DataSource();
        final dramaImageList = await HomeUsecase().getDramaDataSource();
        emit(HomeLoadedState(
            pastyear_image_List: imageList,
            trending_image_List: trendingImageList,
            top10_image_List: top10ImageList,
            dramaImageLists: dramaImageList));

      } catch (e) {
        emit(HomeErrorState(message: e.toString()));
      }
    });

    // on<TrendingEvent>((event, emit) async{
    //  try{
    //     final imageList=await TrendingHomeUsecase().getDownloadsFromDataSource();
    //     emit(HomeLoadedState(trending_image_List: imageList));
    //   }
    //   catch(e){
    //     emit(HomeErrorState(message: e.toString()));
    //   }
    // });

    // on<TVShowEvent>((event, emit) {
    //   // TODO: implement event handler
    // });

    // on<DramaEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
  }
}
