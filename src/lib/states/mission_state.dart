import 'package:meta/meta.dart';
import 'package:speis_eks/models/mission.dart';

abstract class MissionState {}

class MissionStateUninitialized extends MissionState {}

class MissionStateFailed extends MissionState {}

class MissionStateLoaded extends MissionState {
  final List<Mission> missions;

  bool get isEmpty => missions.length == 0;

  MissionStateLoaded({
    @required this.missions,
  });
}
