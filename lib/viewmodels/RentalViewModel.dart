import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:bikeshare/models/Rental.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:bikeshare/global.dart' as global;

class RentalViewModel extends ChangeNotifier {
  late Future<Rental> rental;
  late var paymentIntent;
  Future<String> rent(idBike, period,price) async {
    final url = Uri.parse('https://bikerentalms.onrender.com/rent');
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "idUser":global.globalSessionData?.userId,
          "idBike":idBike,
          "period":period,
          "price":price
        }));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      this.rental.then((value) => value.code=jsonResponse["confirmationCode"]);
      return jsonResponse["confirmationCode"];
    } else {
      throw Exception('Failed to rent || error code : ${response.statusCode}, ${response.body}');
    }
  }
  createPaymentIntent(String amount, String currency) async {
    try {
      //Request body
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
      };

      //Make post request to Stripe
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer ${"sk_test_51NCZkbGy0kbFHoHStTfHmPIK1xCF2aMZZOUxccZOPct3dhprBZyldyDB2xtBpOfmHOGfsR4BlIUlv8b29OMVlgDI00pmktSwMw"}',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      return json.decode(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {

        //Clear paymentIntent variable after successful payment
        paymentIntent = null;

      })
          .onError((error, stackTrace) {
        throw Exception(error);
      });
    }
    on StripeException catch (e) {
      print('Error is:---> $e');
    }
    catch (e) {
      print('$e');
    }
  }

  Future<void> makePayment() async {
    try {
      //STEP 1: Create Payment Intent
      paymentIntent = await createPaymentIntent('100', 'USD');

      //STEP 2: Initialize Payment Sheet
      await Stripe.instance
          .initPaymentSheet(

          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntent![
              'client_secret'], //Gotten from payment intent
              style: ThemeMode.light,
              merchantDisplayName: 'Ikay'))
          .then((value) {});

      //STEP 3: Display Payment sheet
      displayPaymentSheet();
    } catch (err) {
      throw Exception(err);
    }
  }




}