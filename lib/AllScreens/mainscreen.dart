import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_uber_app/AllWidgets/Divider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MainScreen extends StatefulWidget {
  static const String idScreen = "MainScreen";

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController newGoogleMapController;

  // カメラの位置 初期値設定
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main screen'),
      ),
      drawer: Container(
        color: Colors.white,
        width: 255.0,
        child: Drawer(
          child: ListView(
            children: [
              // drawer header
              Container(
                height: 165.0,
                child: DrawerHeader(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Row(
                    children: [
                      Image.asset("images/user_icon.png", height: 65.0, width: 65.0,),
                      SizedBox(width: 16.0,),
                      Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Profile Name', style: TextStyle(fontSize: 16.0, fontFamily: "Brand-Bold"),),
                          SizedBox(height: 6.0),
                          Text('Visit Profile'),
                        ],
                      )
                    ]
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              initialCameraPosition: _kGooglePlex,
              // onMapCreatedコールバック時にGoogleMapControllerを使って地図を制御
              onMapCreated: (GoogleMapController controller) {
                _controllerGoogleMap.complete(controller);
                newGoogleMapController = controller;
              }),
          Positioned(
              right: 0.0,
              left: 0.0,
              bottom: 0.0,
              child: Container(
                height: 320.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18.0),
                        topRight: Radius.circular(18.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 16.0,
                        spreadRadius: 0.5,
                        offset: Offset(0.7, 0.7),
                      ),
                    ]
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    SizedBox(height: 6.0),
                    Text('Hi there, ', style: TextStyle(fontSize: 15.0, fontFamily: "Brand-Bold"),),
                    Text('Where to? ', style: TextStyle(fontSize: 20.0, fontFamily: "Brand-Bold"),),
                    SizedBox(height: 20.0),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black54,
                                blurRadius: 6.0,
                                spreadRadius: 0.5,
                                offset: Offset(0.7, 0.7),
                              ),
                            ]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              Icon(Icons.search, color: Colors.blueAccent),
                              SizedBox(width: 10.0),
                              Text("Search Drop Off"),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 24.0),
                      Row(
                        children: [
                          Icon(Icons.home, color: Colors.grey),
                          SizedBox(width: 12.0,),
                          Column(
                            children: [
                              Text('Add Home'),
                              SizedBox(height: 4.0,),
                              Text('Your living home address', style: TextStyle(color: Colors.black54, fontSize: 12.0,),)
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),

                      DividerWidget(),

                      SizedBox(height: 16.0),

                      Row(
                        children: [
                          Icon(Icons.work, color: Colors.grey),
                          SizedBox(width: 12.0,),
                          Column(
                            children: [
                              Text('Add Work'),
                              SizedBox(height: 4.0,),
                              Text('Your office address', style: TextStyle(color: Colors.black54, fontSize: 12.0,),)
                            ],
                          ),
                        ],
                      )
                    ]
                  ),
                ),
              ),
          ),
        ],
      ),
    );
  }
}
