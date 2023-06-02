import 'dart:ffi';

import 'package:bikeshare/models/User.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../global.dart' as global;

class UserViewModel extends ChangeNotifier {
  late Future<User> user;
  Future<void> login(mail, mdp) async {
    final url = Uri.parse('https://userms.onrender.com/login');
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'email': mail,
          'password': mdp,
        }));
    if (response.statusCode == 200) {
      print("Response ${response.body}");
    } else {
      throw Exception('Failed to login || error code : ${response.statusCode}');
    }
  }

  Future<String> register(User user) async {
    final url = Uri.parse('https://userms.onrender.com/register');
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "name":user.name,
          "email":user.email,
          "password":user.password,
          "phone":user.phone,
          "address":user.address,
        }));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      print("Response ${response.body}");
      return jsonResponse["message"];
    } else {
      throw Exception('Failed to register || error code : ${response.statusCode} || ${response.body}');
    }
  }

  Future<String> doubleAuth(code) async {
    final url = Uri.parse('https://userms.onrender.com/double-auth');
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "email":global.globalSessionData?.email,
          "code":code,
        }));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      global.globalSessionData?.userId=jsonResponse["authToken"];
      return jsonResponse["authToken"];
    } else {
      throw Exception('Failed to register || error code : ${response.statusCode}, ${response.body}');
    }
  }
}
