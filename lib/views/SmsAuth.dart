import 'package:bikeshare/config/colors.dart';
import 'package:bikeshare/viewmodels/UserViewModel.dart';
import 'package:bikeshare/widgets/RoundedColoredButton.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class SmsAuth extends StatelessWidget {
  const SmsAuth({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: AppColors.white,
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.1,
            ),
            Center(
              child: const Text(
                'Sign In',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 34,
                  height: 2,
                  color: AppColors.yellow,
                ),
              ),
            ),
            Center(
              child: const Text(
                'Wanna take a ride today?',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: AppColors.blue,
                    height: 2
                ),
              ),
            ),
            Text(
              "Please enter the SMS code we sent you ",
                style:TextStyle(
                    fontFamily: 'Poppins',
                    color:AppColors.darkGrey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 8
                )
            ),
            Container(
              padding:const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              height:80,
              child: OTPTextField(
                length: 4,
                width: MediaQuery.of(context).size.width,
                fieldWidth: 60,
                otpFieldStyle: OtpFieldStyle(
                    borderColor: AppColors.yellow,
                    focusBorderColor: AppColors.yellow,
                    enabledBorderColor: AppColors.yellow,
                ),
                style: TextStyle(
                    fontSize: 24,
                  color:AppColors.blue,
                  fontWeight: FontWeight.w600,
                  height:1.5
                ),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.box,
                onCompleted: (pin) {
                  final userVM=UserViewModel();
                  userVM.doubleAuth(pin);
                  print("Completed: " + pin);
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
            RoundedColoredButton(
                width: 350,
                height: 50,
                text: 'Done',
                textColor: Colors.white,
                fillColor: AppColors.yellow,
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed("/home");},
                shadowBlurRadius: 0),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.2,
            ),
          ],
        ),
      ),
    );
  }
}
