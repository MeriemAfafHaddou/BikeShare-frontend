import 'package:bikeshare/models/Bike.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BikeViewModel extends ChangeNotifier {
  late Future<List<Bike>> bikes;
  Future<List<Bike>> fetchBikes() async {
    final url = 'https://api.example.com/bikes'; // Replace with your API endpoint

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        final bikes = data.map((item) => Bike.fromJson(item)).toList();
        this.bikes=bikes as Future<List<Bike>>;
        return bikes;
      } else {
        throw Exception('Failed to fetch bikes');
      }
    } catch (error) {
      throw Exception('Failed to fetch bikes: $error');
    }
  }

}
