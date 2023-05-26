import 'package:bikeshare/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Info extends StatelessWidget {
  String label;
  String value;


  Info({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
            style:const TextStyle(
                fontFamily: 'Poppins',
                color:AppColors.darkGrey,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                height: 1.5
            )

        ),
        Text(
            value,
            style:const TextStyle(
                fontFamily: 'Poppins',
                color:AppColors.darkGrey,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                height: 1.5
            ))
      ],
    );
  }
}