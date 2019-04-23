import 'package:meta/meta.dart';
import 'package:speis_eks/models/launch.dart';

abstract class LaunchState {}

class LaunchStateUninitialized extends LaunchState {}

class LaunchStateFailed extends LaunchState {}

class LaunchStateLoaded extends LaunchState {
  final List<Launch> launches;

  bool get isEmpty => launches.length == 0;

  LaunchStateLoaded({
    @required this.launches,
  });
}
