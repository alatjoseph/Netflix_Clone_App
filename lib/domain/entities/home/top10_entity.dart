import 'package:equatable/equatable.dart';

class Top10Entity extends Equatable{
  Top10Entity({required this.poster_path});
  final String poster_path;
  @override
  
  List<Object?> get props => [poster_path];
  
}