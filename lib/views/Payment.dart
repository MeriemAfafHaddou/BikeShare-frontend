import 'package:bikeshare/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import '../models/Bike.dart';
import '../widgets/PopUp.dart';
import '../widgets/RoundedColoredButton.dart';
import '../widgets/info.dart';

class Payment extends StatefulWidget {
  Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final bike=Bike(
    id:1,
    name: "Vintage Bike",
    description: "Discover the Vintage Cruiser, a timeless symbol of elegance and nostalgia. With its classic design, sturdy steel frame, and vintage-inspired details, this bike captures the essence of a bygone era.",
    owner: 'Lyna Chikouche',
    price: 1200,
    address: 'El Biar',
    phone: '0789898989',
  );

  int days=1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height*1/6,
                decoration: const BoxDecoration(
                  color:AppColors.backgroungBeige,
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color:AppColors.backgroungBeige,
                ),
                child: Container(
                  padding:EdgeInsets.all(30),
                  height: MediaQuery.of(context).size.height*5/6,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40)
                      )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Payment Process",
                          style:TextStyle(
                              fontFamily: 'Poppins',
                              color:AppColors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              height: 2
                          )),
                      const Text(
                          "Your card",
                          textAlign: TextAlign.justify,
                          style:TextStyle(
                              fontFamily: 'Poppins',
                              color:AppColors.yellow,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                          )
                      ),
                      // CreditCardWidget(
                      //   cardNumber: "374245455400126",
                      //   expiryDate:"05/2026",
                      //   cardHolderName: "Afaf HADDOU",
                      //   cvvCode: "4621",
                      //   showBackView: false,
                      //   backgroundImage:'assets/images/card_bg.png',
                      //   onCreditCardWidgetChange: (CreditCardBrand ) {  },
                      //   obscureCardNumber: true,
                      //   obscureInitialCardNumber: false,
                      //   obscureCardCvv: true,
                      //   isHolderNameVisible: false,
                      //   textStyle: TextStyle(color: Colors.white, fontFamily: "OpenSans"),
                      //   width: MediaQuery.of(context).size.width,
                      //   isChipVisible: true,
                      //   isSwipeGestureEnabled: true,
                      //   animationDuration: Duration(milliseconds: 1000),
                      //   customCardTypeIcons: <CustomCardTypeIcon>[
                      //     CustomCardTypeIcon(
                      //       cardType: CardType.visa,
                      //       cardImage: Image.asset(
                      //         'assets/images/visa-pay-logo.png',
                      //         height: 30,
                      //         width: 30,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      Container(
                        width: MediaQuery.of(context).size.width*0.8,
                        height:MediaQuery.of(context).size.height*0.25,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          image:DecorationImage(
                            image: AssetImage('assets/images/card_bg.png')
                          )
                        ),
                        child: Column(
                          crossAxisAlignment:CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 50,
                              padding: const EdgeInsets.all(4),
                              child: Image.asset(
                                'assets/images/visa-pay-logo.png'
                              ),
                            ),
                            Center(
                              child: Text(
                                "●●●● ●●●● ●●●● 8014",
                                  style:TextStyle(
                                      fontFamily: 'Open Sans',
                                      color:AppColors.white,
                                      fontSize: 16,
                                      letterSpacing: 3,
                                      fontWeight: FontWeight.w200,
                                      height: 3
                                  )
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "CARD HOLDER",
                                  style:TextStyle(
                                  fontFamily: 'Open Sans',
                                  color:AppColors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w100,
                                  height: 3
                                  )
                                ),
                                Text(
                                  "EXPIRES",
                                    style:TextStyle(
                                        fontFamily: 'Open Sans',
                                        color:AppColors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w100,
                                        height: 3
                                    )
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Afaf HADDOU",
                                  style:TextStyle(
                                  fontFamily: 'Open Sans',
                                  color:AppColors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  )
                                ),
                                Text(
                                  "08/26",
                                    style:TextStyle(
                                        fontFamily: 'Open Sans',
                                        color:AppColors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                    )
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Text(
                          "Rental Info",
                          style:TextStyle(
                              fontFamily: 'Poppins',
                              color:AppColors.yellow,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                          )
                      ),
                      Container(
                        margin: EdgeInsets.only(right:30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Info(label: "Bike ID", value: bike.id.toString()),
                                Info(label: "Bike Type", value: bike.name),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Info(label: "Bike Owner", value: bike.owner),
                                Info(label: "Phone Number", value: bike.phone),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Period of rental (days)",
                              style:TextStyle(
                                  fontFamily: 'Poppins',
                                  color:AppColors.blue,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  height: 3
                              )
                          ),
                          Row(
                            children: [
                              TextButton(
                                  onPressed: ()=>{
                                    setState((){
                                      days>1? days=days-1:days=1;
                                    })
                                  },
                                  style:TextButton.styleFrom(
                                    minimumSize: Size.zero,
                                    padding: EdgeInsets.only(right:15, left:15),
                                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  child: const Text(
                                      "-",
                                      style:TextStyle(
                                          fontFamily: 'Poppins',
                                          color:AppColors.yellow,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          height: 1.5
                                      )
                                  )),
                              Text(
                                  days.toString(),
                                  style:const TextStyle(
                                      fontFamily: 'Poppins',
                                      color:AppColors.blue,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      height: 3
                                  )
                              ),
                              TextButton(
                                  onPressed: ()=>{
                                    setState((){
                                      days=days+1;
                                    })
                                  },
                                  style:TextButton.styleFrom(
                                    minimumSize: Size.zero,
                                    padding: EdgeInsets.only(right:15, left:15),
                                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  child: const Text(
                                      "+",
                                      style:TextStyle(
                                          fontFamily: 'Poppins',
                                          color:AppColors.yellow,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          height: 1.5
                                      )
                                  )),
                            ],
                          ),


                        ],
                      ),
                      const Text(
                          "Total",
                          style:TextStyle(
                              fontFamily: 'Poppins',
                              color:AppColors.yellow,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              height: 2
                          )
                      ),
                      Text(
                          "${days*bike.price} DA",
                          style:const TextStyle(
                              fontFamily: 'Poppins',
                              color:AppColors.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              height: 1.7
                          )
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
                                  Navigator.of(context).pushNamed("/details");
                                }),
                            RoundedColoredButton(
                                width: 140,
                                height: 33,
                                text: "Proceed to pay",
                                textColor: Colors.white,
                                fillColor: AppColors.yellow,
                                shadowBlurRadius: 0,
                                onPressed: (){
                                  showDialog(context: context, builder: (context) {
                                    return PopUp(
                                        title: "Payment Confirmation",
                                        description: "Please confirm your payment from here",
                                        btn1: "No, I don't",
                                        btn2: "I confirm",
                                        onPressed1: (){
                                          Navigator.of(context).pop();
                                        },
                                        onPressed2: (){
                                          Navigator.of(context).pop();
                                          showDialog(
                                              context: context,
                                              builder: (context) {
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
                                                  title: const Center(
                                                    child: Text(
                                                        "Payment Successful",
                                                        style:TextStyle(
                                                          fontFamily: 'Poppins',
                                                          color:AppColors.yellow,
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.w500,
                                                        )
                                                    ),
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
                                                          const Text(
                                                              "Thank you, you will receive a code within a few seconds",
                                                              textAlign: TextAlign.center,
                                                              style:TextStyle(
                                                                  fontFamily: 'Poppins',
                                                                  color:AppColors.darkGrey,
                                                                  fontSize: 12,
                                                                  fontWeight: FontWeight.w500,
                                                                  height: 1.7
                                                              )
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          Center(
                                                            child: RoundedColoredButton(
                                                                width: 80,
                                                                height: 33,
                                                                text: "Got it !",
                                                                textColor:
                                                                    AppColors.white,
                                                                fillColor:
                                                                    AppColors.yellow,
                                                                shadowBlurRadius:
                                                                    0,
                                                                onPressed:(){
                                                                  Navigator.of(context).pushNamed("/code");
                                                                }
                                                                    ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );;
                                              });
                                        });});
                                  },
                                )
                          ]
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            right: 30,
            top:MediaQuery.of(context).size.height*1/24,
            child: Container(
              width: MediaQuery.of(context).size.width*0.5,
              child: const Image(
                image: AssetImage("assets/images/bycicle.png"),
              ),
            ),
          )
        ],
      )
    );
  }
}