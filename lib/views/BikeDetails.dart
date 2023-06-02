import 'package:bikeshare/config/config.dart';
import 'package:bikeshare/widgets/RoundedColoredButton.dart';
import 'package:bikeshare/widgets/info.dart';
import 'package:flutter/material.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import '../models/Bike.dart';

class BikeDetails extends StatelessWidget {
  BikeDetails({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final bike=ModalRoute.of(context)?.settings.arguments as Bike;
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          ColumnSuper(
            innerDistance: -20,
            children: [
              Container(
                  height: (MediaQuery.of(context).size.height * 1) / 3,
                  width: (MediaQuery.of(context).size.width),
                  decoration: const BoxDecoration(color: AppColors.backgroungBeige),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical:30, horizontal: 10),
                    child: Image.asset(
                      bike.image,
                    ),
                  )),
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.backgroungBeige,
                ),
                child: Container(
                  height: (MediaQuery.of(context).size.height * 2) / 3,
                  width: double.infinity,
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 10,
                      ),
                    ],

                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(bike.name,
                            style:const TextStyle(
                                fontFamily: 'Poppins',
                                color:AppColors.blue,
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                height: 2
                            )),
                        const SizedBox(height:10),
                        Text(
                          bike.description,
                            textAlign: TextAlign.justify,
                            style:const TextStyle(
                                fontFamily: 'Poppins',
                                color:AppColors.darkGrey,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                height: 1.5
                            )
                        ),

                        Container(
                          margin: EdgeInsets.only(right:30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                  "Rental Provider Information",
                                  style:TextStyle(
                                      fontFamily: 'Poppins',
                                      color:AppColors.yellow,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      height: 3
                                  )
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Info(label: "Name", value: bike.owner),
                                  Info(label: "Phone", value: bike.phone),
                                ],
                              ),
                              const SizedBox(height:10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                children: [
                                  Info(label: "Address", value: bike.address),
                                  Info(label: "Price", value: "${bike.price} \$/Day"),
                                ],
                              ),

                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
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
                                Navigator.of(context).pushNamed("/home");
                              }),
                            RoundedColoredButton(
                                width: 120,
                                height: 33,
                                text: "Rent Now",
                                textColor: Colors.white,
                                fillColor: AppColors.yellow,
                                shadowBlurRadius: 0,
                                onPressed: (){
                                  Navigator.of(context).pushNamed(
                                      "/payment",
                                      arguments:bike);
                                })
                        ]
                        )

                      ]),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
