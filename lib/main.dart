import 'package:bikeshare/views/BikeCode.dart';
import 'package:bikeshare/views/BikeDetails.dart';
import 'package:bikeshare/views/Payment.dart';
import 'package:bikeshare/views/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: BikeCode(),
    );
  }
}