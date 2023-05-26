import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RoundedColoredButton extends StatelessWidget {
  double width;
  double height;
  Color textColor;
  Color fillColor;
  String text;
  VoidCallback onPressed;
  double shadowBlurRadius;


  RoundedColoredButton({
    Key? key,
    required this.width,
    required this.height,
    required this.text,
    required this.textColor,
    required this.fillColor,
    required this.shadowBlurRadius,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
      child: TextButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 6, horizontal: 12)),
            fixedSize: MaterialStateProperty.all(Size(
              this.width,
              this.height,
            )),
            foregroundColor: MaterialStateProperty.all(this.textColor),
            backgroundColor: MaterialStateProperty.all(this.fillColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          onPressed: this.onPressed,
          child: Container(
            child: Text(
              this.text,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500
              ),
            ),
          )
      ),
    );
  }
}