import 'package:meta/meta.dart';
import 'package:speis_eks/models/payload.dart';

abstract class PayloadState {}

class PayloadUninitialized extends PayloadState {}

class PayloadLoaded extends PayloadState {
  final List<Payload> payloads;

  PayloadLoaded({
    @required this.payloads,
  });
}

class PayloadFailed extends PayloadState {
  final String message;

  PayloadFailed({
    this.message,
  });
}
