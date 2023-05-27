import 'package:bikeshare/config/config.dart';
import 'package:bikeshare/models/Bike.dart';
import 'package:bikeshare/models/User.dart';
import 'package:bikeshare/viewmodels/BikeViewModel.dart';
import 'package:bikeshare/widgets/RoundedColoredButton.dart';
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:intl/intl.dart';



class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  var user= User(
      firstName: "Haddou",
      lastName: "Afaf",
      phone: "0777796960",
      email: "jm_haddou@esi.dz",
      position: "Algiers");
  var bike=Bike(
    id:1,
    name: "Vintage Bike",
    description: "Discover the Vintage Cruiser, a timeless symbol of elegance and nostalgia. With its classic design, sturdy steel frame, and vintage-inspired details, this bike captures the essence of a bygone era.",
    owner: 'Lyna Chikouche',
    price: 1200,
    address: 'El Biar',
    phone: '0789898989',
  );

  WeatherFactory wf = new WeatherFactory("af1120536d27c1029173735a6ab0bdbd");
  final dateToday =DateFormat.yMMMd().format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    final bikeViewModel = BikeViewModel();
    final screenSize = MediaQuery.of(context).size;
    Future<Weather> w = wf.currentWeatherByCityName("Tlemcen");
    Future<double?> celsius = w.then((w) => w.temperature?.celsius);
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(left:30, top:40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello ${user.lastName}",
              style: const TextStyle(
                fontFamily: 'Poppins',
                color:AppColors.yellow,
                fontSize: 24,
                fontWeight: FontWeight.w700,
                height: 2
              ),
            ),
            const Text(
              "Wanna take a ride today ?",
              style: TextStyle(
                  fontFamily: 'Poppins',
                  color:AppColors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  height: 1.2
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "See today's weather",
              style: TextStyle(
                  fontFamily: 'Poppins',
                  color:AppColors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  height: 1.2
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(top:10, bottom:20),
              width: screenSize.width*0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.yellow,
                border: Border.all(
                  color: AppColors.blue,
                  width: 1.0,
                  style: BorderStyle.solid
              ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Text(
                    dateToday.toString(),
                    style:const TextStyle(
                        fontFamily: 'Poppins',
                        color:AppColors.darkGrey,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 1.2
                    )
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                  FutureBuilder<double?>(
                    future: celsius,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // While the future is loading
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        // If an error occurred
                        return Text('Error: ${snapshot.error}');
                      } else {
                        // When the future completes successfully
                        double value = snapshot.data ?? 0.0; // Access the double value
                        return Text('${value.toInt()} °C',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color:AppColors.darkGrey,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                height: 1.2
                            )
                        );
                      }
                    },
                  ),
                          Text("Suitable",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color:AppColors.darkGrey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2
                              )
                          )
                        ],
                      ),
                      Image.asset(
                        'assets/images/suncloud.png', // Replace with your image path
                        width: screenSize.width*0.4,
                        height: 90,
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Text(
              "Nearby bikes",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color:AppColors.darkGrey,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    height: 2
                )

            ),
            Expanded(
              child: FutureBuilder<List<Bike>>(
                future:bikeViewModel.fetchBikes(),
                builder:(context, snapshot){
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot!.data?.length,
                      itemBuilder: (context,index){
                        return Container(
                          margin: const EdgeInsets.only(right: 10, top:10),
                          width: screenSize.width*0.65,
                          height: 240,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                color: AppColors.blue,
                                width: 0.5,
                                style: BorderStyle.solid
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Image.asset(
                                  'assets/images/bycicle.png', // Replace with your image path
                                  width: screenSize.width*0.6,
                                  fit: BoxFit.cover,),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left:10, top:20),
                                child: Text(
                                    snapshot.data![index].name,
                                    style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        color:AppColors.darkGrey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        height: 1.2
                                    )
                                ),
                              ),
                              Container(
                                margin:EdgeInsets.only(top:10, left:10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                        snapshot.data![index].owner,
                                        style: const TextStyle(
                                            fontFamily: 'Poppins',
                                            color:AppColors.darkGrey,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            height: 1.2
                                        )
                                    ),
                                    const Text(
                                        '- 700m far',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color:AppColors.darkGrey,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            height: 1.2
                                        )
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin:EdgeInsets.only(left:10),
                                child: Text(
                                    "${snapshot.data![index].price} DA/Day",
                                    style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        color:AppColors.darkGrey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        height: 2
                                    )
                                ),
                              ),
                              Align(
                                alignment:Alignment.centerRight,
                                child: RoundedColoredButton(
                                    width: 100,
                                    height: 40,
                                    text: "Rent now",
                                    textColor: AppColors.white,
                                    fillColor: AppColors.yellow,
                                    shadowBlurRadius: 0,
                                    onPressed: (){
                                      Navigator.of(context).pushNamed(
                                        "/details",
                                        arguments: snapshot.data![index]
                                      );
                                    }),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }else {

                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context,index){
                        return Container(
                          margin: const EdgeInsets.only(right: 10, top:10),
                          width: screenSize.width*0.65,
                          height: 240,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                color: AppColors.blue,
                                width: 0.5,
                                style: BorderStyle.solid
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Image.asset(
                                  'assets/images/bycicle.png', // Replace with your image path
                                  width: screenSize.width*0.6,
                                  fit: BoxFit.cover,),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left:10, top:20),
                                child: Text(
                                    bike.name,
                                    style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        color:AppColors.darkGrey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        height: 1.2
                                    )
                                ),
                              ),
                              Container(
                                margin:EdgeInsets.only(top:10, left:10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                        bike.owner,
                                        style: const TextStyle(
                                            fontFamily: 'Poppins',
                                            color:AppColors.darkGrey,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            height: 1.2
                                        )
                                    ),
                                    const Text(
                                        '- 700m far',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color:AppColors.darkGrey,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            height: 1.2
                                        )
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin:EdgeInsets.only(left:10),
                                child: Text(
                                    "${bike.price} DA/Day",
                                    style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        color:AppColors.darkGrey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        height: 2
                                    )
                                ),
                              ),
                              Align(
                                alignment:Alignment.centerRight,
                                child: RoundedColoredButton(
                                    width: 100,
                                    height: 40,
                                    text: "Rent now",
                                    textColor: AppColors.white,
                                    fillColor: AppColors.yellow,
                                    shadowBlurRadius: 0,
                                    onPressed: (){
                                      Navigator.of(context).pushNamed("/details", arguments: bike);
                                    }),
                              ),
                            ],
                          ),
                        );
                      },

                    );
                  }
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
