import 'package:equatable/equatable.dart';

class TrendingHomeEntities extends Equatable{
  final String poster_path;
  TrendingHomeEntities({required this.poster_path});
  @override
  
  List<Object?> get props =>[poster_path];
  
}

