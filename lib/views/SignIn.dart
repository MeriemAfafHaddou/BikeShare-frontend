import 'package:bikeshare/config/colors.dart';
import 'package:bikeshare/viewmodels/UserViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/RoundedColoredButton.dart';

class SignInPage extends StatelessWidget{
  final emailController = TextEditingController();
  final passwordController=TextEditingController();
  showLoaderDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(margin: const EdgeInsets.only(left: 10),child:Text("Loading..." )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }



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
                    color: AppColors.grey,
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
              obscureText: true,
              decoration: InputDecoration(
                  hintText: 'Enter your password',
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    color: AppColors.grey,
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
                onPressed: () async {
                  showLoaderDialog(context);
                  final vm=UserViewModel();
                  await vm.login(emailController.text, passwordController.text);
                  Navigator.of(context)
                        .pushNamed("/sms");
                },
                shadowBlurRadius: 0),

            Row(
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
              child: Row(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don’t have an account ?  ',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                TextButton(
                    onPressed: ()=>{
                      Navigator.of(context).pushNamed("/signUp")
                    },
                    style:TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.only(right:15, left:15),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.yellow,
                        decoration: TextDecoration.underline,
                      ),
                    ),),


              ],
            ),
          ],
        ),
      ),
    );
  }

}