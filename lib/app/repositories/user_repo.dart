import 'dart:convert';
import 'dart:io';

import 'package:donitaa_client/app/models/address_model.dart';
import 'package:donitaa_client/common/strings/paths.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/usermodel.dart' as userModel;
import 'package:http/http.dart' as http;

ValueNotifier<userModel.User> currentUser = ValueNotifier(userModel.User());
Map<String, String> addressHeaders = {
  HttpHeaders.contentTypeHeader: "application/json",
  HttpHeaders.authorizationHeader: "Bearer ${currentUser.value.access_token}"
};
final client = http.Client();

Future<http.Response> login(userModel.User user) async {
  final Uri url = getUri('auth/login');

  final response = await client.post(
    url,
    headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    body: json.encode(user.toMap()),
  );
  setCurrentUser(user);

  if (response.statusCode == 200) {
    currentUser.value = userModel.User.fromJSON(json.decode(response.body));
  } else {
    // throw Exception(response.body);
    return response;
  }
  return response;
}

Future<http.Response> register(userModel.User user) async {
  final Uri url = getUri('auth/signup');
  final response = await client.post(
    url,
    headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    body: json.encode(user.toMap()),
  );

  return response;
}

Future<void> logout() async {
  currentUser.value = userModel.User();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('user_email');
  await prefs.remove('user_password');
}

void setCurrentUser(userModel.User user) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('user_email', user.email ?? '');
  await prefs.setString('user_password', user.password ?? '');
}

Future<void> edituser(user) async {}

getUserInfo() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  currentUser.value.email = prefs.getString('user_email');
  currentUser.value.password = prefs.getString('user_password');
  login(currentUser.value);
}

Future<Stream<Address>> getAddresses() async {
  final Uri url = getUri('client-addresses');
  try {
    final streamRest = await client
        .send(http.Request('get', url)..headers.addAll(addressHeaders));
    return streamRest.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .map((data) => Universe.getData2(data as List<dynamic>))
        .expand((element) => (element as List))
        .map((event) {
      // print(event);
      return Address.fromMap(event);
    });
  } catch (e) {
    return Stream.value(Address.fromMap({}));
  }
}

Future<void> addAddress(Address address) async {
  Map<String, dynamic> map = {};
  address.toMap().forEach((key, value) {
    // print(value);
    if (value != null && value.toString() != '') {
      print(value);
      map.addAll({key: value});
    }
  });

  print(map);
  final Uri url = getUri('client-addresses');
  http.Response response =
      await client.post(url, body: json.encode(map), headers: addressHeaders);

  print('the response: ${response.body}');
}

Future<void> editAddress(Address address) async {
  Map<String, dynamic> map = {};
  address.toMap().forEach((key, value) {
    if (value != null && value.toString() != '') {
      map.addAll({key: value});
    }
  });

  final Uri url = getUri('client-addresses/${address.id}');

  http.Response response =
      await client.patch(url, body: json.encode(map), headers: addressHeaders);

  print('the response: ${response.body}');
}

Future<void> deleteAddress(Address address) async {
  final Uri url = getUri('client-addresses/${address.id}');
  http.Response response = await client.delete(url, headers: {
    HttpHeaders.contentTypeHeader: "application/json",
    HttpHeaders.authorizationHeader: "Bearer ${currentUser.value.access_token}"
  });

  return;
}
