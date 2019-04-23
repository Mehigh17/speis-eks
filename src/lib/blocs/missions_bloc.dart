import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:speis_eks/models/mission.dart';
import 'package:speis_eks/states/mission_state.dart';

enum MissionEvent { FETCH }

class MissionsBloc extends Bloc<MissionEvent, MissionState> {
  
  @override
  MissionState get initialState => MissionStateUninitialized();

  @override
  Stream<MissionState> mapEventToState(MissionEvent event) async* {
    if(event == MissionEvent.FETCH) {
      try {
        var missions = await _fetchMissions();
        yield MissionStateLoaded(missions: missions);
      } catch (e) {
        yield MissionStateFailed();
      }
    }
  }

  Future<List<Mission>> _fetchMissions() async {
    var response = await http.get("https://api.spacexdata.com/v3/missions");
    if(response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);
      return (json as List<dynamic>).map((obj) => Mission.fromJson(obj)).toList();
    }
    
    throw Exception("Error while fetching the response. (Code: ${response.statusCode})");
  }

}