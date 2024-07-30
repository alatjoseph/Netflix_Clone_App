import 'package:equatable/equatable.dart';
class PastYearEntity extends Equatable{
  final String poster_path;
    const PastYearEntity({required this.poster_path});
    
  @override
  
  List<Object?> get props => [poster_path];
  
}