import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:donitaa_client/app/models/category_model.dart';
import 'package:donitaa_client/app/models/shipment_model.dart';
import 'package:donitaa_client/app/repositories/user_repo.dart';
import 'package:donitaa_client/common/strings/paths.dart';
import 'package:http/http.dart' as http;

Future<Stream<Category>> getCategories() async {
  final Uri uri = getUri('categories');
  final client = http.Client();
  try {
    final streamRest = await client.send(http.Request('get', uri));

    return streamRest.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .map((data) => Universe.getData(data as Map<String, dynamic>))
        .expand((element) => (element as List))
        .map((event) => Category.fromMap(event));
  } catch (e) {
    print(e.toString());
    return Stream.value(Category.fromMap({}));
  }
}

Future<Stream<PackageCategory>> getPackages(String id) async {
  final Uri uri = getUri('packages/$id');
  final client = http.Client();
  try {
    final streamRest = await client.send(http.Request('get', uri));

    return streamRest.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .map((data) => Universe.getData(data as Map<String, dynamic>))
        .expand((element) => (element as List))
        .map((event) => PackageCategory.fromMap(event));
  } catch (e) {
    print(e.toString());
    return Stream.value(PackageCategory.fromMap({}));
  }
}

Future<void> createShipment(OneShipment shipment) async {
  // print("Bearer" + ' ' + currentUser.value.access_token.toString());
  final Uri uri = getUri('user/shipping/create');
  final client = http.Client();
  // print(json.encode(shipment.toMap().toString()));
  Map<String, dynamic> map = {};

  shipment.toMap().forEach((key, value) {
    // print(value);
    if (value != null && value.toString() != '') {
      print(value);
      map.addAll({key: value});
    }
  });

  await Future.delayed(Duration(milliseconds: 1000));

  try {
    var response = await client.post(uri,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader:
              "Bearer" + ' ' + currentUser.value.access_token.toString(),
        },
        body: json.encode(map));
    print(response.body);
  } catch (e) {
    print(e.toString());
  }
}

Future<Stream<Shipment>> getShipments() async {
  final Uri uri = getUri('user/shipments');
  final client = http.Client();
  try {
    final streamRest = await client
        .send(http.Request('get', uri)..headers.addAll(addressHeaders));

    print('we rule');
    return streamRest.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .map((data) => Universe.getData(data as Map<String, dynamic>))
        .expand((element) => (element as List))
        .map((event) {
      print("yeah");
      return Shipment.fromMap(event);
    });
  } catch (e) {
    print(e.toString());
    return Stream.value(Shipment.fromMap({}));
  }
}

Future<void> updateShipment(OneShipment shipment) async {
  final Uri uri = getUri('user/shipping/update');
  final client = http.Client();

  Map<String, dynamic> map = {};
  shipment.toMap().forEach((key, value) {
    // print(value);
    if (value != null && value.toString() != '') {
      print(value);
      map.addAll({key: value});
    }
  });
  print(json.encode(shipment.toMap().toString()));
  try {
    var response = await client.post(uri,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader:
              "Bearer" + ' ' + currentUser.value.access_token.toString(),
        },
        body: map);
    print(response.body);
  } catch (e) {
    print(e.toString());
  }
}

Future<void> deleteShipment(OneShipment shipment) async {
  final Uri uri = getUri('user/shipping/delete');
  final client = http.Client();

  Map<String, dynamic> map = {};
  shipment.toMap().forEach((key, value) {
    // print(value);
    if (value != null && value.toString() != '') {
      print(value);
      map.addAll({key: value});
    }
  });
  print(json.encode(shipment.toMap().toString()));
  try {
    var response = await client.post(uri,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader:
              "Bearer" + ' ' + currentUser.value.access_token.toString(),
        },
        body: map);
    print(response.statusCode);
  } catch (e) {
    print(e.toString());
  }
}
