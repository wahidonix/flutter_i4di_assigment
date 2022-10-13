// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

Marker MetalMarker(BuildContext context, LatLng position) {
  return Marker(
    key: Key("Metal${UniqueKey()}"),
    point: position,
    builder: (context) => Icon(
      Icons.location_on,
      color: Colors.red,
    ),
  );
}

Marker PlasticMarker(BuildContext context, LatLng position) {
  return Marker(
    key: ValueKey("Plastic${UniqueKey()}"),
    point: position,
    builder: (context) => Icon(
      Icons.location_on,
      color: Colors.yellow,
    ),
  );
}

Marker OrganicMarker(BuildContext context, LatLng position) {
  return Marker(
    key: ValueKey("Organic${UniqueKey()}"),
    point: position,
    builder: (context) => Icon(
      Icons.location_on,
      color: Colors.green,
    ),
  );
}
