import 'package:bikeshare/models/Bike.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BikeViewModel extends ChangeNotifier {
  late Future<List<Bike>> bikes;
  Future<List<Bike>> fetchBikes() async {
    print("ffffff");
    final url = Uri.parse('localhost:3000/bikes');
    print("ffffff");
    final response = await http.get(url);
    print("ffffff");
    print("Response : ${response.statusCode}");
    if (response.statusCode == 200) {
      List myList = jsonDecode(response.body);
      return myList.map((e) => Bike.fromJson(e)).toList();
    } else {
      throw Exception('failed to load tasks,error code: ${response.statusCode}');
    }
  }
}
