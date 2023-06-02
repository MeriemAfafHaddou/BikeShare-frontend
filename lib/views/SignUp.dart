import 'package:bikeshare/config/colors.dart';
import 'package:bikeshare/models/User.dart';
import 'package:bikeshare/viewmodels/UserViewModel.dart';
import 'package:bikeshare/widgets/RoundedColoredButton.dart';
import 'package:flutter/material.dart';
import '../global.dart' as global;
class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  var emailController= TextEditingController();
  var fullNameController= TextEditingController();
  var pwdController= TextEditingController();
  var phoneController= TextEditingController();
  var addressController= TextEditingController();
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
              obscureText: true,
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
              controller: addressController,
              decoration: InputDecoration(
                  hintText: 'Address',
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
                onPressed: () async {
                  showLoaderDialog(context);
                  final User user= User(
                      name: fullNameController.text,
                      password: pwdController.text,
                      phone: phoneController.text,
                      email: emailController.text,
                      address: addressController.text);
                  print("${user.name} - ${user.password} - ${user.phone} - ${user.email} - ${user.address}");
                  global.globalSessionData?.name=user.name;
                  global.globalSessionData?.email=user.email;
                  global.globalSessionData?.password=user.password;
                  global.globalSessionData?.address=user.address;
                  final userVM=UserViewModel();
                  await userVM.register(user);
                  await userVM.login(user.email, user.password);
                  Navigator.of(context)
                      .pushNamed("/sms");
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
