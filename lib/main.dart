import 'package:bikeshare/views/BikeCode.dart';
import 'package:bikeshare/views/BikeDetails.dart';
import 'package:bikeshare/views/Map.dart';
import 'package:bikeshare/views/Payment.dart';
import 'package:bikeshare/views/SignIn.dart';
import 'package:bikeshare/views/SignUp.dart';
import 'package:bikeshare/views/SmsAuth.dart';
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
      routes: {
        "/home": (_)=> Home(),
        "/details": (_)=> BikeDetails(),
        "/payment": (_)=> Payment(),
        "/code": (_)=> BikeCode(),
        "/map": (_)=> Map(),
        "/signUp": (_)=> SignUpPage(),
        "/sms": (_)=> SmsAuth()
      },
      debugShowCheckedModeBanner:false,
      home: SignInPage(),
    );
  }
}