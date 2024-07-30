import 'package:equatable/equatable.dart';

class SearchEntitiy extends Equatable {
  final String posterpath;
  final String title;
  final String backdroppath;
  final String overview;
  final String releasedata;
  final double vote_average;
  final int movieid;
  const SearchEntitiy({
    required this.posterpath,
    required this.title,
    required this.backdroppath,
    required this.overview,
    required this.releasedata,
    required this.vote_average,
    required this.movieid,
  });

  @override
  List<Object?> get props =>
      [posterpath, title, backdroppath, overview, releasedata];
  //overview, releasedata, rating
}
