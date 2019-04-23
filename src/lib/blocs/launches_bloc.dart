import 'package:bloc/bloc.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:speis_eks/models/launch.dart';
import 'package:speis_eks/states/launch_state.dart';

enum LaunchEvent { FETCH }

class LaunchesBloc extends Bloc<LaunchEvent, LaunchState> {
  
  @override
  LaunchState get initialState => LaunchStateUninitialized();

  @override
  Stream<LaunchState> mapEventToState(LaunchEvent event) async* {
    if(event == LaunchEvent.FETCH) {
      try {
        var launches = await _fetchLaunches();
        yield LaunchStateLoaded(launches: launches);
      } catch (e) {
        yield LaunchStateFailed();
      }
    }
  }

    Future<List<Launch>> _fetchLaunches() async {
    var response = await http.get("https://api.spacexdata.com/v3/launches");
    if(response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);
      return (json as List<dynamic>).map((obj) => Launch.fromJson(obj)).toList();
    }
    
    throw Exception("Error while fetching the response. (Code: ${response.statusCode})");
  }
  
}