import 'package:bikeshare/models/CreditCard.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CreditCardViewModel extends ChangeNotifier {
  late Future<CreditCard> creditCard;
  Future<CreditCard> fetchBikes() async {
    final url = 'https://api.example.com/bikes'; // Replace with your API endpoint

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        this.creditCard=data;
        return data;
      } else {
        throw Exception('Failed to fetch bikes');
      }
    } catch (error) {
      throw Exception('Failed to fetch bikes: $error');
    }
  }

}
