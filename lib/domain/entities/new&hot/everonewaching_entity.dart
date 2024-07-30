import 'package:equatable/equatable.dart';

class EveryonewachingEntity extends Equatable{
  final String backdrop_path;
  final String title;
  final String overview;

  const EveryonewachingEntity({required this.backdrop_path, required this.title, required this.overview});
  
  @override

  List<Object?> get props =>[backdrop_path,title,overview];

}