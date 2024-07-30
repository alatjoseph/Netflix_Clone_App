import 'package:equatable/equatable.dart';

class DownloadsEntities extends Equatable{
  final String poster_path;
  DownloadsEntities({required this.poster_path});


  @override
  List<Object?> get props => [poster_path];
  }