import 'package:netflix/domain/entities/new&hot/everonewaching_entity.dart';

import '../../../core/strings.dart';

class EveryonewatchingModel extends EveryonewachingEntity {
  const EveryonewatchingModel(
      {required super.backdrop_path,
      required super.title,
      required super.overview});

  factory EveryonewatchingModel.fromJson(Map<String, dynamic> json) {
    return EveryonewatchingModel(
        backdrop_path: '$basebackdropUrl${json['backdrop_path']}',
        overview: "${json['overview']}",
        title: "${json['title'] ?? json['name'] ?? ''}");
  }
}
