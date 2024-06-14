import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:trade_mirror/models/enviornment.dart';

final String _baseUrl = Environment.apiUrl;

Future<dynamic> userLogin(String userEmail, String userPassword) async {
  debugPrint(
      "USER LOGIN: $_baseUrl/user_login?password=$userPassword&email=$userEmail");
  var response = await http.post(
    Uri.parse('$_baseUrl/user_login?password=$userPassword&mail=$userEmail'),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  );
  return response;
}
