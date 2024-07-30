import 'package:equatable/equatable.dart';

class CommingsoonEntity extends Equatable{

  final String backdrop_path;
  final String title;
  final String overview;
  final String release_date;

  const CommingsoonEntity({required this.backdrop_path, required this.title, required this.overview, required this.release_date});


  @override
  
  List<Object?> get props =>[backdrop_path,title,overview,release_date];
  }