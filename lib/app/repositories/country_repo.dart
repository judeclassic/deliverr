import 'dart:convert';

import 'package:donitaa_client/app/models/simple/country_model.dart';
import 'package:donitaa_client/common/strings/paths.dart';
import 'package:http/http.dart' as http;

List<Country> allCountries = [];

Future<void> getAllCountries() async {
  final Uri url = getUri('countries');
  await http.get(url).then((value) {
    (json.decode((value.body))['data'] as List).forEach((x) {
      allCountries.add(Country.fromMap(x));
    });
  });

  return;
}

Future<Stream<Country>> getCountries() async {
  final Uri url = getUri('countries');
  final client = http.Client();
  try {
    final streamRest = await client.send(http.Request('get', url));
    return streamRest.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .map((data) => Universe.getData(data as Map<String, dynamic>))
        .expand((element) => (element as List))
        .map((event) => Country.fromMap(event));
  } catch (e) {
    print(e.toString());
    return Stream.value(Country.fromMap({}));
  }
}

Future<Stream<States>> getStates(String id) async {
  final Uri url = getUri('states/$id');
  final client = http.Client();
  try {
    final streamRest = await client.send(http.Request('get', url));
    return streamRest.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .map((data) => Universe.getData(data as Map<String, dynamic>))
        .expand((element) => (element as List))
        .map((event) => States.fromMap(event));
  } catch (e) {
    print(e.toString());
    return Stream.value(States.fromMap({}));
  }
}

Future<Stream<Area>> getAreas(String id) async {
  final Uri url = getUri('areas/$id');
  final client = http.Client();
  try {
    final streamRest = await client.send(http.Request('get', url));
    return streamRest.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .map((data) => Universe.getData(data as Map<String, dynamic>))
        .expand((element) => (element as List))
        .map((event) => Area.fromMap(event));
  } catch (e) {
    print(e.toString());
    return Stream.value(Area.fromMap({}));
  }
}
