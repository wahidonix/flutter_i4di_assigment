// ignore_for_file: file_names, prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sample_screens/utils/helpfulWidgets.dart';
import 'markers.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

bool metal = true;
bool plastic = true;
bool organic = true;
bool resolved = true;
bool currentUser = true;
bool otherUsers = true;

class _ReportPageState extends State<ReportPage> {
  bool addButtonDisable = false;
  List<Marker> markers = [];
  List<Marker> allMarkers = [];
  List<Marker> get getMarkers {
    return markers;
  }

  List<Marker> get getAllMarkers {
    return allMarkers;
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<LatLng> currentPosition() async =>
      await _determinePosition().then((value) {
        return LatLng(value.latitude, value.longitude);
      }).catchError((e) {
        return LatLng(42.9908, 20.3360);
      }).then((value) {
        return value;
      });

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    return FutureBuilder(
      future: currentPosition(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text("error");
        } else {
          return FlutterMap(
            options: MapOptions(
              center: LatLng(snapshot.data.latitude, snapshot.data.longitude),
              zoom: 17,
              minZoom: 14.0,
              maxZoom: 18.0,
              interactiveFlags:
                  InteractiveFlag.pinchZoom | InteractiveFlag.drag,
            ),
            nonRotatedChildren: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: TextField(
                        cursorColor: Colors.green,
                        controller: _controller,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          hintText: 'What are you searching for?',
                          filled: true,
                          fillColor: Colors.grey[100],
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                                style: BorderStyle.solid, color: Colors.green),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                  color: Colors.grey)),
                        ),
                      ),
                    )),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                  child: TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(40))),
                          context: context,
                          builder: (context) => Filter(),
                        );
                      },
                      child: Container(
                          height: 50,
                          width: 180,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 4,
                                blurRadius: 7,
                                //offset: Offset(0, 3),
                              )
                            ],
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.filter_alt_sharp,
                                color: Colors.black,
                              ),
                              addHorizontalSpace(10),
                              Text(
                                "Filter",
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          )))),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                  child: TextButton(
                      onPressed: () {},
                      child: Container(
                          height: 50,
                          width: 180,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 4,
                                blurRadius: 7,
                                //offset: Offset(0, 3),
                              )
                            ],
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.list,
                                color: Colors.black,
                                size: 30,
                              ),
                              addHorizontalSpace(10),
                              Text(
                                "List View",
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          )))),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 150),
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (addButtonDisable == false) {
                            Random rand = new Random();
                            /*LatLng(
                              snapshot.data.latitude+rand.nextDouble()*0.0007, snapshot.data.longitude+rand.nextDouble()*0.0007);*/
                            allMarkers.add(MetalMarker(
                                context,
                                LatLng(
                                    snapshot.data.latitude +
                                        rand.nextDouble() * 0.003,
                                    snapshot.data.longitude +
                                        rand.nextDouble() * 0.003)));
                            allMarkers.add(PlasticMarker(
                                context,
                                LatLng(
                                    snapshot.data.latitude +
                                        rand.nextDouble() * 0.003,
                                    snapshot.data.longitude +
                                        rand.nextDouble() * 0.003)));
                            allMarkers.add(MetalMarker(
                                context,
                                LatLng(
                                    snapshot.data.latitude +
                                        rand.nextDouble() * 0.003,
                                    snapshot.data.longitude +
                                        rand.nextDouble() * 0.003)));
                            allMarkers.add(OrganicMarker(
                                context,
                                LatLng(
                                    snapshot.data.latitude +
                                        rand.nextDouble() * 0.003,
                                    snapshot.data.longitude +
                                        rand.nextDouble() * 0.003)));
                            allMarkers.add(PlasticMarker(
                                context,
                                LatLng(
                                    snapshot.data.latitude +
                                        rand.nextDouble() * 0.003,
                                    snapshot.data.longitude +
                                        rand.nextDouble() * 0.003)));
                            markers.addAll(allMarkers);
                            addButtonDisable = true;
                          } else {}
                        });
                      },
                      child: Text('DEBUG: Add marker')),
                ),
              ),
            ],
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(
                markers: markers,
              )
            ],
          );
          //snapshot.data.latitude
        }
      },
    );
  }
}
