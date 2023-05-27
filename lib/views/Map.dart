import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../config/colors.dart';
import '../models/Bike.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  int time = 25;
  final bike=Bike(
    id:1,
    name: "Vintage Bike",
    description: "Discover the Vintage Cruiser, a timeless symbol of elegance and nostalgia. With its classic design, sturdy steel frame, and vintage-inspired details, this bike captures the essence of a bygone era.",
    owner: 'Lyna Chikouche',
    price: 1200,
    address: 'El Biar',
    phone: '0789898989',
  );

  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Stack(
          children: [
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*3/5,
                  child: GoogleMap(
                    mapType: MapType.hybrid,
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                ),
                Container(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    height: MediaQuery.of(context).size.height*2/5,
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
                        const Center(
                          child: Text("Estimated time",
                              style:TextStyle(
                                  fontFamily: 'Poppins',
                                  color:AppColors.blue,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                              )),
                        ),
                        Center(
                          child: Text(
                            time==0? "You arrived !": "${time} min",
                              style:const TextStyle(
                                  fontFamily: 'Poppins',
                                  color:AppColors.grey,
                                  fontSize: 24,
                                  height: 2,
                                  fontWeight: FontWeight.w500,
                              )),
                        ),
                        const Text(
                          "From",
                          style:TextStyle(
                            fontFamily: 'Poppins',
                            color:AppColors.blue,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            height: 2
                          )
                        ),
                        SizedBox(
                          height: 45,
                          child: TextFormField(
                            enabled: false,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),

                              labelText: 'Your location',
                              labelStyle: TextStyle(
                                  fontFamily: 'Poppins',
                                  color:AppColors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                              )
                            ),
                          ),
                        ),
                        const Text(
                            "To",
                            style:TextStyle(
                              fontFamily: 'Poppins',
                              color:AppColors.blue,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              height: 2.5
                            )
                        ),
                        SizedBox(
                          height: 45,
                          child: TextFormField(
                            enabled: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                                labelText: bike.address,
                              labelStyle: const TextStyle(
                                  fontFamily: 'Poppins',
                                  color:AppColors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                              )
                            ),
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
