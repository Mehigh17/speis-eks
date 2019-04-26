import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:speis_eks/models/payload.dart';
import 'package:speis_eks/states/payload_state.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

/*
 * EVENTS
 */

abstract class PayloadEvent {}

class FetchPayloadsEvent extends PayloadEvent {
  final List<String> payloadsId;

  FetchPayloadsEvent({@required this.payloadsId,});
}

/*
 * BLOC
 */
class PayloadsBloc extends Bloc<PayloadEvent, PayloadState> {

  @override
  PayloadState get initialState => PayloadUninitialized();

  @override
  Stream<PayloadState> mapEventToState(PayloadEvent event) async* {
    if(event is FetchPayloadsEvent) {
      try {
        var payloads = await _fetchPayloads(event.payloadsId);
        yield PayloadLoaded(
          payloads: payloads
        );
      } catch(e) {
        yield PayloadFailed(message: e.toString());
      }
    }
  }

  Future<List<Payload>> _fetchPayloads(List<String> payloadIds) async {
    List<Payload> payloads = <Payload>[];

    for (String id in payloadIds) {
      var response =
          await http.get("https://api.spacexdata.com/v3/payloads/$id");

      if (response.statusCode == 200) {
        var json = convert.jsonDecode(response.body);
        payloads.add(Payload.fromJson(json));
      } else {
        throw Exception(
          "Error while fetching the response. (Code: ${response.statusCode})");
      }
    }

    return payloads;
  }
  
}