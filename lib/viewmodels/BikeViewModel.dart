import 'package:bikeshare/models/Bike.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BikeViewModel extends ChangeNotifier {
  late Future<List<Bike>> bikes;
  Future<List<Bike>> fetchBikes() async {
    final url = Uri.parse('https://bikerentalms.onrender.com/bikes');
    final response = await http.get(url);
    print("Response : ${response.statusCode}");
    if (response.statusCode == 200) {
      List myList = jsonDecode(response.body);
      return myList.map((e) => Bike.fromJson(e)).toList();
    } else {
      throw Exception('failed to load tasks,error code: ${response.statusCode}');
    }
  }
}
