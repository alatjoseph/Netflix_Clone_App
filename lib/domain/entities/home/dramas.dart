import 'package:equatable/equatable.dart';
class DramaEntities extends Equatable{

  final String poster_path;
  const DramaEntities({required this.poster_path});
  @override
  // TODO: implement props
  List<Object?> get props => [poster_path];

}