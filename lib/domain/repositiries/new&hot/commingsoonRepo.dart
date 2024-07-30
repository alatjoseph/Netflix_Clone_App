import 'package:netflix/domain/entities/new&hot/commingsoon_entity.dart';

abstract class Commingsoonrepo{

  Future<List<CommingsoonEntity>> getCommingSoonSource();
}