import 'package:bikeshare/config/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/RoundedColoredButton.dart';

class SignInPage extends StatelessWidget{
  final emailController = TextEditingController();
  final passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height:90,
                  width: 90,
                  child: Image.asset('assets/images/Vector.png'),
                ),
                const Text(
                  'BikeShare',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: AppColors.blue,

                  ),
                ),
              ],
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                  hintText: 'Enter your email',
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
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: 'Enter your password',
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    color: Color(0xff9BAEBC),
                  ),
                  filled: false,
                  contentPadding: const EdgeInsets.only(left: 15,top: 5,bottom: 5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      width: 1.0,
                      color: AppColors.blue,
                    ),
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value){},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      side: MaterialStateBorderSide.resolveWith(
                            (states) => const BorderSide(
                            width: 1.0,
                            color: AppColors.blue
                        ),
                      ),
                    ),
                    const Text(
                      'Remember me',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff9BAEBC),
                      ),
                    ),
                  ],
                ),
                const Text(
                  'Forgot password ?',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff9BAEBC),
                  ),
                ),
              ],
            ),
            RoundedColoredButton(
                width: 350,
                height: 50,
                text: 'Sign In',
                textColor: Colors.white,
                fillColor: AppColors.yellow,
                onPressed: () {
                    Navigator.of(context)
                        .pushNamed("/home");
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
            const Row(
              children: [
                Expanded(
                  child: Divider(
                    indent: 10,
                    endIndent: 10,
                    thickness: 1,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'or',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                Expanded(
                  child: Divider(
                    indent: 10,
                    endIndent: 10,
                    thickness: 1,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Container(
              width: 350,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Color(0xffD9D9D9))),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.g_mobiledata_rounded,
                    size: 30,
                  ),
                  Text(
                    'Login with google',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don’t have an account ?  ',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Sign up',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.yellow,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}