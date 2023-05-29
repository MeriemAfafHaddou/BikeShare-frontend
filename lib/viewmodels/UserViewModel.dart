import 'dart:ffi';

import 'package:bikeshare/models/User.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserViewModel extends ChangeNotifier {
  late Future<User> user;
  Future<User> login(mail, mdp) async {
    final url = Uri.parse('');
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'mail': mail,
          'mdp': mdp,
        }));
    if (response.statusCode == 200) {
      print('Loggedin');
      var jsonResponse = json.decode(response.body);
      return jsonResponse["data"] as User;
    } else {
      throw Exception('Failed to login || error code : ${response.statusCode}');
    }
  }

  Future<Int> register(User user) async {
    final url = Uri.parse('');
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "firstName": user.firstName,
          "lastName": user.lastName,
          "phone": user.phone,
          "email": user.email,
          "position": user.position
        }));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      return jsonResponse["sms"].toInt();
    } else {
      throw Exception('Failed to register || error code : ${response.statusCode}');
    }
  }
}
