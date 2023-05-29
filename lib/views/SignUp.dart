import 'package:bikeshare/config/colors.dart';
import 'package:bikeshare/widgets/RoundedColoredButton.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var emailController;
    var fullNameController;
    var lastNameController;
    var pwdController;
    var confirmPwdController;
    var phoneController;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: AppColors.white,
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: const Text(
                'Sign Up',
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
                  height: 1
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: TextField(
                controller: fullNameController,
                decoration: InputDecoration(
                    hintText: 'Full name',
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      color: Color(0xff9BAEBC),
                    ),
                    filled: false,
                    contentPadding: const EdgeInsets.only(left: 15,top: 5,bottom: 5),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        width: 1,
                        color: AppColors.blue,
                      ),
                    )),
              ),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    color: Color(0xff9BAEBC),
                  ),
                  filled: false,
                  contentPadding: const EdgeInsets.only(left: 15,top: 5,bottom: 5),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      width: 1.0,
                      color: AppColors.blue,
                    ),
                  )),
            ),
            TextField(
              controller: pwdController,
              decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    color: Color(0xff9BAEBC),
                  ),
                  filled: false,
                  contentPadding: const EdgeInsets.only(left: 15,top: 5,bottom: 5),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      width: 1.0,
                      color: AppColors.blue,
                    ),
                  )),
            ),
            TextField(
              controller: confirmPwdController,
              decoration: InputDecoration(
                  hintText: 'Confirm password',
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    color: Color(0xff9BAEBC),
                  ),
                  filled: false,
                  contentPadding: const EdgeInsets.only(left: 15,top: 5,bottom: 5),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      width: 1.0,
                      color: AppColors.blue,
                    ),
                  )),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                  hintText: 'Phone number',
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    color: Color(0xff9BAEBC),
                  ),
                  filled: false,
                  contentPadding: const EdgeInsets.only(left: 15,top: 5,bottom: 5),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      width: 1.0,
                      color: AppColors.blue,
                    ),
                  )),
            ),
            RoundedColoredButton(
                width: 350,
                height: 50,
                text: 'Next',
                textColor: Colors.white,
                fillColor: AppColors.yellow,
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed("/sms");
                  // await login(emailController.text,passwordController.text);
                  // if(global.globalSessionData?.userId!=null){
                  //   FirebaseMessaging messaging = FirebaseMessaging.instance;
                  //   String? token = await messaging.getToken();
                  //   global.globalSessionData?.token=token!;
                  //   addToken(token!);
                  //   Navigator.of(context)
                  //       .pushNamed("/home");
                  // }else{
                  //   print("incorrect credentials !");
                  // }
                },
                shadowBlurRadius: 0),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.25,
              child: Image.asset("assets/images/illustration.png"),
            ),

          ],
        ),
      ),
    );
  }
}
