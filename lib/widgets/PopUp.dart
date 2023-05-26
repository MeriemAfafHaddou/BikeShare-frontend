import 'package:bikeshare/widgets/RoundedColoredButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/colors.dart';

class PopUp extends StatelessWidget{
  late String title;
  late String description;
  late String btn1;
  late String btn2;
  VoidCallback onPressed1;
  VoidCallback onPressed2;

  PopUp({
    required this.title,
    required this.description,
    required this.btn1,
    required this.btn2,
    required this.onPressed1,
    required this.onPressed2
});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            20.0,
          ),
        ),
      ),
      contentPadding: const EdgeInsets.only(
        top: 10.0,
      ),
      title: Text(
        title,
          style:const TextStyle(
              fontFamily: 'Poppins',
              color:AppColors.blue,
              fontSize: 16,
              fontWeight: FontWeight.w500,
          )
      ),
      content: Container(
        width: MediaQuery.of(context).size.width*0.9,
        height: MediaQuery.of(context).size.height*0.2,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                description,
                  textAlign: TextAlign.center,
                  style:const TextStyle(
                      fontFamily: 'Poppins',
                      color:AppColors.darkGrey,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      height: 1.7
                  )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RoundedColoredButton(
                      width: 98,
                      height: 33,
                      text: btn1,
                      textColor: AppColors.white,
                      fillColor: AppColors.blue,
                      shadowBlurRadius: 0,
                      onPressed: onPressed1),
                  RoundedColoredButton(
                      width: 100,
                      height: 33,
                      text: btn2,
                      textColor: AppColors.white,
                      fillColor: AppColors.yellow,
                      shadowBlurRadius: 0,
                      onPressed: onPressed2),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}