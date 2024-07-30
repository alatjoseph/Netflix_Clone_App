part of 'downloads_bloc.dart';

@immutable
abstract class DownloadsState extends Equatable {
  @override
  
  List<Object?> get props => [];
}

final class DownloadsInitial extends DownloadsState {
  
}

final class DownloadsLoadedState extends DownloadsState {
  
  final List<DownloadsEntities> imageList;

  DownloadsLoadedState({required this.imageList});
  
    @override
  
  List<Object?> get props => [];
}


final class DownloadsErrorState extends DownloadsState {
  
  final String message;

  DownloadsErrorState({required this.message});

 
  
    @override
  
  List<Object?> get props => [];
}