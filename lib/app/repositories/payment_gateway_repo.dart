import 'dart:convert';
import 'package:donitaa_client/app/models/simple/delivery_time_model.dart';
import 'package:http/http.dart' as http;

import 'package:donitaa_client/app/models/simple/payment_gateway.dart';
import 'package:donitaa_client/common/strings/paths.dart';

Future<Stream<PaymentGateway>> getPaymentGateways() async {
  final Uri url = getUri('payment_gateways');
  final client = http.Client();
  try {
    final streamRest = await client.send(http.Request('get', url));
    return streamRest.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .map((data) => Universe.getData(data as Map<String, dynamic>))
        .expand((element) => (element as List))
        .map((event) => PaymentGateway.fromJSON(event));
  } catch (e) {
    print(e.toString());
    return Stream.value(PaymentGateway.fromJSON({}));
  }
}

Future<Stream<DeliveryTime>> getDeliveyTimes() async {
  final Uri url = getUri('times');
  final client = http.Client();
  try {
    final streamRest = await client.send(http.Request('get', url));
    return streamRest.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .map((data) => Universe.getData(data as Map<String, dynamic>))
        .expand((element) => (element as List))
        .map((event) => DeliveryTime.fromMap(event));
  } catch (e) {
    print(e.toString());
    return Stream.value(DeliveryTime.fromMap({}));
  }
}
