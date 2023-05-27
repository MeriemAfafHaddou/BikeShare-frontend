import 'package:flutter/material.dart';

import '../config/colors.dart';
import '../widgets/RoundedColoredButton.dart';

class BikeCode extends StatefulWidget {
  const BikeCode({Key? key}) : super(key: key);

  @override
  State<BikeCode> createState() => _BikeCodeState();
}

class _BikeCodeState extends State<BikeCode> {
  int code=1404;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Stack(
          children: [
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*1/6,
                ),
                Container(
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    height: MediaQuery.of(context).size.height*5/6,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(40),
                            topLeft: Radius.circular(40)
                        ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.8,
                          child: const Image(
                            image: AssetImage("assets/images/bycicle.png"),
                          ),
                        ),
                        const Text("Bike code",
                            style:TextStyle(
                                fontFamily: 'Poppins',
                                color:AppColors.blue,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                height: 2
                            )),
                        const Text(
                          "Thank you for renting this bike, here is the code you should use to unlock it ",
                            style:TextStyle(
                                fontFamily: 'Poppins',
                                color:AppColors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                height: 1.5
                            )),
                        Center(
                          child: Text(
                            code!.toString(),
                            style:const TextStyle(
                            fontFamily: 'Poppins',
                            color:AppColors.blue,
                            fontSize: 36,
                            letterSpacing: 40,
                            fontWeight: FontWeight.w500,
                            height:2
                            )
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Click below to see full itenary to the bike’s location.",
                            style:TextStyle(
                                fontFamily: 'Poppins',
                                color:AppColors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                height: 1.5
                            )),
                        Container(
                          margin: const EdgeInsets.only(top:20),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:[
                                RoundedColoredButton(
                                    width: 100,
                                    height: 33,
                                    text: "Back",
                                    textColor: Colors.white,
                                    fillColor: AppColors.blue,
                                    shadowBlurRadius: 0,
                                    onPressed: (){
                                      Navigator.of(context).pushNamed("/payment");
                                    }),
                                RoundedColoredButton(
                                  width: 140,
                                  height: 33,
                                  text: "Check itenary",
                                  textColor: Colors.white,
                                  fillColor: AppColors.yellow,
                                  shadowBlurRadius: 0,
                                  onPressed: (){
                                    Navigator.of(context).pushNamed("/map");
                                  },
                                )
                              ]
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
    );
  }
}
