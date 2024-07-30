import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:netflix/domain/entities/downloads/downloads_entities.dart';
import 'package:netflix/domain/usecases/downloads/downloads_usecases.dart';

part 'downloads_event.dart';
part 'downloads_state.dart';

class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  DownloadsBloc() : super(DownloadsInitial()) {
    on<DownloadImageEvent>((event, emit) async{
      
      try{
        final imageList=await DownloadsUsecases().getDownloadsFromDataSource();
        emit(DownloadsLoadedState(imageList: imageList));
      }
      catch(e){
        emit(DownloadsErrorState(message: e.toString()));
      }
      
    });
  }
}
